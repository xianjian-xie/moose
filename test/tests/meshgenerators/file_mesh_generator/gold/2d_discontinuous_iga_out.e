CDF      
      len_name      	time_step          num_dim       	num_nodes      4   num_elem      
num_el_blk        num_el_in_blk1        num_nod_per_el1    	   num_el_in_blk2        num_nod_per_el2       num_nod_var       num_info  |   len_line   Q         api_version       A   version       A   floating_point_word_size            	file_size               maximum_name_length              int64_status             title         2d_discontinuous_iga_out.e           
time_whole                            ��   	eb_status                             X   eb_prop1               name      ID              `   coordx                     �      h   coordy                     �         eb_names                   
_FillValue                        �   
coor_names                     
_FillValue                        
�   node_num_map                    �      �   connect1                  	elem_type         QUAD9         �      x   connect2         	         	elem_type         SPHERE        @         elem_num_map                    P      H   name_nod_var      
             
_FillValue                        �   vals_nod_var1                         �      ��   info_records                      x<      �             ?�      ?�     $?ڂy���=��%����?�������?������+?����d�.=�a���?�ffffg?�ffffgC?Ҏ�R1�0=�$����_?�333338?�33333Z?���0��=�ֿ����?�      ?�     $?栞fyM?�������?������+?�][\?��?陙���?陙���7?�Q���?栞fyM?ڂy���=��%����?�][\?��?����d�.=�a���?�Q���?�5.��=�9�?���?陙���?陙���7?�Q���?�ffffg?�ffffgC?߭��D[?�333338?�33333Z?�'$z�^Z?�Q���?�5.��=�9�?���?߭��D[?Ҏ�R1�0=�$����_?�'$z�^Z?���0��=�ֿ����<�������?ڂy���I?�������?�     <�?�����?����cId?����̌�?�������<�������?Ҏ�R0��?�ffff5?�ffffg<�������?���/W?�3333`?�333335<�������?ڂy���I?栞f~��<�?�����?����cId?�][\?�<������?�5.��?�Q�2�?栞f~��?�������?�     ?�][\?�?����̌�?�������?�Q�2�?陙��`�?陙���<������?�5.��?�Q�2�<�������?Ҏ�R0��?߭��~��<�������?���/W?�'$z��v?�Q�2�?陙��`�?陙���?߭��~��?�ffff5?�ffffg?�'$z��v?�3333`?�333335                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           	   
                                                                      !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /   0   1   2   3   4                                    "             !         #   %   +   )   $   (   *   &   '   ,   .   4   2   -   1   3   /   0                           	   
                                             	   
                              u                                                                                                                                                                                                                                                               #################### ���A]?���Ay?�|1�d�=�ֿ����?��T�	�?��8z͡?���g��?��# Created by MOOSE # ��¿�?�j��?�&�!���?���g��?��l�w�=��%����?��0h��?��T>�#################### 3���0=�9�?���?���¿�?�j��?�&�!���?�m�=��?�dQ���?�f���@### Command Line Arguments ### ��?ґ3���2=�9�?���?�f���@�?�NIO��=�$�K���?�Xzrl  /home/stogrh/git/moose-fresh/test/moose_test-dbg -i 2d_discontinuous_iga.i -... -error --error-override --no-gdb-backtrace### Version Info ###                   Framework Information:                                                           MOOSE Version:           git commit 41ca27cb30 on 2023-10-28                     LibMesh Version:         b79d1f8503c2f20e679ec4a20960d8cd7e0d4a59                PETSc Version:           3.19.0                                                  SLEPc Version:           3.18.3                                                  Current Time:            Thu Nov  2 09:46:54 2023                                Executable Timestamp:    Thu Nov  2 09:44:16 2023                                                                                                                                                                                                  ### Input File ###                                                                                                                                                []                                                                                 _unique_action_name            = AddRelationshipManager                          control_tags                   = INVALID                                         inactive                       = (no_default)                                    initial_from_file_timestep     = LATEST                                          initial_from_file_var          = INVALID                                         initial_dt                     = INVALID                                         lower_bound                    = INVALID                                         allow_negative_qweights        = 1                                               custom_blocks                  = (no_default)                                    custom_orders                  = INVALID                                         element_order                  = AUTO                                            order                          = AUTO                                            side_order                     = AUTO                                            type                           = GAUSS                                         []                                                                                                                                                                [Executioner]                                                                      _unique_action_name            = CreateExecutionerActionExecutioner              auto_preconditioning           = 1                                               control_tags                   = INVALID                                         inactive                       = (no_default)                                    isObjectAction                 = 1                                               type                           = Transient                                       abort_on_solve_fail            = 0                                               accept_on_max_fixed_point_iteration = 0                                          accept_on_max_picard_iteration = 0                                               auto_advance                   = INVALID                                         automatic_scaling              = INVALID                                         check_aux                      = 0                                               compute_initial_residual_before_preset_bcs = 0                                   compute_scaling_once           = 1                                               contact_line_search_allowed_lambda_cuts = 2                                      contact_line_search_ltol       = INVALID                                         custom_abs_tol                 = 1e-50                                           custom_pp                      = INVALID                                         custom_rel_tol                 = 1e-08                                           direct_pp_value                = 0                                               disable_fixed_point_residual_norm_check = 0                                      disable_picard_residual_norm_check = 0                                           dt                             = 1                                               dtmax                          = 1e+30                                           dtmin                          = 1                                               enable                         = 1                                               end_time                       = 1e+30                                           error_on_dtmin                 = 1                                               fixed_point_abs_tol            = 1e-50                                           fixed_point_algorithm          = picard                                          fixed_point_force_norms        = 0                                               fixed_point_max_its            = 1                                               fixed_point_min_its            = 1                                               fixed_point_rel_tol            = 1e-08                                           ignore_variables_for_autoscaling = INVALID                                       l_abs_tol                      = 1e-50                                           l_max_its                      = 10000                                           l_tol                          = 1e-05                                           line_search                    = default                                         line_search_package            = petsc                                           max_xfem_update                = 4294967295                                      mffd_type                      = wp                                              n_max_nonlinear_pingpong       = 100                                             n_startup_steps                = 0                                               nl_abs_div_tol                 = 1e+50                                           nl_abs_step_tol                = 0                                               nl_abs_tol                     = 1e-50                                           nl_div_tol                     = 1e+10                                           nl_forced_its                  = 0                                               nl_max_funcs                   = 10000                                           nl_max_its                     = 50                                              nl_rel_step_tol                = 0                                               nl_rel_tol                     = 1e-08                                           normalize_solution_diff_norm_by_dt = 1                                           num_grids                      = 1                                               num_steps                      = 2                                               off_diagonals_in_auto_scaling  = 0                                               outputs                        = INVALID                                         petsc_options                  = INVALID                                         petsc_options_iname            = INVALID                                         petsc_options_value            = INVALID                                         picard_abs_tol                 = 1e-50                                           picard_custom_pp               = INVALID                                         picard_force_norms             = 0                                               picard_max_its                 = 1                                               picard_rel_tol                 = 1e-08                                           relaxation_factor              = 1                                               relaxed_variables              = (no_default)                                    reset_dt                       = 0                                               resid_vs_jac_scaling_param     = 0                                               residual_and_jacobian_together = 0                                               restart_file_base              = (no_default)                                    reuse_preconditioner           = 0                                               reuse_preconditioner_max_linear_its = 25                                         scaling_group_variables        = INVALID                                         scheme                         = implicit-euler                                  skip_exception_check           = 0                                               snesmf_reuse_base              = 1                                               solve_type                     = NEWTON                                          splitting                      = INVALID                                         ss_check_tol                   = 1e-08                                           ss_tmin                        = 0                                               start_time                     = 0                                               steady_state_detection         = 0                                               steady_state_start_time        = 0                                               steady_state_tolerance         = 1e-08                                           time_period_ends               = INVALID                                         time_period_starts             = INVALID                                         time_periods                   = INVALID                                         timestep_tolerance             = 1e-12                                           trans_ss_check                 = 0                                               transformed_postprocessors     = (no_default)                                    transformed_variables          = (no_default)                                    update_xfem_at_timestep_begin  = 0                                               use_multiapp_dt                = 0                                               verbose                        = 0                                             []                                                                                                                                                                [ICs]                                                                                                                                                               [./u]                                                                              _unique_action_name          = AddInitialConditionActionadd_icICs/u              control_tags                 = INVALID                                           inactive                     = (no_default)                                      isObjectAction               = 1                                                 type                         = FunctionIC                                        block                        = INVALID                                           boundary                     = INVALID                                           enable                       = 1                                                 function                     = sin(x)                                            ignore_uo_dependency         = 0                                                 prop_getter_suffix           = (no_default)                                      scaling_factor               = 1                                                 variable                     = u                                               [../]                                                                          []                                                                                                                                                                [Kernels]                                                                                                                                                           [./diff]                                                                           _unique_action_name          = AddKernelActionadd_kernelKernels/diff             control_tags                 = INVALID                                           inactive                     = (no_default)                                      isObjectAction               = 1                                                 type                         = Diffusion                                         absolute_value_vector_tags   = INVALID                                           block                        = 0                                                 diag_save_in                 = INVALID                                           displacements                = INVALID                                           enable                       = 1                                                 extra_matrix_tags            = INVALID                                           extra_vector_tags            = INVALID                                           implicit                     = 1                                                 matrix_tags                  = system                                            prop_getter_suffix           = (no_default)                                      save_in                      = INVALID                                           seed                         = 0                                                 use_displaced_mesh           = 0                                                 variable                     = u                                                 vector_tags                  = nontime                                         [../]                                                                                                                                                             [./null]                                                                           _unique_action_name          = AddKernelActionadd_kernelKernels/null             control_tags                 = INVALID                                           inactive                     = (no_default)                                      isObjectAction               = 1                                                 type                         = NullKernel                                        absolute_value_vector_tags   = INVALID                                           block                        = 1                                                 diag_save_in                 = INVALID                                           displacements                = INVALID                                           enable                       = 1                                                 extra_matrix_tags            = INVALID                                           extra_vector_tags            = INVALID                                           implicit                     = 1                                                 jacobian_fill                = 1e-09                                             matrix_tags                  = system                                            prop_getter_suffix           = (no_default)                                      save_in                      = INVALID                                           seed                         = 0                                                 use_displaced_mesh           = 0                                                 variable                     = u                                                 vector_tags                  = nontime                                         [../]                                                                                                                                                             [./time]                                                                           _unique_action_name          = AddKernelActionadd_kernelKernels/time             control_tags                 = INVALID                                           inactive                     = (no_default)                                      isObjectAction               = 1                                                 type                         = TimeDerivative                                    absolute_value_vector_tags   = INVALID                                           block                        = 0                                                 diag_save_in                 = INVALID                                           displacements                = INVALID                                           enable                       = 1                                                 extra_matrix_tags            = INVALID                                           extra_vector_tags            = INVALID                                           implicit                     = 1                                                 lumping                      = 0                                                 matrix_tags                  = 'system time'                                     prop_getter_suffix           = (no_default)                                      save_in                      = INVALID                                           seed                         = 0                                                 use_displaced_mesh           = 0                                                 variable                     = u                                                 vector_tags                  = time                                            [../]                                                                          []                                                                                                                                                                [Mesh]                                                                             _unique_action_name            = CreateDisplacedProblemActionMesh                control_tags                   = (no_default)                                    displacements                  = INVALID                                         inactive                       = (no_default)                                    use_displaced_mesh             = 1                                               include_local_in_ghosting      = 0                                               output_ghosting                = 0                                               block_id                       = INVALID                                         block_name                     = INVALID                                         boundary_id                    = (no_default)                                    boundary_name                  = (no_default)                                    construct_side_list_from_node_list = 0                                           ghosted_boundaries             = (no_default)                                    ghosted_boundaries_inflation   = INVALID                                         isObjectAction                 = 1                                               second_order                   = 0                                               skip_deletion_repartition_after_refine = 0                                       skip_partitioning              = 0                                               split_file                     = (no_default)                                    type                           = FileMesh                                        uniform_refine                 = 0                                               use_split                      = 0                                               add_subdomain_ids              = INVALID                                         allow_renumbering              = 0                                               alpha_rotation                 = INVALID                                         beta_rotation                  = INVALID                                         block                          = INVALID                                         build_all_side_lowerd_mesh     = 0                                               centroid_partitioner_direction = INVALID                                         construct_node_list_from_side_list = 1                                           coord_block                    = INVALID                                         coord_type                     = XYZ                                             dim                            = 1                                               enable                         = 1                                               final_generator                = INVALID                                         gamma_rotation                 = INVALID                                         ghosting_patch_size            = INVALID                                         length_unit                    = INVALID                                         max_leaf_size                  = 10                                              nemesis                        = 0                                               parallel_type                  = DEFAULT                                         partitioner                    = default                                         patch_size                     = 40                                              patch_update_strategy          = never                                           rz_coord_axis                  = Y                                               rz_coord_blocks                = INVALID                                         rz_coord_directions            = INVALID                                         rz_coord_origins               = INVALID                                         skip_refine_when_use_split     = 1                                               up_direction                   = INVALID                                                                                                                          [./cyl2d_iga]                                                                      _unique_action_name          = AddMeshGeneratorActionMesh/cyl2d_iga              control_tags                 = INVALID                                           inactive                     = (no_default)                                      isObjectAction               = 1                                                 type                         = FileMeshGenerator                                 allow_renumbering            = 1                                                 clear_spline_nodes           = 0                                                 discontinuous_spline_extraction = 1                                              enable                       = 1                                                 exodus_extra_element_integers = INVALID                                          file                         = /home/stogrh/git/moose-fresh/test/tests/me... shgenerators/file_mesh_generator/PressurizedCyl_Patch6_4Elem.e                       nemesis                      = 0                                                 output                       = 0                                                 save_with_name               = (no_default)                                      show_info                    = 0                                                 skip_partitioning            = 0                                                 use_for_exodus_restart       = 0                                               [../]                                                                          []                                                                                                                                                                [Mesh]                                                                                                                                                              [./cyl2d_iga]                                                                    [../]                                                                          []                                                                                                                                                                [Mesh]                                                                                                                                                              [./cyl2d_iga]                                                                    [../]                                                                          []                                                                                                                                                                [Outputs]                                                                          _unique_action_name            = CommonOutputActionOutputs                       append_date                    = 0                                               append_date_format             = INVALID                                         checkpoint                     = 0                                               color                          = 1                                               console                        = 1                                               control_tags                   = (no_default)                                    controls                       = 0                                               csv                            = 0                                               dofmap                         = 0                                               execute_on                     = 'INITIAL TIMESTEP_END'                          exodus                         = 1                                               file_base                      = INVALID                                         gmv                            = 0                                               gnuplot                        = 0                                               hide                           = INVALID                                         inactive                       = (no_default)                                    interval                       = 1                                               json                           = 0                                               minimum_time_interval          = 0                                               nemesis                        = 0                                               output_if_base_contains        = INVALID                                         perf_graph                     = 0                                               perf_graph_live                = 1                                               perf_graph_live_mem_limit      = 100                                             perf_graph_live_time_limit     = 5                                               print_linear_converged_reason  = 1                                               print_linear_residuals         = 1                                               print_mesh_changed_info        = 0                                               print_nonlinear_converged_reason = 1                                             print_nonlinear_residuals      = 1                                               print_perf_log                 = 0                                               show                           = INVALID                                         solution_history               = 0                                               sync_times                     = (no_default)                                    tecplot                        = 0                                               vtk                            = 0                                               xda                            = 0                                               xdr                            = 0                                               xml                            = 0                                             []                                                                                                                                                                [Variables]                                                                                                                                                         [./u]                                                                              _unique_action_name          = AddVariableActionVariables/u                      control_tags                 = INVALID                                           family                       = RATIONAL_BERNSTEIN                                inactive                     = (no_default)                                      initial_condition            = INVALID                                           isObjectAction               = 1                                                 order                        = SECOND                                            scaling                      = INVALID                                           type                         = MooseVariableBase                                 initial_from_file_timestep   = LATEST                                            initial_from_file_var        = INVALID                                           array                        = 0                                                 block                        = INVALID                                           components                   = 1                                                 eigen                        = 0                                                 enable                       = 1                                                 fv                           = 0                                                 nl_sys                       = nl0                                               outputs                      = INVALID                                           use_dual                     = 0                                               [../]                                                                          []                                                                                       ?��T�	�?��T�	?����=��%����?��]�[?��]�{?�OU�Ғ-=�a���?�niF:?�niFa?�L?���=�$����_?���A]?���Ay?�|1�d�=�ֿ����?��T�	�?��8z͡?���g��?��;e�?����l�?��0h��?���¿�?�j��?�&�!���?���g��?��l�w�=��%����?��0h��?��T>���=�a����?�&�!���?ґ3���0=�9�?���?���¿�?�j��?�&�!���?�m�=��?�dQ���?�f���@�?���A]?����E(?�Xzrl ?�&�!���?ґ3���2=�9�?���?�f���@�?�NIO��=�$�K���?�Xzrl ?��ۭpu=�ֿ����?�      ?�>���?�V���?�|Z�&�?��|�.`?୒��í?ీF>?�z�T��?��6Thݒ?���d�v�?��ȹ	�?�z[�>�?����y�?�}�G��`?�{��
q?�|'X�/8?��R���?�>���?�f���I�?��ܟ�?ਧE�o�?�`s��K�?���H�6?��9�y�3?�P�d�Ұ?���C'"�?��ܟ�?���=�P�?��|�.`?���H�6?�ޭz�?��YƦ6�?���C'"�?�߹_E�?������G?��9�y�3?�P�d�Ұ?���C'"�?����ҕ�?�@[έ�?�÷�E�?�}�G��`?�7���?޺QN� ?���C'"�?�߹_E�?������G?�÷�E�?��t䳇�?���ܢ��?޺QN� ?��V��?��R���@       ?�#�t�?����\7?�g2ǅ��?�]|�?���ӏ�?��kc�?�gU�6 �?�]�m�y?��b�ǒ?�R���?�l�i�$?�d�n��?���E^�?�\�O��?�m��&�6?�e���e�?�#�t�?��ו��?޾�5��?�� ?��a8�?޾�Bϑ(?�k%�+�?�����?޾y���?޾�5��?�y��#�n?�]|�?޾�Bϑ(?�z#���K?�^���W�?޾y���?�{�!d�V?�a8;H&?�k%�+�?�����?޾y���?���a?����M5?޾B$8�?���E^�?��_�]�?޽�*;?޾y���?�{�!d�V?�a8;H&?޾B$8�?�}��4�@?�d��/�?޽�*;?�~�̐}�?�e���e�