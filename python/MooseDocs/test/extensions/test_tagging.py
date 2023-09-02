#!/usr/bin/env python3
#* This file is part of the MOOSE framework
#* https://www.mooseframework.org
#*
#* All rights reserved, see COPYRIGHT for full restrictions
#* https://github.com/idaholab/moose/blob/master/COPYRIGHT
#*
#* Licensed under LGPL 2.1, please see LICENSE for details
#* https://www.gnu.org/licenses/lgpl-2.1.html

import unittest
import logging
from MooseDocs import common, base
from MooseDocs.common import exceptions
from MooseDocs.test import MooseDocsTestCase
from MooseDocs.extensions import core, command, tagging
logging.basicConfig()

class TestTaggingInit(MooseDocsTestCase):
    EXTENSIONS = [core, command, tagging]

    def setupExtension(self, ext):
        if ext == tagging:
            return dict(active=True)

    def test(self):
        with self.assertLogs(level=logging.WARNING) as cm:
            self._MooseDocsTestCase__setup()
        self.assertEqual(len(cm.output), 2)
        self.assertIn('No javascript file identified.', cm.output[0])
        self.assertIn('The tagging extension is experimental!', cm.output[1])

class TestTaggingCommand(MooseDocsTestCase):
    EXTENSIONS = [core, command, tagging]
    TEXT = '!tagger test application:moose foo:bar'
    TEXT_POSTSPACE = '!tagger test  application:moose foo:bar'
    TEXT_PRESPACE = '!tagger  test application:moose foo:bar'
    TEXT_DUPLICATE = '!tagger test application:moose application:bar'
    TEXT_NOT_ALLOWED = '!tagger test application:moose application_wrong:bar'
    TEXT_NO_KEYS = '!tagger test'

    def setupExtension(self, ext):
        if ext == tagging:
            return dict(active=True, allowed_keys=['application', 'foo'], js_file='tagging.js')

    def setupContent(self):
        config = [dict(root_dir='python/MooseDocs/test/content', content=['js/tagging.js'])]
        return common.get_content(config, '.md')

    def testStandardUsage(self):
        with self.assertLogs(level=logging.INFO) as cm: # For warning suppression. TODO: remove cm when non-experimental
            ast = self.tokenize(self.TEXT)
            ast2 = self.tokenize(self.TEXT_POSTSPACE)
        self.assertSize(ast, 0)

    def testPostNameSpaceAllowed(self):
        with self.assertLogs(level=logging.INFO) as cm: # For warning suppression. TODO: remove cm when non-experimental
            ast = self.tokenize(self.TEXT_POSTSPACE)
        self.assertSize(ast, 0)

    def testPreNameSpaceError(self):
        with self.assertLogs(level=logging.ERROR) as cm:
            ast = self.tokenize(self.TEXT_PRESPACE)
        self.assertEqual(len(cm.output), 1)
        self.assertIn('TOKENIZE ERROR: list index out of range', cm.output[0])
        self.assertSize(ast, 1)

    def testDuplicateKey(self):
        with self.assertLogs(level=logging.ERROR) as cm:
            ast = self.tokenize(self.TEXT_DUPLICATE)
        self.assertEqual(len(cm.output), 1)
        self.assertIn("Following 'key' provided more than once;", cm.output[0])
        self.assertSize(ast, 0)

    def testNotAllowed(self):
        with self.assertLogs(level=logging.WARNING) as cm:
            ast = self.tokenize(self.TEXT_NOT_ALLOWED)
        self.assertEqual(len(cm.output), 2)
        self.assertIn("Provided 'key' not in allowed_keys", cm.output[1])
        self.assertSize(ast, 0)

    def testNoKeys(self):
        with self.assertLogs(level=logging.ERROR) as cm:
            ast = self.tokenize(self.TEXT_NO_KEYS)
        self.assertEqual(len(cm.output), 1)
        self.assertIn("No key:value pairs provided", cm.output[0])
        self.assertSize(ast, 0)

if __name__ == '__main__':
    unittest.main(verbosity=2)

