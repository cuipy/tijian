/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.21 : Database - wshbj
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `act_evt_log` */

DROP TABLE IF EXISTS `act_evt_log`;

CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_evt_log` */

/*Table structure for table `act_ge_bytearray` */

DROP TABLE IF EXISTS `act_ge_bytearray`;

CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_bytearray` */

insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('13531562715648eb95ded20283949233',1,'source',NULL,'{\"id\":\"canvas\",\"resourceId\":\"canvas\",\"properties\":{\"process_author\":\"jeesite\"},\"stencilset\":{\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\"}}',NULL),('56ffeda858254176979f10adf9416e65',1,'test_audit.png','bcd1a51bb11b4c4ca58480103ab969f7','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0|\0\0\0=ӳ�\0\0S�IDATx���|T����S����h�˲�l�e�ծZ1��4�X��K]��RVV�\"�Z/�\"\Z1�c\nĀ����D.I�c�1f��E��c��>�9�03�I2I��L^�����\\�\\2��>s>sΜ1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��/\0\0\0\0\0�+�,e�\0\0\0\0\0� ެ/�J����%\0\0\0\0�s�m�ɖ-ܟ�t\0\0\0\0�y�vk�\0\0\0\0�V$��T���n\0\0\0\0\0�l�[k���\r\0\0\0\0@��m�vz\0\0\0\0\0�m�=�����\0\0\0\0���κ=\0\0\0\0\0Q�����~\0\0\0\0\0��f��vgK7\0\0\0\0���=���̺����q 5\0\0\0\0@�o��x4���R�߶6݁nG�\r\0\0\0\0��Ͷ��j�UM�g�m�D���N7\0\0\0\0����k�[j��M��gz��\r\0\0\0\0�6�vBM�����Ͷo����\0\0\0\0���֦���;�f���?3��\r\0\0\0\0��f���n���G;�m��\0\0\0\0t�f������vG�\0\0\0\0\0a��[��5�i�}�n��\r\0\0\0\0],ά���6k�լ)�M����^v#�ݲ]e]�I���(��(*ʪάj�r�z�poh�E;�p��\Z���Ud��ƙu�Y}xyڤ������-�m���@��\r\0\0�h$}� ý���2[�:h�76���A��l5ڋͺ���C���3N�w���t�n\0\0\0t\'�J�ցg�r�+��o��o��d���`�(��/G)���(�\0\0\0�d�w�������\n�lg|��D6ݭ5����vk������\0\0@����w��yj�y>�jmskͶ�Φ�ޭ}�\0\0\0\04�zK�#�9@�|g���O�@[���l�tۏG�\r\0\0\0�����\'RCH���yB&�h�{��F�����8|g\0\0\0hN��$^��l��h�o�=���<���6Z�?�\0\0\0&G/���+�8����l#�|w/�fy��O}�ޮ���\r\0\0\0t[YgƉ��Ysx¦��(��\0\0\0hN��gxp\"�!�9�Vt4ݝݼ\0\0\0�L֛syp\"�48:y8��n��F\0\0\0G�V^�ˀI��>�a�t����\0\0\0��>���\'��%+���n�\0\0\0\0�`��&z���D���\0\0\0�C`����f:���?��\0\0\0��\0C�m�f7r\0\0\0�~0tr�M�\r\0\0\0���Nn��h�\0\0\0�!0�й�Y��\0\0\0��\0C\'ʲ�U/^\n\0\0\0�~0t�8�\\[�\0\0\0�!0�Щ2��$���\0\0\0�7�8�u�.�\0\0\0�����i���|�\0\0\0���o�]�xy\0\0\0\0�!0��>��m�\"^\0\0\0�~0����|�\0\0\0���J���\0\0\0�!0���\0\0\0X��+\0\0\0�ul�Ƽ\0\0\0�:6``^\0\0\0�c��\0\0\0�:6�\0c^\0\0\0`00�\0\0\0\0ֱ�\0�\n\0\0\0``�1�\0\0\0\0��\r�W\0\0\0\0��`��y\0\0\0��\r0��W\0\0\0\0X��+\0\0\0�ul0���\0\0\0X�`�+\0\0\0\0�c��\0\0\0�:6``^\0\0\0�c0�\0\0\0\0ֱ�\0�\n\0\0\0`00�\0\0\0\0ֱ�\n\0\0\0\0��`��y\0\0\0��\r�W\0\0\0\0��\0�y\0\0\0��\r0��W�\0\0\0\0��`��y\0\0\0��\r�W\0\0\0\0��\0�y\0\0\0�ul0���\0\0\0X��+\0\0\0�ul�Ƽ\0\0\0�:6``^\0\0\0�c��\0\0\0�:6�\0c^\0\0\0`00�\0\0\0\0ֱ�\0�\n\0\0\0``�1�\0\0\0\0��\r�W\0\0\0\0��`��y\0\0\0��\r0��W\0\0\0\0X�,���R�SRRfN�8qolllC�޽��:P�P={�������l���Ϳ#�\0\0\0��\0��-[v�ȑ#�cbbԜ9�U~~�jh������:���,**T��ϩ�6������_L�\0\0\0@?X�JM}e}�~�TR���j4��&*���H����SO=�&�\0\0\0�!0���پ��TQ�v�	��\nq�����}��Üc�\0\0\0��\0�˖-�G�lm3�?�W-]��\Z3&A�\Zu����k�\r�#U�f�Q����SN��`�r\0\0\0����R�G���>)�y��7^�b�R5��ԭ���5v̍*>�Z5t�j�n���:��ޫW�<b\0\0\0�!0�\"\\J�11?R.W���5zU¨x�h�p�H�~�����aW�Mwl��Ω��>�Ss��=\0\0\0���&N��wΜ\'�F��f5bx�za�|��V�Jy1Ioپj�P}��v���{;�c5mڽ;�Y�H�\0\0\0@?X��Ґ��c6z\r���\'���Tm��������T�>s����C�?S\'�o�����ջ��0g�N�\0\0\0�!0�\"X�޽UC��f�W߬���*.ڢvoU�w���;vlW�=����P/��q=\0\0\0�����R_6+���j֬�j�o&���BU��]�v�P���o5�����_���Tǋ\0\0\0��\0����Ϋ\Z?W�ֽ�bc��?�TN�ϫJK�Ր�/U��NU\r\r�5�=��b�\0\0\0�!0������S�}wL��!]\r\Z�j���{e�U��*��?���W��W^2��4�{��W^���W�o����>��6\0\0\0��\r�1��n٤k[�켼��͌t�h�X�D��x�Jz�Y�̼�����P]{����5^�Au�X�\0\0�~��h����c�~��D.����ź�����-P�\'�S�;�I���Q3g�V=�ģf���~7�~���:^,�\0\0\0@?XT4�_8%\r����ݬ�H{U7��|?;��;�	�ܳsu�-M���	js��V��Չł\r\0\0\0�C`�EE�}ԩ�{��G��~y�8�Pˮ��*.n�����zkwi�^�Au�X�\0\0�~��h�?�*�7S_~��J|�i�0�:5b��j��+TܕC�P�Ѿ������Qǎ�EO�{{��ł\r\0\0\0�C`�EE�}�\n�b�\0\0\0�!0������\n�b�\0\0\0�!0����>L�Y�`\0\0\0�`Q�p��\n�b�\0\0\0�!0����>D�Y�`\0\0\0�`Q�p�¬X�\0\0�~��h�PaVmwO��@<\0\0@?XX7��¬Zw�hm]��\0\0\0�C`��w�]�亅g����u��W�/+)��6���_ff�s:\'�u}��z[�۔�������z��K�Ϛ5��c͟?K�>th��uUU[��G��7{����f�UV��kj\n��\r��3�8������Zi�i�\0\0@?X�7ܟ���\r��eYY+�.���5y�̆�H�����;��r��sr��ٳ�JN��\\�n�ݧ���l6�o�3�<CO[]�U?��`n���\Z?�j[�i���v��+�z>ϕ+_pN�߿C����Wk�iyL��gϞ��}_��r~ʔ�tþ/����^�/��\'z�ѣ���Ͼ��G������s�E͘1�l��շ�����[�g���u\\(\0\0\0�~��m���-��LL|L��oٲ.�m�.���*6�����_��Ç�����yy�����*}^[ΟrJo�|�o6�w���J}��cX[��ԡC��˗,���KF��`���euu��oA�\Z�yH.�55�����[����Y�Xmذ��y��eg�R��Unn�~�r^�������?��w�9?PÆ]����|��/�zm�[�i�\0\0@?X�4�iVee�Ԟ=٪��c���ݡD���x������?�k��S99����9��N5��\nu��\'�;��lb�6��O����R����@����<O-\\���\\�w7�x�F���.W�*/߬/KM}N?VEş�u��җ��-R�_��y������ ���^�*����T�|�(�q�瓛�z��]����2����c�}yN׆F��(��(wՙ�Ǭl��1+ެ^���C`��Iý�Y-Y2O]tѿ�-[֨ի����n��=�A}^nSX����I��K^/e�-��-���=���c�^�����&%=��g���P��O�˦N�`}W�^���=}cc��&\\]]������Wx�\\�m�:=}v����f���z+��m��=[o��ˏ-Sk֤����U|�}�O~2H�}��oy.��\\nߗL\'���P�\\2�l�W{=�\\���X����5�sw��5Ƭ���5�YIf�c��#i��#��#�~��j�?iVr�]w�R�NK[��B{^������.�0�j��_W_���]���~d���.+�v�����Ի\\��_�<�4��ٖ�U��U�^������+ӧ�η�Lo�\Z�~�?�8zt��}���|mm����iW�Nҧ��\\&���7^�O.[��I�h74|��O����X윗\r��j�����f��g>�\Z��7��AVt�a��;G�f}a�L^��#�~��n���Y��۝�ӧ��u]f��~o\'u���}q���v#+�rWW��v�\\���_�/^,����(V��̦�bUS�nV*��ý�ld?V))������oذT7��&ݦ�n�����J�y��\nש�.�P7��&<�j�6{}Ǝ�^�zk��,o���#�Tv�\n�h�zM�n��_���G�YY�~_�\0��w�w��-\r��a�Y��ڝ�rý�,9x?��\0�̆��Y�\'��P���[JK7��5fC[m6����Ʈ�\r���kk����Z?����l����j����v7�ǟKr򓺡ݷo�n�������y�.�if��l�?���>��8v��y^r��>`Z��Hg[������Oy\\�~�w�B�V�_�`�3�\\��nu�e��fϞ�/������^���[�o��p&ߟ˲Vr\0�O+G��Ix?��\0�Ć�c�u�H���]�������\r\r��ÇK�M7��2e��<���ڞ{n}Z*--�:�z}CWz��,��ZC%�#��������Æ��l�SUFF�JM}F?�}�܇�w�^�u���?��µ�	��4�V]r?�&8�l��M����}�������[�x���{��kc��=c6�����{�u�P��7o����{���Vjժ��QCS^�1}�?�Vrd���k�eK�#�\0�G\0�`�pW{UN�\nݼ����t�lv��fڴ�������M�\Z?������>��j8_�w�|�|II�>�r}h�;K�oj�r�)(x��6<����<����u���}��|w��&O�����;��c�?0��������m�����ת[o����ۗWTd����B7���z�����1&��}jp�\Z��9����C`�E\\��QDUSӇ�2M��K{���q\'�IbqtH29x?��\0�����\n���q\'G��#��T����S��!f��N�;��\"萭����,�\Z�J*�*J���{W>\0�7���C`�ET��f��n���i#\0�Q./��@?X�4�T�U��;9:�)@�sT��\0�~��1\r��T�U��;�-�:)\09�@?t����\n���q� G\09�Н\Z���0+\Zn\0� G\0y,*\Z�2*̊�\09�@^�\0���{/fE�\r�� /`�EEý�\n���@�\0r�0�����M�Y�p G\09�`��O�����l�vQaR_}U�Ϝ5.��� /`�E���|(?���RaR��?��9kv�\'\0� G\0y,�]u�e��̙J�F5v�Ui�I$O\0�@�\0�X0����˵�f7<�=zT��&�< G\09�`���&%=H�5f�UK�Y�K�\0�#����0��3O�/*ZA�ۅ���t�9/�u1y@�\0r�0��G�9��w��k�{��Qc·1�	\09�@^�\0�¦����l޼�>�;ݡ�ζ���n�l���@�\0�t�6�g���~����L�e��M/lh(�1������䧿�h����;��\'\0� G\0y�{�Ԭ9fm5��z��)����m��8��� /`�!�eY�/y�\0r�0��9d+�˚W	��	 G\0�@^�\0C��4�﮽���<�\09�`�!���v��e!O\09@�\0�:&�h~P2���w��@�\0�#����v�uۮq�<�	 G\0�@^�\0C�d�z����<�\09�`^K[��.7y�\0r�0��NY�4���<�\09�``^1�\0�#��00��<�@�\0�0��W`�\09�``^1�\0�#��00��<�@�\0�0��W`�\09�``^1�\0�#��00��<�@�\0�0��W`� G\0�``^1�\0�#��00��<�@�\0�0��W`� G\0�``^1�\0�#��00��<�@�\0�0��W`� G\0�``^1�\0r��00��<�@�\0�0��W`� G\0�N�,k@�T;y�X�y�#����\\�4�cx�X�y�#��^v�v�Y�x�X�y�#��ސ\Z�q�<,�<�@�\0�����r�w�ٺ��\0�#�� /@��.7��fa\0�@�\0r��d\Zl�fa\0�@�\0r����y4�	�,�<�@�\0�t���l�fa\0�@�\0r��\ra��0\0� G\09�\"g�)�;%%e�ĉ����6���;��pQ-TϞ=�;���?>|�F��HF�@�\0�#��tc˖-�g�ȑ�111jΜ�*??O54|e���QA��nEE�*1�95p�������5_�Y�y�#\0� /�Lj�+���맒�^P.W��46Q�X�ɋT�>}�:��Soba\0�@�\0�#��t�f��.PEE����[�Uyy��۷�?�����,�G\09@�\0�ҽ,[��ٲ]T��l\n]^�t�Kj̘5j�����Q7ďTɋ��MG������SN9����^�y�#\0� /�h�(�{��kꓒ�7O~�U+�/U�>J�z�X]c�ܨ��UC�^�������8��^�z�0\0� G\0�@^�TJ�11?R.W��6zU¨x�h�p�H�~�����aW�Mwl�������Ԝq,�<�\0r��(4qℽs�<i6�_7����櫬�2TʋIz��U#���������Qm�i���i΂D`�\09�K��Ґ��c6�\r���\'���Tm��������T�>s����C�?S\'�o�����ջ��0g�N`�\09�K�ݻ�jh��l\0��c�R�E[Ԏ�j��]rzǎ����{��%��9\\�d�%X�R� G\0�@^��R��f�r�]͚5SM��$URR���ۣk׮j�}��f<x������ޖj{u��ě%GeO���!v,�r�䥛4�u^����Z��5�SU�Q�zp�}^UZZ��\\~�z}u�jh����W7H�O�-[�?��f�\r�#\0� /ݤ���S�}wL��!]\r\Z�j���{e�U��*��?���W��W^2��4�{��W^���W�o����>��W�ķ�n�r���\0r��hk��9�u�&�[��d��mVof��F{��%��ŋT�Ϫg�=��������kF��o�����Ih�����;�,�r�Q��f�g�Z��ͪ��p�Y���i�Lk�(n����c�~��D.����ź�����-P�\'�S�;�I���Q3g�V=�ģf���~7�~����^Q����f�-�,�r�Q��qf�ZM�+f�f� �N����1V#�dM�oք�l��pJ\Zn�	��o�Y����n���~v�5w��g��[��1��朷�����o(�Fp[�����\0� G\0�4/�Dg�Un5ӽ���4��[ͺ �\Z�N�ݻM=�������Zv%�WqqCԯ\'��[�KK�����eo(��b-����f�\r�#\0��ܼ�7���E�W��>�~�ek���}�U�o�����S����*a�uj��+�СW��+���f�}�����ߣ�������T�+��P:�{8�����\0rDh^d%^���I�w�u����>BuQE�JkH����� /!2�j�c:�~c����-�f���Eo(�}�q�t���#\0����HS,�ǝ���Ժ�A��p���\"�\r���g�3�N�o0|oǁ�X��@�\0D@^�H�3O�c�w��Fv��7��*��P|�DK������t�M7+8\09��0΋�����wk�������!��*B�P���}���� �n�fۮ���nVp\0r�#\0a�����K�[���� �E�o(��`�sKM���S�L�w�Y��@�\0�Y^���\n�cV�`��~�0�m\r������ֱ��N����t����m�ٽ���@�E�W�8ď�h�����+���k���k�J�#3s�s:\'\'M�����6���={6����^��yޮ}�v��O>�M�c����]�f���gg�Vg�yF��甔y��څ��hO��Z�l�����l�f G\09��yYk�m!~Li�°�+��U�l�j���={���9f3\\��?1�q�4��8���Z��ަ��V:�e��U�1�0�}Z.��-�eZ�\'םrJ���С=z��Y�g������^4���U]����;V��~+*�TMM����[�&O��3}qq����p��lҤ_��8qq?է�6lX��;�ܠ_�.n�[��v[��@Mw�v6�6���\n@�\0r �\"�w_�ǌ1��0n�=�j��n�?mw��g̘�ޫ�8�K���������#}^\Zr�i��Z�Ǝ�AM��f����z��z���?��WJ���_��ǲo3q�mzZ�����ii�׫k����{�y��x���ȑ�԰aC�����~ކ�Z����X�^�f�s��]nk����{���m�^�0�i�[j��:�lw����� /��ά�C���x\r�p{nՌs7������5����Ym6�s�i��j6��F�;Ʃ�ҍ��i�3���2m]]�JOOQ��.|Z_.��_����]x�Ul���<���שI�n7�j��yz�4��er�ii��m���e�����,�l��O���^�<gy�r���Z����z�.�n���隚m��o��f\r�����eMwG�mߦ��t���#���TEb)��v�ܶ�*_��7�!���k��C_/�=�MJzB�]W��JN��/�:����Y����=���u����_����4�YY��������?{��\'��[�o�}�ڲe���~W��С]�s��X��?��-R��[[���ٯ��h�k���L�n�[����;\"ɺ�>,cY��@�\0�Zl��@�4�[,�#���߾����R]~�Ŏv���;�I�.+��4�g�u�:��&Xn#�_r�`UP�G��~Z���[�W�zA_�o�v��8۶�S�\'�W������R�8˗\'�i]���=7������2���**r�����2���D�Ǐ�&#�e��#F\\������lݾ��QA���}���h��iiw[~�;�p���#��¼��֛)�x��I�U\\�i6�K�}�^���@UW8����]�L/�/���+ԁ;Tzz�n�kj��;��popn����s��ctC������&M��l�����e�3N�f߾m���}T�U*//�j��9�m���Wzݷ�?��o��ii����u��;�ذ��:��|��=M7��f G\09��y�(�Ǜ�\"�����l��/読-T˗?�c����f;_�{���zws��3��ON~J9��lj��\r�\"}Ycc�utr���o�}��\rw��K����яa��q^�lZ��kj\n��å��몪�q�������6���Ч��=K͘1�]�c7ܭ�\r�&��[��������ts�rVp\0r�#\0a�~��孖>\rwM�e��jZMj�JIq����ڹ��p�~�0��e*#�%������ܾN�C�fe����7���.�G֮໛=/�ǵ/�w����[[��X�ߦ��\\.����m�����=���������t����;ۭ�Nw C~����@X�e�Y��Pt����3H������J��Pa6�Ku�t�p�����ڙ���.�:_R�>�r��,�����75}�LSP�f6�������}P%&>b6�睊S�SM�6Q��*,\\�N;�u��^��f8��ߪk��T�����QW��u�����~.�a����[��j�<�����D�XimskͶ�Φ�ޭ}�SVp\0r�#\0ᑗ\\#t[ä!�\Z�3H��WSSUD��z�|C	�����v�M��x4۬�\0� G\0�(/��^n�f+��;!r.�}C�-ݾ�w�i�;����>��w�Y��@�\0�i^���j���V#���wr�]EuQE���O�y6�mi��Vn�O���#��ĘuЬ�t��Z�?(�g�RR]T���{�4������v��o���#��%D���Ŝ�f^�wB�� �*�.�(xC�������:X��@�\0�q^&Y�qgm�Ժ�G�a)��E%o(��twv�Vp\0r�#����l�-g��|�Z��}�j�b)UAuQE�JGwg7r�\09@���K������v���ַ\"�}��A�4��z�ꢊ�7��U�����\0rDQ^n�\Zo�-|���	��:ݺ�t�9� Ѭj�ўdD���[h�˩.�(|C	v�pv#g�\r�#\0��Ҽ0���Z�w�����fe�]�c�y)��E�o(mm���Ug}��\09@�\0��\rw�E�I������f�6@�\0�#��Dyý�ꢊ����n�,�r�䥻4�{�.�n��f�6@�\0�#��t\'�|�w\r\r�f�\nq}�U�>s���0���$�m�\09@�\0��m��C��K�p�Z�����Y����ka�O���\0r���᪫.[7g�T�,�B\\c�^�f�v���G\09@�\0�m�A��|�r�	m}ңG�\nsı0\0� G\0�@^�T��?,MJz�&8�5f�UK͗>���G\09@�\0���y�i�EE+h�CP��Kכ��A�.fa\0�@�\0�#��D��s�9��4�\'���ѣG��=���y�#\0� /ݷ�>���7���Nw�g�ڍ���}��� G\0�@^��A={~/���O=<e�-�7mz�`CC!\rs;ꫯ��[�����h����;��0\0� G\0�@^��K͚c�V�\Z�IW.��;���_q)�#� G\0y�y�� /\0X�y�#��\00�\0r��\0�\0r�#��\0`a\0�@�\0r�\0,�<�\0r�\0,�G\0�@�\0����G\09�@^\0�0\0� G\0�@^\0�0` G\09�\0`� G\0y��\0�#� G\0y�y�� /\0X�y�#��\00�\0r�#\0�\0�\0r�#��\0`a\0�@�\0r�\0,�<�@�\0�\0,�G\0�@�\0����G\09�@^\0�0\0� G\09@^\0�0`�\09�\0`� G\0y��\0�#��\0y�y�#\0� /\0X0�x	\0r�#��\0`a\0�@�\0r�\0`a�<�\0r�\0,�G\0�@�\0����G\09�@^\0�0\0� G\0�@^\0�[���j\'/l� G\0y�!f�Zi���2���\0r�\0��n��.2�/l� G\0y�!-4��xyX`�\09�����]n��6[�Y`�\09����]n��� G\0�@^\0t�L���,�r��@���h�x9X`�\09���c����,�r��@\'\Z�6@�\0�#��\0�*�z���̜8q����؆޽{��-*��ٳ�w��gÇ�h���Q��#rD��9\"/@7�lٲ{F�Y��̙����TC�W��;��%�cQQ�JL|N\r8����{͗�bVp�E��9\"G��#�D���W����O%%��\\�Fsa�D��JN^�����թ��z+8�\"G��#rD��y�x�|������B�[*DU^^������{�~�\"G9\"G��#rD��Э,[�����h���py�ҥ/�1cԨQ׫믿F�?R%/Jj6��*/߫N9�/��ߝO�#rD��9\"G��#�tr ��#��OJz�<��W�X�T���(u�-cu�s����V\rz�Z���P�T���?�իW+8�\"G��#rD��y�DJ�11?R.W���h���Q�z�|�\r#���ϮSÇ]i.�c�MOu��>��O�Y�\n9��9\"G��#rD^�(0qℽs�<i.�nV#�ǩ�WYoe����\'�W��/��.ח~oG���M�w�9KY�!G9\"G��#rD��bc�4�����fu�����~��nyGe�i�Z�j�Z��F}\\������շ�~��vT���ws��d\'+8�\"G��#rD��y�@�޽UC��悡�Y=6�!U\\�E�(ުv�*�%�w�خ{�!����_2�Y�b�Q��#rD��9\"/@���(�e�r���f͚���f�*))T���ѵk�5��V3�O}���~oK���|���9\"G��#rD��y�Y�]�U����u�^S��?U�U����U���j�嗪�W����Ϛݞj��C�(rD��9\"G�� ���p��6��aCcUMu�z�l��ݼQe��G���J���K�B;M�t啗�����o�����\n9��9\"G��#rD^��Z0sj�M�7ea���Y�����+�/Q//^��^xV=3�i}���/-T�^3Bm|{��}P�/Vp�E��9\"G��#�DՂ��N=6�w����\0^��Xג��U����y��>����#j�ߪ\'�x�\\(g��ͼ��>��+8�\"G��#rD��y�j���S�`��������i���,���?G͝�z�ٹz�,�1��朷��T\'+8�\"G��#rD��y�j�|ԩ�{��G��~y�8���]��U\\���	�������z���b�Q��#rD��9�\"Y�sn�v\Z\0�]0�U�o�����S����*a�uj��+�СW��+����������G;�=����+8�\"G��#rD��Qb�;���{���&�\n9��9��9\"G�e��l�Ջ�	z��&�\n9��9��9\"G�\ri��G��k�|�\n��╀�K G9\"G��#rD���r�w�ٺ\r�o��7*L*JWp���¬$��rD�#rD��9\"G�(l��.7��ڿ`>D�IE�\nN��J�lQ�,\nڌ_rD��9\"G䈊�e\Zl�:k�|�\n�����\0[�p���#rD��9��)Gq\rw�~Ղ�\0&E+8	�����\'�#��#rD��9\"Ga��.7[���-��J�IE�\nN[W^�i���#rD��9�\"=G̺Ϭ�fU�Uo�\rf}b�w3�iM���Z*L*\nVp��R���\"G�\"G����%?��k5֪��o�Z)�M�O�0�_�i��]]���0~�9\"G��#*�rcVvM���j��T@���T�T��ttw�Hߝ��K��9\"G�Q�����H��ͳ�j�\'�u�Y}�i��5Ⱥ��n�%\\>�bk7x��*L*BWpZ; M���#rD�(rD�(r���w��t��������}�{2��w���\n�����>�k�nY`��#rD��9\"GT$�h�O�\\i��f��ܮܧ�fK7�|��I�K�߶m�����>}�����奩#��ɓ�CM�t�Wmܸ\\ee-S-=�\\7mڝm~^�W\'���;7��55������@׆\r����s�߷o���%%TYY�>-?jVr�͞����9���*�~}#h��`�{f�i�\r���\"��5����:�E���9�1�w#��_���}��湆���h�\0�����JK��A���Qze_N�{���3�<C-\\��3����<o߿�?�k��ӧ�TK�-��t�\rm~n���P]}ul��Hc �TW�����n6,����^��~o�\'ޢ�l���F�?����;~�rs_�Ӗ����/X�^.��X�.��B}�}����/���s���O�e�d�������v���C��9\na��_�QQ�#�Ƹ��mϦ�ܧ�p|�\\�j;V�t��;����̗��={���w7\n?�,=}��R��\\i�b6\n��[���\"��MM��>�:�����#��G��V����KJ2u3Q\\��.�����{��W����׿�L�r}���e2�<�Çw���g�i�����5k�UL�\0�6r�����m��ߦ�������:���#p�ư�x�NԖ�ϕ�&z\\Iߡ#G��(GTh��#*�r4�����ŝ|�޻��k9p|��q�UW��\Z0����Z�N9��z��{Un�:L�&ݪO�{n����{���^�F��JM�2�\\YN�ӟv�)fðPUW��=vS�{7Si6ZzN���ر�9�e��i�y�fz�i�zk�}�>���R���#GJ�i+*6��jk���������h��F�����w�u����ѧ+��}�ܻ��sh���@+�VVZZ��7}���#�;t����\n]�#rDE]�<�n\'���x�`+7�o�\\�b�Օ�7�������o�Sa�\ZU^�Q�w�����-s��yy�Y������@��g�[֖�ș����\'%ӧ���9�a��*&�_��)j�������K�ٳp�+.^�o/[�<��w��l64���V�Y����=--ɹy}bc�]M�6�l2���4����Yg�i6;�m�ױ��#D�X�Ib���JN[Wn|Wr�bw���V����\n]�#rDEU�Ƿ>���\'����\'�bh�\0�`��M����:��tðj�szW҇�������_{Zw�p�>�o_��$��46V�@�-��}���V�nj����e�e�&�2ْ8b��^�ee-ѻ�N��_jҤ[t���fd���y:T�ܷ���@n#M���I�\\���������7����ȑ��X�[�_B�`�G�qm�M[W2Z[�	v����?�-m}��9\"G!�u��#*�rt��tY\'����x���Z�^0W�XlS��+Ե�ƪo�Z��;��y�TS����LΗ��ӷ����lke�Roɒ����W�[�������rz��GZ|~2���3�]v��	^�mܸT�Ծ�ꫯpNoذؙn��=�\\����[U����V9�;1�!����ܦ�~���~}������T�q23SZ�_B�`�+��OF�ݍ.�JN�v���n��JN[_+rD��Qr�9��m{�Ɇ���t2��C�ɓow> :�A�R�������nѷ�|<ɩ��(/[_�r}����8U]�Yh���!��y^2PS���\'[}m~�7�i���ٳ>�טEw��2�孜��Y�O��tɃ�3�}̾���Y��	���� e�9����%���y����S����O=�S��-[^WӦ�Z��=�Z�q��ȳ	�t����6�@�4��XMM�+�yY�-t7�t���m~i\n.����;z��\\`�h�^z�����\\�{l�l��_9竪6y4�Gv;���w?�V=�u��X��\'���z�\n�+�n?l�e�B6C_�����~>���������On�r������lY�/��yy���Zwт���\\�ii%��+7}>\'��\"G�� GR2f}��̦y�u���ԧ�G�̙��^\"�o/{V�?�\n�!{�c����̀�=��T}��d�:v�Թ����)V��/�LH�/������)S~�d�^V�ʿ�_�&ݬ��^\'qq���R6�d}����\\9�9�f���nK����Q����������s>�O��g�1�>�Ƈ�����>��=�\'L�����Z��7�ͯ�1j�7���5�y^�Ϟ�[��Aɋ��}ʰ���!]����Ӳ�\r��\'��W�o���W�^6���m{_�0�Q������3��>��􂹲MU]������m����B텤�45U8ӺWr��m��o���)��6��~��q7lH���|�����\\.�ᬳ�?���#E����^e�����y.���\nG�nt����}�����칤�=�Zu��N������i�^�&%=��oh�km���&S`�i�c�<c6U����]�`��d4�>����ӑ�ߕ��0z��9\"G!ȑ=�d{�oY	��2`��d�YƗ�)�1�z�sz\\�tr�B�{����͛�5�dѾ���>?�O�s���c��r�iY�_y��X[��%k�m%s���s���P��~�^�ع��8����jtr����ܨ���,��Q���6�g��/�̖�26导\'�u����G9/����cGz5�vfKJ�����%K�V^�#=N,x�:F�.�$W9�CƬ���>���j٢�!�m��]�[�r������:�r{����sb��ط���&c�+��}O�����X\r�Z�^0�b������S�;�m����22�9/+\n�\n�}^V��O�S7�%��W�e�Ç�镆�´��A�s�|���z��SO��l��ҵ�\'�����oP۶��[�,x��={�t�X<�����Rsee�����w���^��ۗK54�\rD�>���L�5�wO��\Z�Ն�f�+��㫇�-	U���n�9\"G����H�р�d�Կd��=F���4Ş�q��\Z5j����q��z��>�܏d���7������9\r��!?T_����O�_y�C��6��<\Zˬ�g<�p\'�-𞙐9R�˽5o�>-9����e\Z��|�f/+���ݤ����~�R���\0��yE���^��c�J�=w�1F�?45��l�ȴ�Qϲ����-�k�f���62��v�����RS��Ǫ����Iv��&�����ͼ}{�~�GN{��~��R��lL���7�/~�y���<�}������~< �����]��Z�.�$t�����5]kG������.j8oQ�}��9\"G\'8Guu;�ߍ��Z\Z�}�r���͕����x��x��>������\n��ݫ|777�j�+Z��\n�t�sؿ�k��G�i��2�-v+�cef��:/_>�l8�\Z��V����Ho�4��k<K�a?W�9������o�K�c?vi�\Z���.L�x?jӼ���h��g\\�������II��d,\'\'?f}�i��]�)z7u{z{��l��dڳ���j=��s�p����L�m�C�a�.�z�����󹺛��˔������z�^��������3�y�~?�c7Х\r��T�T-�}߬}W&�����t�w��V�_rD�B���֑̅�_R�V=c���P?|�>�>��Kδg�y��$_�O�۷�i��i\Z�(����}��\n���c��뮛��>��^�=Zh�6[l����-��}ڕ���\\y�o6>��w7�������m�^k6��?u���ɷ����_�LW\\��&L�4#��o����9\"G���T]~��9cMƿ�.+{�K���9眭����3NdO-s�ɳ��S�G_��i�ݲ7;e����֖�uVS��߱g�[;c�yi���fO�z�|���Ը�Pˇ\0˗��_SZ��I�q[z<C�R��ܯ��ƕ\r�G|��چ�<�����s��nG�ӯY��9�ظ�:�ҫ��.%�V��*����Y�%�K�Ef��bӑO��Ԋ�����ӕG�m���1���XgBN=�=�t����bN<���<����2�JԆ\r������UFF�3���^�n�q�����g�Ӿ�\r�ܑ��̑�ai��)��Νfm��_M�r��,����oc7ܕ�oY�-3���><ǝ���־�W�����ͼ�3����[��������\'�+��j֬�8�%+�G�l5����Ƨܷ�?r��=v�H_�;��(�h����*��=�˵�Yn�����s���~䯊�_w>�1,�rWWo���kL��d����\'cW� M����{k8���\'�\r�X�������I�n�e���\r\r�����\nW�ol۶�j��[�|���`���[�7��r���9c_��w����s��F�Ο?�����hy?�(�@�6�JJ��&y�Z�`��}���J���|s%~����d-����\\����>�r��Hț����f.�S��v��t3.���i)Y`�w9��oY�+��M�лC��9-ׅ��	т��-�$���5m�wQbt�����_U�e5�/;㡴4��t��;��˸����*-�Y�\"#Y���[�\n��$&>�?���O�e2�)��s�-���o���?ֹ#Gљ����z�o��7�֑�G:��-i�%��o�\r�6�Q��u��I����]��q��Y�?�A���t7\r�f�����~L{zόUTd���1(�m��G�l��#�s�ǲ�*���H��;�%��t�\'ߢO���G͘q���r�\\��O��k�]e߱v�\"G�����?��1C�L�z���[>ܲǅ��w��ȑ-zN��2;[r{C�u��lj78�p�W?��س�Θ</{QƱ�������G���l�߳��Iɠ����ڙ�S�F����\rtm�]�:|�@��76��rҟc}j��^��+���~G��k�LŃ~����~�s�}D��Ӻ��:E�nh(QYY��6s��g���������Դ\'$����h���Vn�v��ػ��������9/[�������m��/ԧ��.,\\e�Hqn�^��u���^+��I�;�\'�՗ٗK�`�FV�d�Ai:�oyx�Z�ʲ�l��#Gѝ#�x�1{��>\"��sܸ�p_�?t��y�}�~��G�nu��é�o�Y�qe?����uw[�$yq7ǧu7�e�����޲eE��]��ƶ�����Ƿjɸ��s�2��6���w�#ޏ�w{l�x��C��ǹ^Ɨ���j�2�SS����fF������(�_w��s]��3���L��eek�_�Hu��l�1���~�;�ƨ�.�u����{��r�����\Z�L\'��л��\Z��G�rY��e�?���m��{���{CZ�¬�2��t��d[[����f��y�b�wC�s!�N7�vs�r�}���mݠ���c��:/�!o�����6a>^mYh��M�+9�㍋��;i7��|Ĉ˼.��v��̕�_蕓ŋ�[�g̘�\\f�-=��GY�\ZsE�sf������Y�b=��i��9�![4|W��i��-��p�9����n�ͳ�C(�e2�/��_���>a�_��ek���t6<Kn�a���Ǖ��i�~�)w~���d���q���_�+u�՗7{_��H 9�i$��(��\r�D��.	8���S�Fr�����9?~ݨQ��c�%_������,���^���W�ƅ�{������i�k��~c�_��,�͂3���^q�kN�|�+�\'r?��ؙV��r�i�=s\"������+Dꩧ�q޿쪨x�y��p�C��(x?���\'�1��x���Y��`����ۮ�DL�6^/e��oߟTj�z!w�H���k��^��z��z\ZC�f��^IZ��q��8]_����Z��y��hl,�>�}A�����a?��\\�����Ȋ�l-,.^e��,��c?�3�e�ww�;�����J�� �`DM�rs_6W���۪Usu�;cƯ͕e��`i�l�d��l�iu7���2�%��e�r��a��?�*/_�l�WU�w�}YI�����D��ڽ`OX�u�55�\n�2��+��/9��G�������,G�<Ʒl��샧]lߊ.5�6p̻CV.�Ns��s���us!Wj�~���L�[����u;�\'�����FkW����nd��E���n֧�I���^Ӯ^=�����1xQ߿}{����14��9�W��-�++mY�1Z�](j�KsTW�M�{���\rI���QU�i6�;������y����FX�5]m�&�_���7������z��x����<>�L�E�n˖ea�;r��rD�~D��9j�|����輟��+7��n�2\0��]!��z�o#�x�p�)x�j&޴v�K��o\"�����x�9=u�m�������\"}Z�}D���._���}o޼�����\"��<������rrC��D�\n��J�����F�?��{����jD����m�}��n��@�p��؋ԤIc�8�1{����&��o[߁]�wCN�J��/��_������s�2���#t�~��6w�Q��#��c��\n�l�;�tK����`-�`.\rY56y4��ֵuցd^q�𼼗�nw��.UG��<s�)\'�\rɖf�a�#�ƚ+��-m��i�]\'8����I�\\;�Ͼ�455��ϖ�����!Z��\'�Vp���tƖ��8�kX��ȑw�,��mۖY�������4�,��^-jv��V�V+W>�����\n\n��\r��A�LUWg6�y��o��=�K��Q����9b�����vy��-[�ۻ{���s�6��]�`nhp�\\��j���\n�{�[�nrr^�������q�f$#�9\'�l\n����ima8a�ϝ�\'GT���x�:���`%��W�\"*Gv6��穦�}��`ذoq�H��{YVVR�i���z^��h;;�;C�Ν��1,��uC�&���4��2w�������#r�&�|�n9-R�����t��܇�#�V@�4ܲUK�{n���m����M�����������o\Zy�����Eo}��\"�-���co	��nw���^�娴�5��j{���Y��r>�ji�ػ��w�^h횝�wz��JK��#��$2��6)�A�\0kl�8��ܑ��#��#rD��QP�[c]�4�YVC.[����e��A�m�0ܻ�{ޮκ\r��`��vt\Z�A���E �H69\n��N�#G�\"G�\"Gmcx��=���;�\0f�!�nx���9\"G��#rD��h��mV��\n�ўdp4r�3�]�b�wA\ZG�(rD��9\"G�u�f=`�Z�>1����阮{w�{�8\0�,��P�������E��\r9\"G��#rD��h�\0�,�#h�B��G��9\"G��#��\0f�a���+7��#rD��9�h��`f�ܥ+9IQ�rC��9\"G��#��\0f�]&����E��9\"G��#\04���ՇQ��#rD��9@�M�`9\"G G��\"G\0X0�`9��9���9���b�L�(rrD�@��\0�f�#rrD�@�(r�3f�#rD��E��E�\0�`�X0�#���#�#r�3ł���#�#�`�̂��Q�Q�\0f�39������.\'�|�w\r\r�,à��j�>s����\"G�\"G G�@<�Ǉ��`�Z�����Y��QI�(rD�(rrD�\0D����lݜ9SY0�A�{U�9K��\"G�\"G G�@0����˵��c��\'=z��0gI��Q�1���9%���aiR҃,��ƌ�j�9+r��\"G��#�#r �:���ꋊV�����_�ޜͺ��H�(rD��99\"G\0�O�9��wΡ_(��ѣ�|��0�E�@���9��N���y����������X�d�L�(rrD�@����aPϞ��9��SO�r��M�^<��9v��1�OD�Q+�i�w{�݈Q����#\0�̥f�1k�Y\rf)���2ܿ�(?�Q+�E�@���9\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0����9���6BX\0\0\0\0IEND�B`�',0),('b6aaa130369a459bbf93a17749146147',1,'test_audit.bpmn20.xml','bcd1a51bb11b4c4ca58480103ab969f7','<?xml version=\'1.0\' encoding=\'UTF-8\'?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\r\n  <process id=\"test_audit\" name=\"流程审批测试流程\" isExecutable=\"true\">\r\n    <startEvent id=\"start\" name=\"启动审批\" activiti:initiator=\"apply\" activiti:formKey=\"/oa/testAudit/form\"/>\r\n    <endEvent id=\"end\" name=\"结束审批\"/>\r\n    <userTask id=\"modify\" name=\"员工薪酬档级修改\" activiti:assignee=\"${apply}\"/>\r\n    <userTask id=\"audit\" name=\"薪酬主管初审\" activiti:assignee=\"thinkgem\"/>\r\n    <exclusiveGateway id=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\"/>\r\n    <userTask id=\"audit2\" name=\"集团人力资源部部长审核\" activiti:assignee=\"thinkgem\"/>\r\n    <exclusiveGateway id=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\"/>\r\n    <sequenceFlow id=\"sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\" sourceRef=\"audit2\" targetRef=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\"/>\r\n    <userTask id=\"audit3\" name=\"集团人力资源部分管领导审核\" activiti:assignee=\"thinkgem\"/>\r\n    <exclusiveGateway id=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\"/>\r\n    <sequenceFlow id=\"sid-3DBCD661-5720-4480-8156-748BE0275FEF\" sourceRef=\"audit3\" targetRef=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\"/>\r\n    <userTask id=\"audit4\" name=\"集团总经理审批\" activiti:assignee=\"thinkgem\"/>\r\n    <exclusiveGateway id=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\"/>\r\n    <userTask id=\"apply_end\" name=\"薪酬档级兑现\" activiti:assignee=\"thinkgem\"/>\r\n    <sequenceFlow id=\"sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\" sourceRef=\"audit4\" targetRef=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\"/>\r\n    <sequenceFlow id=\"sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\" sourceRef=\"audit\" targetRef=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\"/>\r\n    <sequenceFlow id=\"sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\" sourceRef=\"start\" targetRef=\"audit\"/>\r\n    <sequenceFlow id=\"sid-7D723190-1432-411D-A4A4-774225E54CD9\" name=\"是\" sourceRef=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\" targetRef=\"apply_end\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-D44CAD43-0271-4920-A524-9B8533E52550\" name=\"是\" sourceRef=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\" targetRef=\"audit4\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\" name=\"否\" sourceRef=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\" targetRef=\"modify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <exclusiveGateway id=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\"/>\r\n    <sequenceFlow id=\"sid-163DBC60-DBC9-438B-971A-67738FB7715A\" sourceRef=\"modify\" targetRef=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\"/>\r\n    <sequenceFlow id=\"sid-72258A41-203E-428C-B71D-CA3506252D73\" name=\"是\" sourceRef=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\" targetRef=\"audit2\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\" name=\"重新申请\" sourceRef=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\" targetRef=\"audit\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-A7589084-4623-4FEA-A774-00A70DDC1D20\" name=\"是\" sourceRef=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\" targetRef=\"audit3\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-FA618636-3708-4D0C-8514-29A4BB8BC926\" name=\"否\" sourceRef=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\" targetRef=\"modify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\" name=\"否\" sourceRef=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\" targetRef=\"modify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-35CC8C6C-1067-4398-991C-CCF955115965\" name=\"否\" sourceRef=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\" targetRef=\"modify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\" sourceRef=\"apply_end\" targetRef=\"end\"/>\r\n    <sequenceFlow id=\"sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\" name=\"销毁\" sourceRef=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\" targetRef=\"end\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n  </process>\r\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_test_audit\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"test_audit\" id=\"BPMNPlane_test_audit\">\r\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"BPMNShape_start\">\r\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"30.0\" y=\"245.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"BPMNShape_end\">\r\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"975.0\" y=\"356.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"modify\" id=\"BPMNShape_modify\">\r\n        <omgdc:Bounds height=\"58.0\" width=\"102.0\" x=\"209.0\" y=\"135.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"audit\" id=\"BPMNShape_audit\">\r\n        <omgdc:Bounds height=\"57.0\" width=\"96.0\" x=\"105.0\" y=\"231.5\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\" id=\"BPMNShape_sid-C28BB5F6-013D-4570-B432-61B380C1F46F\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"240.0\" y=\"240.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"audit2\" id=\"BPMNShape_audit2\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"210.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\" id=\"BPMNShape_sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"345.0\" y=\"350.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"audit3\" id=\"BPMNShape_audit3\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"420.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\" id=\"BPMNShape_sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"555.0\" y=\"350.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"audit4\" id=\"BPMNShape_audit4\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"630.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\" id=\"BPMNShape_sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"765.0\" y=\"350.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"apply_end\" id=\"BPMNShape_apply_end\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"840.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\" id=\"BPMNShape_sid-5FED02D6-C388-48C6-870E-097DB2131EA0\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"240.0\" y=\"45.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-3DBCD661-5720-4480-8156-748BE0275FEF\" id=\"BPMNEdge_sid-3DBCD661-5720-4480-8156-748BE0275FEF\">\r\n        <omgdi:waypoint x=\"520.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"555.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\" id=\"BPMNEdge_sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\">\r\n        <omgdi:waypoint x=\"280.0\" y=\"65.0\"/>\r\n        <omgdi:waypoint x=\"989.0\" y=\"65.0\"/>\r\n        <omgdi:waypoint x=\"989.0\" y=\"356.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\" id=\"BPMNEdge_sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\">\r\n        <omgdi:waypoint x=\"240.0\" y=\"65.0\"/>\r\n        <omgdi:waypoint x=\"153.0\" y=\"65.0\"/>\r\n        <omgdi:waypoint x=\"153.0\" y=\"231.5\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-A7589084-4623-4FEA-A774-00A70DDC1D20\" id=\"BPMNEdge_sid-A7589084-4623-4FEA-A774-00A70DDC1D20\">\r\n        <omgdi:waypoint x=\"385.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"420.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-35CC8C6C-1067-4398-991C-CCF955115965\" id=\"BPMNEdge_sid-35CC8C6C-1067-4398-991C-CCF955115965\">\r\n        <omgdi:waypoint x=\"785.0\" y=\"350.0\"/>\r\n        <omgdi:waypoint x=\"785.0\" y=\"164.0\"/>\r\n        <omgdi:waypoint x=\"311.0\" y=\"164.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\" id=\"BPMNEdge_sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\">\r\n        <omgdi:waypoint x=\"310.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"345.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-7D723190-1432-411D-A4A4-774225E54CD9\" id=\"BPMNEdge_sid-7D723190-1432-411D-A4A4-774225E54CD9\">\r\n        <omgdi:waypoint x=\"805.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"840.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\" id=\"BPMNEdge_sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\">\r\n        <omgdi:waypoint x=\"201.0\" y=\"260.0\"/>\r\n        <omgdi:waypoint x=\"240.0\" y=\"260.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D44CAD43-0271-4920-A524-9B8533E52550\" id=\"BPMNEdge_sid-D44CAD43-0271-4920-A524-9B8533E52550\">\r\n        <omgdi:waypoint x=\"595.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"630.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FA618636-3708-4D0C-8514-29A4BB8BC926\" id=\"BPMNEdge_sid-FA618636-3708-4D0C-8514-29A4BB8BC926\">\r\n        <omgdi:waypoint x=\"365.0\" y=\"350.0\"/>\r\n        <omgdi:waypoint x=\"365.0\" y=\"164.0\"/>\r\n        <omgdi:waypoint x=\"311.0\" y=\"164.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\" id=\"BPMNEdge_sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\">\r\n        <omgdi:waypoint x=\"730.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"765.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\" id=\"BPMNEdge_sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\">\r\n        <omgdi:waypoint x=\"60.0\" y=\"260.0\"/>\r\n        <omgdi:waypoint x=\"105.0\" y=\"260.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\" id=\"BPMNEdge_sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\">\r\n        <omgdi:waypoint x=\"260.0\" y=\"240.0\"/>\r\n        <omgdi:waypoint x=\"260.0\" y=\"193.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-163DBC60-DBC9-438B-971A-67738FB7715A\" id=\"BPMNEdge_sid-163DBC60-DBC9-438B-971A-67738FB7715A\">\r\n        <omgdi:waypoint x=\"260.0\" y=\"135.0\"/>\r\n        <omgdi:waypoint x=\"260.0\" y=\"85.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\" id=\"BPMNEdge_sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\">\r\n        <omgdi:waypoint x=\"940.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"975.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\" id=\"BPMNEdge_sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\">\r\n        <omgdi:waypoint x=\"575.0\" y=\"350.0\"/>\r\n        <omgdi:waypoint x=\"575.0\" y=\"164.0\"/>\r\n        <omgdi:waypoint x=\"311.0\" y=\"164.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-72258A41-203E-428C-B71D-CA3506252D73\" id=\"BPMNEdge_sid-72258A41-203E-428C-B71D-CA3506252D73\">\r\n        <omgdi:waypoint x=\"260.0\" y=\"280.0\"/>\r\n        <omgdi:waypoint x=\"260.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>',0);

/*Table structure for table `act_ge_property` */

DROP TABLE IF EXISTS `act_ge_property`;

CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_property` */

insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('next.dbid','1',1),('schema.history','create(5.21.0.0)',1),('schema.version','5.21.0.0',1);

/*Table structure for table `act_hi_actinst` */

DROP TABLE IF EXISTS `act_hi_actinst`;

CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_actinst` */

/*Table structure for table `act_hi_attachment` */

DROP TABLE IF EXISTS `act_hi_attachment`;

CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_attachment` */

/*Table structure for table `act_hi_comment` */

DROP TABLE IF EXISTS `act_hi_comment`;

CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_comment` */

/*Table structure for table `act_hi_detail` */

DROP TABLE IF EXISTS `act_hi_detail`;

CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_detail` */

/*Table structure for table `act_hi_identitylink` */

DROP TABLE IF EXISTS `act_hi_identitylink`;

CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_identitylink` */

/*Table structure for table `act_hi_procinst` */

DROP TABLE IF EXISTS `act_hi_procinst`;

CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_procinst` */

/*Table structure for table `act_hi_taskinst` */

DROP TABLE IF EXISTS `act_hi_taskinst`;

CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_taskinst` */

/*Table structure for table `act_hi_varinst` */

DROP TABLE IF EXISTS `act_hi_varinst`;

CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_varinst` */

/*Table structure for table `act_id_group` */

DROP TABLE IF EXISTS `act_id_group`;

CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_group` */

/*Table structure for table `act_id_info` */

DROP TABLE IF EXISTS `act_id_info`;

CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_info` */

/*Table structure for table `act_id_membership` */

DROP TABLE IF EXISTS `act_id_membership`;

CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_membership` */

/*Table structure for table `act_id_user` */

DROP TABLE IF EXISTS `act_id_user`;

CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_user` */

/*Table structure for table `act_procdef_info` */

DROP TABLE IF EXISTS `act_procdef_info`;

CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_procdef_info` */

/*Table structure for table `act_re_deployment` */

DROP TABLE IF EXISTS `act_re_deployment`;

CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_deployment` */

insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`TENANT_ID_`,`DEPLOY_TIME_`) values ('bcd1a51bb11b4c4ca58480103ab969f7','SpringAutoDeployment',NULL,'','2018-03-02 21:26:11.724');

/*Table structure for table `act_re_model` */

DROP TABLE IF EXISTS `act_re_model`;

CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_model` */

insert  into `act_re_model`(`ID_`,`REV_`,`NAME_`,`KEY_`,`CATEGORY_`,`CREATE_TIME_`,`LAST_UPDATE_TIME_`,`VERSION_`,`META_INFO_`,`DEPLOYMENT_ID_`,`EDITOR_SOURCE_VALUE_ID_`,`EDITOR_SOURCE_EXTRA_VALUE_ID_`,`TENANT_ID_`) values ('5ae857e8893e4694bb8a10ebaf0beaca',2,'test2','tt2','1','2018-03-03 11:23:00.671','2018-03-03 11:23:00.674',1,'{\"name\":\"test2\",\"revision\":1,\"description\":\"ttModule\"}',NULL,'13531562715648eb95ded20283949233',NULL,'');

/*Table structure for table `act_re_procdef` */

DROP TABLE IF EXISTS `act_re_procdef`;

CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_procdef` */

insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`) values ('test_audit:1:562884f91151466991065216cd18a795',1,'http://www.activiti.org/test','流程审批测试流程','test_audit',1,'bcd1a51bb11b4c4ca58480103ab969f7','test_audit.bpmn20.xml','test_audit.png',NULL,1,1,1,'');

/*Table structure for table `act_ru_event_subscr` */

DROP TABLE IF EXISTS `act_ru_event_subscr`;

CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_event_subscr` */

/*Table structure for table `act_ru_execution` */

DROP TABLE IF EXISTS `act_ru_execution`;

CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_execution` */

/*Table structure for table `act_ru_identitylink` */

DROP TABLE IF EXISTS `act_ru_identitylink`;

CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_identitylink` */

/*Table structure for table `act_ru_job` */

DROP TABLE IF EXISTS `act_ru_job`;

CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_job` */

/*Table structure for table `act_ru_task` */

DROP TABLE IF EXISTS `act_ru_task`;

CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_task` */

/*Table structure for table `act_ru_variable` */

DROP TABLE IF EXISTS `act_ru_variable`;

CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_variable` */

/*Table structure for table `bj_cert_record` */

DROP TABLE IF EXISTS `bj_cert_record`;

CREATE TABLE `bj_cert_record` (
  `id` varchar(64) NOT NULL,
  `code` varchar(50) DEFAULT NULL COMMENT '卡号',
  `examination_code` varchar(50) NOT NULL COMMENT '体检编号',
  `user_id` varchar(64) NOT NULL COMMENT '体检用户',
  `id_number` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `user_name` varchar(50) NOT NULL COMMENT '姓名',
  `phone_number` varchar(45) NOT NULL COMMENT '联系电话',
  `sex` varchar(64) DEFAULT NULL COMMENT '性别',
  `industry_id` varchar(64) DEFAULT NULL COMMENT '行业',
  `post_id` varchar(64) DEFAULT NULL COMMENT '岗位',
  `birthday` varchar(10) DEFAULT NULL COMMENT '出生日期',
  `organ_id` varchar(64) DEFAULT NULL COMMENT '单位',
  `record_date` datetime NOT NULL COMMENT '体检登记日期',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `owner` varchar(64) DEFAULT NULL COMMENT '所属体检中心',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='制卡记录';

/*Data for the table `bj_cert_record` */

/*Table structure for table `bj_examination_category` */

DROP TABLE IF EXISTS `bj_examination_category`;

CREATE TABLE `bj_examination_category` (
  `id` varchar(64) NOT NULL,
  `code` varchar(45) NOT NULL COMMENT '编号',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `reference_flag` char(1) NOT NULL DEFAULT '0' COMMENT '参考标识：0-否，1-是',
  `owner` varchar(64) DEFAULT NULL COMMENT '所属体检中心',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='检查大类';

/*Data for the table `bj_examination_category` */

insert  into `bj_examination_category`(`id`,`code`,`name`,`del_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`reference_flag`,`owner`) values ('04022523d45b4fc0b41a52209fa2d1d2','001','健康证','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-17 16:01:25','dbd1c02859f8434aad548bbd09cd74b5','2018-03-17 16:01:25','','0','f2d694c5e8544169a129a5354c8d4a7a'),('408f8563e4a642a89b55f233a65a27d7','EC20180005','普通健康证','0','1','2018-04-16 11:06:28','1','2018-04-16 11:06:28','','0','22cdf43b3cf64706923b2bdc7bdd32ba'),('53c68dc2d6a742fba86bd2ab8842da9b','1001-JCLB2018002','饲养证','0','1','2018-04-23 00:49:05','1','2018-04-23 00:49:05','','0','f2d694c5e8544169a129a5354c8d4a7a'),('7b9ee47219e3414e8f8568dd718f0927','001','医疗证','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-15 11:55:01','1','2018-04-23 00:42:39','','0','f2d694c5e8544169a129a5354c8d4a7a'),('b2609b1bc8be4edda437d70d7c5fd475','001','健康证','0','92e9531b7c5d4fa2b13997b98d601000','2018-03-07 17:33:13','92e9531b7c5d4fa2b13997b98d601000','2018-03-07 17:33:13','','1',NULL);

/*Table structure for table `bj_examination_dept` */

DROP TABLE IF EXISTS `bj_examination_dept`;

CREATE TABLE `bj_examination_dept` (
  `id` varchar(64) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '名称',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `reference_flag` char(1) NOT NULL DEFAULT '0' COMMENT '参考标识：0-否，1-是',
  `owner` varchar(64) DEFAULT NULL COMMENT '所属体检中心',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='检查部门';

/*Data for the table `bj_examination_dept` */

insert  into `bj_examination_dept`(`id`,`name`,`del_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`reference_flag`,`owner`) values ('1312dd4d7b4b4713a694e43dfa615073','眼科','0','92e9531b7c5d4fa2b13997b98d601000','2018-03-11 16:12:14','92e9531b7c5d4fa2b13997b98d601000','2018-03-11 16:12:27','yanke','1',NULL),('3c80c31993bb40a697eb0d625f1af319','内科','0','92e9531b7c5d4fa2b13997b98d601000','2018-03-11 16:12:46','92e9531b7c5d4fa2b13997b98d601000','2018-03-11 16:12:46','neike','1',NULL),('4d20d8a6c8364976a2c751f9ff40e819','内科','0','1','2018-04-16 11:03:34','1','2018-04-16 11:03:34','','0','22cdf43b3cf64706923b2bdc7bdd32ba'),('5f5b12990a64439f8b4581a057ba5f85','眼科','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-11 16:32:35','dbd1c02859f8434aad548bbd09cd74b5','2018-03-11 16:32:35','yanke','0','f2d694c5e8544169a129a5354c8d4a7a'),('73fceece37114701a3bb1715a75f4bf1','内科','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-11 16:32:35','dbd1c02859f8434aad548bbd09cd74b5','2018-03-11 16:32:35','neike','0','f2d694c5e8544169a129a5354c8d4a7a'),('88ba6755ac1a470ba5e15e59c330480c','眼科','0','1','2018-04-16 11:03:29','1','2018-04-16 11:03:29','','0','22cdf43b3cf64706923b2bdc7bdd32ba'),('b2634f264e7145cda725913180a754a2','前台','0','1','2018-04-16 11:03:23','1','2018-04-16 11:03:23','','0','22cdf43b3cf64706923b2bdc7bdd32ba');

/*Table structure for table `bj_examination_form` */

DROP TABLE IF EXISTS `bj_examination_form`;

CREATE TABLE `bj_examination_form` (
  `id` varchar(64) NOT NULL,
  `code` varchar(45) NOT NULL COMMENT '编号',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `reference_flag` char(1) DEFAULT '0' COMMENT '参考标识：0-否，1-是',
  `owner` varchar(64) DEFAULT NULL COMMENT '所属体检中心',
  `template_path` varchar(64) DEFAULT NULL COMMENT '模板路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='体检流程表模板';

/*Data for the table `bj_examination_form` */

/*Table structure for table `bj_examination_item` */

DROP TABLE IF EXISTS `bj_examination_item`;

CREATE TABLE `bj_examination_item` (
  `id` varchar(64) NOT NULL,
  `code` varchar(45) NOT NULL COMMENT '编号',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `reference_flag` char(1) NOT NULL DEFAULT '0' COMMENT '参考标识：0-否，1-是',
  `owner` varchar(64) DEFAULT NULL COMMENT '所属体检中心',
  `type_id` varchar(64) DEFAULT NULL COMMENT '检查项目类型',
  `unit` varchar(64) DEFAULT NULL COMMENT '单位',
  `price` varchar(45) DEFAULT NULL COMMENT '价格',
  `range_max` varchar(45) DEFAULT NULL COMMENT '参考范围最大值',
  `range_min` varchar(45) DEFAULT NULL COMMENT '参考范围最小值',
  `specimen_id` varchar(64) DEFAULT NULL COMMENT '所需标本',
  `permission` varchar(100) DEFAULT NULL,
  `need_samples` char(1) DEFAULT '0' COMMENT '是否需要样本：0-否，1-是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='检查项目';

/*Data for the table `bj_examination_item` */

/*Table structure for table `bj_examination_item_category` */

DROP TABLE IF EXISTS `bj_examination_item_category`;

CREATE TABLE `bj_examination_item_category` (
  `id` varchar(64) NOT NULL,
  `code` varchar(45) NOT NULL COMMENT '编号',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `reference_flag` char(1) NOT NULL DEFAULT '0' COMMENT '参考标识：0-否，1-是',
  `owner` varchar(64) DEFAULT NULL COMMENT '所属体检中心',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='检查小类';

/*Data for the table `bj_examination_item_category` */

insert  into `bj_examination_item_category`(`id`,`code`,`name`,`del_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`reference_flag`,`owner`) values ('071ca7e1ad3541ab928b111010005cda','1','抽血及其他检验项目','0','92e9531b7c5d4fa2b13997b98d601000','2018-03-15 12:26:28','92e9531b7c5d4fa2b13997b98d601000','2018-03-15 12:26:28','','1',NULL),('269f2c9365094aa18baf8dbcd893b9ca','1001-XMFL002','腿脚检查','0','1','2018-04-23 00:49:18','1','2018-04-23 00:49:18','','0','f2d694c5e8544169a129a5354c8d4a7a'),('a378d0c832474bcba967471e28925dc2','1','抽血及其他检验项目','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-15 12:33:38','dbd1c02859f8434aad548bbd09cd74b5','2018-03-15 12:33:38','','0','f2d694c5e8544169a129a5354c8d4a7a');

/*Table structure for table `bj_examination_item_type` */

DROP TABLE IF EXISTS `bj_examination_item_type`;

CREATE TABLE `bj_examination_item_type` (
  `id` varchar(64) NOT NULL,
  `code` varchar(45) NOT NULL COMMENT '编号',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `reference_flag` char(1) NOT NULL DEFAULT '0' COMMENT '参考标识：0-否，1-是',
  `owner` varchar(64) DEFAULT NULL COMMENT '所属体检中心',
  `item_category_id` varchar(64) DEFAULT NULL COMMENT '检查小类',
  `examination_dept_id` varchar(64) DEFAULT NULL COMMENT '检查部门',
  `tips` varchar(100) DEFAULT NULL COMMENT '提示信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='检查项目类型';

/*Data for the table `bj_examination_item_type` */

insert  into `bj_examination_item_type`(`id`,`code`,`name`,`del_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`reference_flag`,`owner`,`item_category_id`,`examination_dept_id`,`tips`) values ('16242556fd2b4ff1aa10ec6cd4af0f2b','11','验血1','0','92e9531b7c5d4fa2b13997b98d601000','2018-03-11 16:22:30','92e9531b7c5d4fa2b13997b98d601000','2018-03-11 16:24:32','wss1','1',NULL,NULL,NULL,'空腹1'),('6599c832a9f74fb78cbe15c8f7c65172','1001-XMLX2018002','腿脚检查','0','1','2018-04-23 00:47:47','1','2018-04-23 00:47:47','','0','f2d694c5e8544169a129a5354c8d4a7a','a378d0c832474bcba967471e28925dc2','5f5b12990a64439f8b4581a057ba5f85',''),('8d64431dc112421087cb26639898501c','1001','外科','0','1','2018-04-16 11:07:11','1','2018-04-16 11:07:11','','0','22cdf43b3cf64706923b2bdc7bdd32ba','','b2634f264e7145cda725913180a754a2',''),('b840dd0f0387463abdc0be0a7868139e','2','验尿','0','92e9531b7c5d4fa2b13997b98d601000','2018-03-11 16:38:32','92e9531b7c5d4fa2b13997b98d601000','2018-03-11 16:38:32','yn','1',NULL,NULL,NULL,'空腹哦'),('d25fe3e680514624b82ab5b6daf69965','11','脾肺脏','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-11 16:47:07','1','2018-04-23 00:47:23','wss1','0','f2d694c5e8544169a129a5354c8d4a7a','a378d0c832474bcba967471e28925dc2','73fceece37114701a3bb1715a75f4bf1',''),('d3b4d6e92c414f6e9ef315a2b9c5172f','11','五官检查','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-17 13:11:38','1','2018-04-23 00:46:44','阿斯蒂芬','0','f2d694c5e8544169a129a5354c8d4a7a','a378d0c832474bcba967471e28925dc2','5f5b12990a64439f8b4581a057ba5f85',''),('d7138446a1e444db94dc601041c3c7ba','2','验尿','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 09:35:34','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 09:35:34','yn','0','f2d694c5e8544169a129a5354c8d4a7a',NULL,NULL,NULL),('e3367d0e2cd44f328597871bf2db25e7','1002','心肺功能','0','1','2018-04-16 11:09:46','1','2018-04-16 11:09:46','','0','22cdf43b3cf64706923b2bdc7bdd32ba','','4d20d8a6c8364976a2c751f9ff40e819','');

/*Table structure for table `bj_examination_package` */

DROP TABLE IF EXISTS `bj_examination_package`;

CREATE TABLE `bj_examination_package` (
  `id` varchar(64) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '名称',
  `price` varchar(100) DEFAULT NULL COMMENT '价格',
  `category_id` varchar(64) NOT NULL COMMENT '检查大类',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `reference_flag` char(1) DEFAULT '0' COMMENT '参考标识：0-否，1-是',
  `owner` varchar(64) DEFAULT NULL COMMENT '所属体检中心',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='体检套餐';

/*Data for the table `bj_examination_package` */

insert  into `bj_examination_package`(`id`,`name`,`price`,`category_id`,`del_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`reference_flag`,`owner`) values ('a33e22f7d5a74b488852ae379ca2ea12','医生健康证','30','53c68dc2d6a742fba86bd2ab8842da9b','0','1','2018-04-18 17:03:07','1','2018-04-23 02:37:48','',NULL,NULL),('c0f1d0e745a84c7c872b261eff1d6593','企业健康证体检','100','04022523d45b4fc0b41a52209fa2d1d2','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-15 16:19:44','1','2018-04-23 02:37:33','',NULL,NULL);

/*Table structure for table `bj_examination_record` */

DROP TABLE IF EXISTS `bj_examination_record`;

CREATE TABLE `bj_examination_record` (
  `id` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL COMMENT '体检用户',
  `code` varchar(50) DEFAULT NULL COMMENT '编号',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `phone_number` varchar(45) NOT NULL COMMENT '联系电话',
  `sex` varchar(64) NOT NULL COMMENT '性别',
  `industry_id` varchar(64) DEFAULT NULL COMMENT '行业',
  `post_id` varchar(64) DEFAULT NULL COMMENT '岗位',
  `birthday` varchar(10) NOT NULL COMMENT '出生日期',
  `organ_id` varchar(64) DEFAULT NULL COMMENT '单位',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `owner` varchar(64) DEFAULT NULL COMMENT '所属体检中心',
  `package_id` varchar(64) DEFAULT NULL COMMENT '体检套餐',
  `package_price` varchar(64) DEFAULT NULL COMMENT '套餐价格',
  `id_number` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `status` varchar(64) DEFAULT NULL COMMENT '体检状态，对应examination_record_status字典',
  `item_type` char(1) DEFAULT '1' COMMENT '体检项目方式:1-体检套餐，2-自由选择',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='体检记录';

/*Data for the table `bj_examination_record` */

/*Table structure for table `bj_examination_record_item` */

DROP TABLE IF EXISTS `bj_examination_record_item`;

CREATE TABLE `bj_examination_record_item` (
  `id` varchar(64) NOT NULL,
  `record_id` varchar(64) NOT NULL COMMENT '检查记录',
  `item_id` varchar(64) NOT NULL COMMENT '检查项目',
  `item_name` varchar(50) DEFAULT NULL,
  `need_samples` char(1) DEFAULT NULL COMMENT '是否需要样本：0-否，1-是',
  `specimen_id` varchar(64) DEFAULT NULL COMMENT '样本类型id',
  `sample_code` varchar(50) DEFAULT NULL COMMENT '样本编号',
  `result_dict_id` varchar(64) DEFAULT NULL COMMENT '体检结果',
  `result_dict_name` varchar(255) DEFAULT NULL COMMENT '体检结果',
  `result_flag` varchar(1) DEFAULT NULL COMMENT '检合格标识：0-否，1-是',
  `result_remarks` varchar(255) DEFAULT NULL COMMENT '结果备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `last_flag` varchar(1) DEFAULT '1' COMMENT '本次检查记录中同项目最后一次检查标识：0-否，1-是',
  `examination_flag` varchar(1) DEFAULT '1' COMMENT '1-初检，2-复检',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='检查记录项目';

/*Data for the table `bj_examination_record_item` */

/*Table structure for table `bj_examination_result` */

DROP TABLE IF EXISTS `bj_examination_result`;

CREATE TABLE `bj_examination_result` (
  `id` varchar(64) NOT NULL,
  `examination_code` varchar(50) DEFAULT NULL COMMENT '体检编号',
  `sample_code` varchar(50) DEFAULT NULL COMMENT '样本编号',
  `item_name` varchar(100) NOT NULL COMMENT '项目',
  `item_id` varchar(64) NOT NULL COMMENT '项目id',
  `user_id` varchar(64) NOT NULL COMMENT '体检用户',
  `result_flag` varchar(1) NOT NULL COMMENT '检合格标识：0-否，1-是',
  `result_dict_id` varchar(64) NOT NULL COMMENT '体检结果',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `owner` varchar(64) DEFAULT NULL COMMENT '所属体检中心',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='体检项目结果';

/*Data for the table `bj_examination_result` */

/*Table structure for table `bj_examination_result_dict` */

DROP TABLE IF EXISTS `bj_examination_result_dict`;

CREATE TABLE `bj_examination_result_dict` (
  `id` varchar(64) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '名称',
  `item_id` varchar(64) NOT NULL COMMENT '检查项目',
  `default_flag` char(1) NOT NULL DEFAULT '0' COMMENT '是否默认：0-否，1-是',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '具体描述',
  `flag` varchar(1) DEFAULT NULL COMMENT '是否合格：0-否，1-是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='体检结果字典';

/*Data for the table `bj_examination_result_dict` */

insert  into `bj_examination_result_dict`(`id`,`name`,`item_id`,`default_flag`,`del_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`flag`) values ('660c0f8f68ec416e8134e335acb9038a','不合格','ef0d0138fce440a8950a28744f5f7dc3','0','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-17 14:45:53','dbd1c02859f8434aad548bbd09cd74b5','2018-04-12 10:18:00','1234','0'),('a6b8e7a8a456469c929fa5a7aba2c798','不合格','1f8d8b21a4d844b986c969a935325d4f','0','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-17 14:46:13','dbd1c02859f8434aad548bbd09cd74b5','2018-04-12 10:17:52','ggg','0'),('d341285769ba4abda4906f273ccc3022','不合格','e0835a627f7c4880ac02fbf6c982f8bd','0','0','dbd1c02859f8434aad548bbd09cd74b5','2018-04-01 18:39:47','dbd1c02859f8434aad548bbd09cd74b5','2018-04-12 10:16:37','血压不合格','0');

/*Table structure for table `bj_examination_samples` */

DROP TABLE IF EXISTS `bj_examination_samples`;

CREATE TABLE `bj_examination_samples` (
  `id` varchar(64) NOT NULL,
  `record_id` varchar(64) NOT NULL COMMENT '检查记录',
  `record_item_id` varchar(64) NOT NULL COMMENT '检查记录项目id',
  `examination_code` varchar(50) DEFAULT NULL COMMENT '体检编号',
  `code` varchar(50) DEFAULT NULL COMMENT '编号',
  `item_id` varchar(64) NOT NULL COMMENT '项目id',
  `result_dict_id` varchar(64) DEFAULT NULL COMMENT '体检结果',
  `result_flag` varchar(1) DEFAULT NULL COMMENT '检合格标识：0-否，1-是',
  `result_remarks` varchar(255) DEFAULT NULL COMMENT '结果备注',
  `user_id` varchar(64) NOT NULL COMMENT '体检用户',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `owner` varchar(64) DEFAULT NULL COMMENT '所属体检中心',
  `examination_flag` varchar(1) DEFAULT '1' COMMENT '1-初检，2-复检',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='体检样本';

/*Data for the table `bj_examination_samples` */

insert  into `bj_examination_samples`(`id`,`record_id`,`record_item_id`,`examination_code`,`code`,`item_id`,`result_dict_id`,`result_flag`,`result_remarks`,`user_id`,`del_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`owner`,`examination_flag`) values ('1925f90230874c0b87f635777077a350','255c8972fae64d60a07954811eee93b3','62807210af764b82850ae01079c5c674','1001-10201804190002','','ef0d0138fce440a8950a28744f5f7dc3',NULL,NULL,NULL,'7b83d5d0d78241aa9519909d957e2af6','0','1','2018-04-21 14:51:50','1','2018-04-21 14:51:50','','f2d694c5e8544169a129a5354c8d4a7a','1'),('1e9c2f5ed3554fdc931903beae9b121c','9f8d6f41a3814970a8454e485946a7ea','e3b70cce3a8d4ce5aeca2a1d6b9919e3','0020011800000252','1234','1f8d8b21a4d844b986c969a935325d4f','e00853ba3cfa4c1b9af147000579a6f6','1','问问','47dedc506cca4e138eb6f12cfedbbc00','0','dbd1c02859f8434aad548bbd09cd74b5','2018-04-14 21:20:15','dbd1c02859f8434aad548bbd09cd74b5','2018-04-14 21:20:15','','f2d694c5e8544169a129a5354c8d4a7a','1'),('917167e686bf455fac25b6cecd0f7dfd','255c8972fae64d60a07954811eee93b3','eb0565e575d44e57abe9a7e3bd72357e','1001-10201804190002','1001-XY201804200122','1f8d8b21a4d844b986c969a935325d4f',NULL,NULL,NULL,'7b83d5d0d78241aa9519909d957e2af6','0','1','2018-04-21 11:46:11','1','2018-04-21 11:46:11','','f2d694c5e8544169a129a5354c8d4a7a','1'),('c5e0e06173f7440db89869ad83787d0f','9f8d6f41a3814970a8454e485946a7ea','be9fd5b72a0b43a79f181577b4638bb0','0020011800000252','123','ef0d0138fce440a8950a28744f5f7dc3','660c0f8f68ec416e8134e335acb9038a','0','1234','47dedc506cca4e138eb6f12cfedbbc00','0','dbd1c02859f8434aad548bbd09cd74b5','2018-04-14 18:32:36','dbd1c02859f8434aad548bbd09cd74b5','2018-04-14 18:32:36','','f2d694c5e8544169a129a5354c8d4a7a','1');

/*Table structure for table `bj_examination_user` */

DROP TABLE IF EXISTS `bj_examination_user`;

CREATE TABLE `bj_examination_user` (
  `id` varchar(64) NOT NULL,
  `code` varchar(50) DEFAULT NULL COMMENT '编号',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `head_img_path` varchar(128) DEFAULT NULL COMMENT '真实照片图片',
  `phone_number` varchar(45) NOT NULL COMMENT '联系电话',
  `id_number` varchar(20) NOT NULL COMMENT '身份证号',
  `sex` varchar(64) NOT NULL COMMENT '性别',
  `industry_id` varchar(64) DEFAULT NULL COMMENT '行业',
  `post_id` varchar(64) DEFAULT NULL COMMENT '岗位',
  `birthday` varchar(10) NOT NULL COMMENT '出生日期',
  `organ_id` varchar(64) DEFAULT NULL COMMENT '单位',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `owner` varchar(64) DEFAULT NULL COMMENT '所属体检中心',
  `default_record` char(1) NOT NULL DEFAULT '0' COMMENT '默认记录，不允许删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='体检用户';

/*Data for the table `bj_examination_user` */

insert  into `bj_examination_user`(`id`,`code`,`name`,`head_img_path`,`phone_number`,`id_number`,`sex`,`industry_id`,`post_id`,`birthday`,`organ_id`,`del_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`owner`,`default_record`) values ('12850e0792ed4f34801588d1483b20ce','1001-EU1804220003','张三丰','','13854855484','138325198505081548','1','8c5f1d7ee3c040b3b4743e5e45324612','a77e3b4e4c5d44cca1e317f24c5785e7','1985-05-08','508b1b81505b46e1be929413242cf016','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-13 09:13:41','1','2018-04-22 22:19:32','发反反复复','f2d694c5e8544169a129a5354c8d4a7a','0'),('47dedc506cca4e138eb6f12cfedbbc00','1001-EU1804220006','李小璐','/wshbj/userfiles/1/images/2018/04/23/1139107z7e.jpg/','458455','138215198805061584','2','c8b6f329cc024c48abc3548a9bb741de','a77e3b4e4c5d44cca1e317f24c5785e7','1988-05-06','f647e35a8ea440e7813372ae4e932a77','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-16 13:14:26','1','2018-04-23 11:39:14','','f2d694c5e8544169a129a5354c8d4a7a','0'),('7b83d5d0d78241aa9519909d957e2af6','1001-EU1804220008','张武强','/wshbj/userfiles/1/images/2018/04/23/142655gx8y.jpg/','1382873828','192158197212031543','1','5e24382898c340cfa16417ea5eb3298d','d3fe276675cf4f50a295acf87ea72e63','1972-12-03','f647e35a8ea440e7813372ae4e932a77','0','1','2018-04-16 11:00:41','1','2018-04-23 14:26:58','','f2d694c5e8544169a129a5354c8d4a7a','0'),('a044d543fd674ce298c01c78d4bef859','1001-EU1804220004','张翠山','/wshbj/userfiles/1/images/2018/04/23/142629ejtv.jpg/','84885484','158548198912031585','1','5e24382898c340cfa16417ea5eb3298d','a77e3b4e4c5d44cca1e317f24c5785e7','1989-12-03','508b1b81505b46e1be929413242cf016','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 12:51:51','1','2018-04-23 14:26:33','2232','f2d694c5e8544169a129a5354c8d4a7a','0'),('ac19c8d4932c427db0ef8d339f5fc2ab','1001-EU1804220002','周杰伦','/wshbj/userfiles/1/images/2018/04/22/183208k8db.jpg/','1584544545','138542197505111254','1','c8b6f329cc024c48abc3548a9bb741de','d3fe276675cf4f50a295acf87ea72e63','1975-05-11','f647e35a8ea440e7813372ae4e932a77','0','1','2018-04-22 18:25:35','1','2018-04-22 23:20:59','打发斯蒂芬','f2d694c5e8544169a129a5354c8d4a7a','0'),('dda5c4367edd404c86ba858b7577f35d','1001-EU1804220002','张强','/wshbj/userfiles/1/images/2018/04/23/1138336gz1.jpg/','23841458','158458196811023541','1','c8b6f329cc024c48abc3548a9bb741de','a77e3b4e4c5d44cca1e317f24c5785e7','1968-11-02','bdb1267f643b48848c801efb35520f9e','0','1','2018-04-20 09:53:19','1','2018-04-23 11:38:39','','f2d694c5e8544169a129a5354c8d4a7a','0'),('e2f56e09c9df4eefa296e3261dd1a7dd','1001-EU1804220007','李宗盛','/wshbj/userfiles/1/images/2018/04/23/142708807r.jpg/','12585111','185454196506071548','1','5e24382898c340cfa16417ea5eb3298d','d3fe276675cf4f50a295acf87ea72e63','1965-06-07','f647e35a8ea440e7813372ae4e932a77','0','1','2018-04-22 17:57:03','1','2018-04-23 14:27:11','阿士大夫撒反对','f2d694c5e8544169a129a5354c8d4a7a','0'),('fef7399cc45049e8aeed5e8b124b3857','1001-EU1804220005','黄继光','','19754884','584865194905081548','1','c8b6f329cc024c48abc3548a9bb741de','a77e3b4e4c5d44cca1e317f24c5785e7','1949-05-08','f647e35a8ea440e7813372ae4e932a77','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-16 13:17:20','1','2018-04-22 22:20:55','','f2d694c5e8544169a129a5354c8d4a7a','0');

/*Table structure for table `bj_global_set` */

DROP TABLE IF EXISTS `bj_global_set`;

CREATE TABLE `bj_global_set` (
  `id` varchar(64) DEFAULT NULL,
  `owner` varchar(64) NOT NULL COMMENT '所属的体检中心',
  `code_pre` varchar(16) DEFAULT NULL COMMENT '当前体检中心编号前缀',
  `center_name` varchar(32) DEFAULT NULL COMMENT '体检中心名称，添加后，自动增加到部门的体检中心节点下'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='体检项目全局参数配置';

/*Data for the table `bj_global_set` */

insert  into `bj_global_set`(`id`,`owner`,`code_pre`,`center_name`) values ('628bc8b3eb85439c86878f0f860c71d3','3df93034ae954ec8b0df054c33a1c561','1001-','幻灵体检');

/*Table structure for table `bj_industry` */

DROP TABLE IF EXISTS `bj_industry`;

CREATE TABLE `bj_industry` (
  `id` varchar(64) NOT NULL,
  `code` varchar(45) NOT NULL COMMENT '编号',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `reference_flag` char(1) DEFAULT '0' COMMENT '参考标识：0-否，1-是',
  `owner` varchar(64) DEFAULT NULL COMMENT '所属体检中心',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='行业数据';

/*Data for the table `bj_industry` */

insert  into `bj_industry`(`id`,`code`,`name`,`del_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`reference_flag`,`owner`) values ('0281f1fc66b6411abca99fc1d4afc093','1001','餐饮业','0','1','2018-04-16 11:02:25','1','2018-04-16 11:02:25','','0','22cdf43b3cf64706923b2bdc7bdd32ba'),('07b7419fa0b2437ca4d6013579e168b4','1','食品','0','1','2018-03-06 13:42:19','1','2018-03-06 13:42:19',NULL,'0',NULL),('417543aceaad49b5954b4177bfd242ab','1','医疗','0','92e9531b7c5d4fa2b13997b98d601000','2018-03-12 09:59:42','92e9531b7c5d4fa2b13997b98d601000','2018-03-12 09:59:42','医疗医疗','1',NULL),('5e24382898c340cfa16417ea5eb3298d','2','互联网','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 10:00:41','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 10:00:41','互联网互联网互联网','0','f2d694c5e8544169a129a5354c8d4a7a'),('8c5f1d7ee3c040b3b4743e5e45324612','100','医疗','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 10:02:22','1','2018-04-22 22:56:38','医疗医疗','0','f2d694c5e8544169a129a5354c8d4a7a'),('963b434d1dff4e80ba91bdf32c68dd29','2','互联网','0','92e9531b7c5d4fa2b13997b98d601000','2018-03-12 09:59:58','92e9531b7c5d4fa2b13997b98d601000','2018-03-12 10:00:19','互联网互联网互联网','1',NULL),('b281ca30aa3a40a4b5c9ded0b5a3f53a','1001-HY2018002','农牧业','0','1','2018-04-23 01:19:43','1','2018-04-23 01:19:43','','0','f2d694c5e8544169a129a5354c8d4a7a'),('b737a42579cb453ab3ea42d23fe8c03d','1002','武装部','0','1','2018-04-16 11:02:39','1','2018-04-16 11:02:39','','0','22cdf43b3cf64706923b2bdc7bdd32ba'),('c8b6f329cc024c48abc3548a9bb741de','1','食品','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 09:58:44','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 09:58:44','食品食品食品','0','f2d694c5e8544169a129a5354c8d4a7a');

/*Table structure for table `bj_job_post` */

DROP TABLE IF EXISTS `bj_job_post`;

CREATE TABLE `bj_job_post` (
  `id` varchar(64) NOT NULL,
  `code` varchar(45) NOT NULL COMMENT '编号',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `reference_flag` char(1) DEFAULT '0' COMMENT '参考标识：0-否，1-是',
  `owner` varchar(64) DEFAULT NULL COMMENT '所属体检中心',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作岗位';

/*Data for the table `bj_job_post` */

insert  into `bj_job_post`(`id`,`code`,`name`,`del_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`reference_flag`,`owner`) values ('67d9e8748e2c468f8c6d3d362e6ef125','1002','经理','0','1','2018-04-16 11:02:48','1','2018-04-16 11:02:48','','0','22cdf43b3cf64706923b2bdc7bdd32ba'),('6b4b79f6026c4993bbc81619baafe259','1','主任','0','92e9531b7c5d4fa2b13997b98d601000','2018-03-12 10:18:38','92e9531b7c5d4fa2b13997b98d601000','2018-03-12 10:19:02','主任主任主任','1',NULL),('95af9ac87222439389d695f614c9293f','1001-GW2018003','科学家','0','1','2018-04-23 01:20:12','1','2018-04-23 01:20:12','','0','f2d694c5e8544169a129a5354c8d4a7a'),('a77e3b4e4c5d44cca1e317f24c5785e7','1','主任','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 10:20:58','1','2018-04-22 23:01:20','主任主任','0','f2d694c5e8544169a129a5354c8d4a7a'),('b3d4ec7f484a4a72b271b03ca86bedac','1003','站岗','0','1','2018-04-16 11:02:59','1','2018-04-16 11:02:59','','0','22cdf43b3cf64706923b2bdc7bdd32ba'),('cec3f54ede5347b49e471bf550f3fb31','1001-GW2018002','程序员','0','1','2018-04-23 01:19:57','1','2018-04-23 01:19:57','','0','f2d694c5e8544169a129a5354c8d4a7a'),('d3fe276675cf4f50a295acf87ea72e63','2','院长','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 10:20:16','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 10:20:16','22','0','f2d694c5e8544169a129a5354c8d4a7a');

/*Table structure for table `bj_organ` */

DROP TABLE IF EXISTS `bj_organ`;

CREATE TABLE `bj_organ` (
  `id` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL COMMENT '单位编号',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `reference_flag` char(1) DEFAULT '0' COMMENT '参考标识：0-否，1-是',
  `owner` varchar(64) DEFAULT NULL COMMENT '所属体检中心',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='体检单位';

/*Data for the table `bj_organ` */

insert  into `bj_organ`(`id`,`code`,`name`,`del_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`reference_flag`,`owner`) values ('508b1b81505b46e1be929413242cf016','','粮食局','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 12:33:02','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 12:33:02','粮食局粮食局','0','f2d694c5e8544169a129a5354c8d4a7a'),('97559e87e942489ab6cac544887fec67','','微软大中华区','0','1','2018-04-16 11:01:38','1','2018-04-16 11:01:38','','0','22cdf43b3cf64706923b2bdc7bdd32ba'),('bdb1267f643b48848c801efb35520f9e','','中铁十七局','0','1','2018-04-22 23:05:36','1','2018-04-22 23:05:36','','0','f2d694c5e8544169a129a5354c8d4a7a'),('f647e35a8ea440e7813372ae4e932a77','','工商局','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-15 14:51:11','dbd1c02859f8434aad548bbd09cd74b5','2018-03-15 14:51:11','','0','f2d694c5e8544169a129a5354c8d4a7a');

/*Table structure for table `bj_package_item` */

DROP TABLE IF EXISTS `bj_package_item`;

CREATE TABLE `bj_package_item` (
  `id` varchar(64) NOT NULL,
  `package_id` varchar(64) NOT NULL COMMENT '检查套餐',
  `item_id` varchar(64) NOT NULL COMMENT '检查项目',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='套餐包含检查项目';

/*Data for the table `bj_package_item` */

insert  into `bj_package_item`(`id`,`package_id`,`item_id`,`del_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`) values ('07bfa37183b64efcb260b158e6e56e11','c0f1d0e745a84c7c872b261eff1d6593','1f8d8b21a4d844b986c969a935325d4f','0','1','2018-04-23 02:37:33','1','2018-04-23 02:37:33',NULL),('14c16f1086cb4967869ad117bd48dfbc','a33e22f7d5a74b488852ae379ca2ea12','ef0d0138fce440a8950a28744f5f7dc3','0','1','2018-04-23 02:37:48','1','2018-04-23 02:37:48',NULL),('429dff1c0cc746c0b0b754856b610ccb','a33e22f7d5a74b488852ae379ca2ea12','2b1cfdc1c64943c4b930c2d2ddc05379','0','1','2018-04-23 02:37:48','1','2018-04-23 02:37:48',NULL),('e9dd893d67c1483da86f6744d4340a70','c0f1d0e745a84c7c872b261eff1d6593','e0835a627f7c4880ac02fbf6c982f8bd','0','1','2018-04-23 02:37:33','1','2018-04-23 02:37:33',NULL);

/*Table structure for table `bj_r_category_item` */

DROP TABLE IF EXISTS `bj_r_category_item`;

CREATE TABLE `bj_r_category_item` (
  `category_id` varchar(64) NOT NULL COMMENT '检查大类',
  `item_id` varchar(64) NOT NULL COMMENT '检查项目'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='检查大类项目';

/*Data for the table `bj_r_category_item` */

/*Table structure for table `bj_role_item` */

DROP TABLE IF EXISTS `bj_role_item`;

CREATE TABLE `bj_role_item` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `item_id` varchar(64) NOT NULL COMMENT '体检项目ID',
  PRIMARY KEY (`role_id`,`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-项目';

/*Data for the table `bj_role_item` */

insert  into `bj_role_item`(`role_id`,`item_id`) values ('7cb57c34857a4b79a632bcb986af9c43','1f8d8b21a4d844b986c969a935325d4f'),('f624ff7878b34fbe8645afdaf9cb8133','1f8d8b21a4d844b986c969a935325d4f'),('f624ff7878b34fbe8645afdaf9cb8133','e0835a627f7c4880ac02fbf6c982f8bd'),('f624ff7878b34fbe8645afdaf9cb8133','ef0d0138fce440a8950a28744f5f7dc3');

/*Table structure for table `bj_sample_codes` */

DROP TABLE IF EXISTS `bj_sample_codes`;

CREATE TABLE `bj_sample_codes` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `specimen_id` varchar(128) NOT NULL COMMENT '样本类型ID',
  `specimen_name` varchar(64) NOT NULL COMMENT '样本类型名称',
  `pack_id` varchar(64) DEFAULT NULL COMMENT '批次id',
  `sample_code` varchar(64) NOT NULL COMMENT '样本编号',
  `auth_id` varchar(64) NOT NULL,
  `auth_name` varchar(64) DEFAULT NULL COMMENT '作者',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `owner` varchar(64) DEFAULT NULL COMMENT '所属公司',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sample_codes_code` (`sample_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='样本编号库';

/*Data for the table `bj_sample_codes` */

/*Table structure for table `bj_sample_codes_pack` */

DROP TABLE IF EXISTS `bj_sample_codes_pack`;

CREATE TABLE `bj_sample_codes_pack` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `specimen_id` varchar(64) NOT NULL COMMENT '样本类型ID',
  `specimen_name` varchar(64) NOT NULL COMMENT '样本类型名称',
  `code_count` int(11) NOT NULL COMMENT '样本编号数量',
  `auth_id` varchar(64) NOT NULL,
  `auth_name` varchar(64) DEFAULT NULL COMMENT '作者',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `owner` varchar(64) DEFAULT NULL COMMENT '所属公司',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='样本编号包';

/*Data for the table `bj_sample_codes_pack` */

/*Table structure for table `bj_specimen` */

DROP TABLE IF EXISTS `bj_specimen`;

CREATE TABLE `bj_specimen` (
  `id` varchar(64) NOT NULL,
  `code` varchar(45) NOT NULL COMMENT '编号',
  `prefix` varchar(16) NOT NULL COMMENT '编号前缀',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `reference_flag` char(1) NOT NULL DEFAULT '0' COMMENT '参考标识：0-否，1-是',
  `owner` varchar(64) DEFAULT NULL COMMENT '所属体检中心',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='检查标本类型';

/*Data for the table `bj_specimen` */

insert  into `bj_specimen`(`id`,`code`,`prefix`,`name`,`del_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`reference_flag`,`owner`) values ('243768a6a74142809e631f69aea14bc2','2','NY','尿液','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 09:29:46','1','2018-04-22 23:04:47','尿液尿液尿液','0','f2d694c5e8544169a129a5354c8d4a7a'),('442e8fa28245437b9fab38bccb7c6a32','1','XY','血液','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 09:31:38','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 09:31:38','血液血液血液血液','0','f2d694c5e8544169a129a5354c8d4a7a'),('4cedc11a34d54ad4a5618f037589c6a1','1002','NY','尿样','0','1','2018-04-16 11:08:46','1','2018-04-16 11:08:46','','0','22cdf43b3cf64706923b2bdc7bdd32ba'),('a3ffddb162514467b91a2092f1c3eb4c','1','XY','血液','0','92e9531b7c5d4fa2b13997b98d601000','2018-03-12 09:11:00','92e9531b7c5d4fa2b13997b98d601000','2018-03-12 09:11:21','血液血液血液血液','1',NULL),('ca5b8181f0b745679101438f8443dd85','1001-BBLX2018002','TY','唾液','0','1','2018-04-23 01:20:43','1','2018-04-23 01:20:43','','0','f2d694c5e8544169a129a5354c8d4a7a'),('d7789de4fabf41588a119d2cb8d049c9','1001','XY','血样','0','1','2018-04-16 11:08:37','1','2018-04-16 11:08:37','','0','22cdf43b3cf64706923b2bdc7bdd32ba');

/*Table structure for table `cms_article` */

DROP TABLE IF EXISTS `cms_article`;

CREATE TABLE `cms_article` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `category_id` varchar(64) NOT NULL COMMENT '栏目编号',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `link` varchar(255) DEFAULT NULL COMMENT '文章链接',
  `color` varchar(50) DEFAULT NULL COMMENT '标题颜色',
  `image` varchar(255) DEFAULT NULL COMMENT '文章图片',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) DEFAULT NULL COMMENT '描述、摘要',
  `weight` int(11) DEFAULT '0' COMMENT '权重，越大越靠前',
  `weight_date` datetime DEFAULT NULL COMMENT '权重期限',
  `hits` int(11) DEFAULT '0' COMMENT '点击数',
  `posid` varchar(10) DEFAULT NULL COMMENT '推荐位，多选',
  `custom_content_view` varchar(255) DEFAULT NULL COMMENT '自定义内容视图',
  `view_config` text COMMENT '视图配置',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_article_create_by` (`create_by`),
  KEY `cms_article_title` (`title`),
  KEY `cms_article_keywords` (`keywords`),
  KEY `cms_article_del_flag` (`del_flag`),
  KEY `cms_article_weight` (`weight`),
  KEY `cms_article_update_date` (`update_date`),
  KEY `cms_article_category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章表';

/*Data for the table `cms_article` */

insert  into `cms_article`(`id`,`category_id`,`title`,`link`,`color`,`image`,`keywords`,`description`,`weight`,`weight_date`,`hits`,`posid`,`custom_content_view`,`view_config`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('1','3','标题啥意思？','','blue','','关键字1,关键字2','',0,NULL,2,',null,','','','1','2013-05-27 08:00:00','1','2018-03-03 01:59:24',NULL,'0'),('10','4','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('11','5','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('12','5','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13','5','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('14','7','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('15','7','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,1,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('16','7','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('17','7','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('18','8','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('19','8','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','3','文章标题标题标题标题',NULL,'red',NULL,'关键字1,关键字2',NULL,0,NULL,1,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('20','8','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('21','8','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('22','9','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('23','9','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('24','9','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('25','9','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('26','9','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('27','11','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('28','11','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('29','11','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','3','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('30','11','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('31','11','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('32','12','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('33','12','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('34','12','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('35','12','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('36','12','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('37','13','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('38','13','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('39','13','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','3','文章标题标题标题标题',NULL,'green',NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('40','13','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('41','14','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('42','14','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('43','14','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('44','14','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('45','14','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('46','15','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('47','15','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('48','15','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('49','16','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5','3','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('50','17','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('51','17','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('52','26','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('53','26','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','3','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('7','4','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('8','4','文章标题标题标题标题',NULL,'blue',NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('9','4','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `cms_article_data` */

DROP TABLE IF EXISTS `cms_article_data`;

CREATE TABLE `cms_article_data` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `content` text COMMENT '文章内容',
  `copyfrom` varchar(255) DEFAULT NULL COMMENT '文章来源',
  `relation` varchar(255) DEFAULT NULL COMMENT '相关文章',
  `allow_comment` char(1) DEFAULT NULL COMMENT '是否允许评论',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章详表';

/*Data for the table `cms_article_data` */

insert  into `cms_article_data`(`id`,`content`,`copyfrom`,`relation`,`allow_comment`) values ('1','<p style=\"margin: 0px 0px 16px; padding: 0px; box-sizing: border-box; font-size: 16px; color: rgb(79, 79, 79); line-height: 26px; text-align: justify; word-break: normal; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun; white-space: normal;\">\r\n	Swagger 是一系列对 RESTful 接口进行规范描述和页面展示的工具. 通过 springfox-swagger 将 Swagger 与 Spring-MVC 整合, 可从代码中的注解获取信息, 并生成相应的文档. 效果如下所示.</p>\r\n<p style=\"margin: 0px 0px 16px; padding: 0px; box-sizing: border-box; font-size: 16px; color: rgb(79, 79, 79); line-height: 26px; text-align: justify; word-break: normal; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun; white-space: normal;\">\r\n	<img alt=\"这里写图片描述\" src=\"http://img.blog.csdn.net/20160929165251897\" style=\"border-width: initial; border-style: none; box-sizing: border-box; margin: 24px 0px; max-width: 602px; max-height: 100%;\" title=\"\" />&nbsp;<br style=\"box-sizing: border-box;\" />\r\n	目前 Swagger 的 api 版本规范已经更新到 2.0 版本, 中文网络上基本上都是 1.0 的 api 版本规范的教程. 捣鼓了一天终于搞定了, 这两者区别还是有的.</p>\r\n<p style=\"margin: 0px 0px 16px; padding: 0px; box-sizing: border-box; font-size: 16px; color: rgb(79, 79, 79); line-height: 26px; text-align: justify; word-break: normal; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun; white-space: normal;\">\r\n	<span style=\"box-sizing: border-box; font-weight: 700;\">注: 本文的代码见&nbsp;<a href=\"https://github.com/Frank-Hust/SpringAndStagger\" style=\"box-sizing: border-box; color: rgb(12, 137, 207);\" target=\"_blank\">https://github.com/Frank-Hust/SpringAndStagger</a>, 直接 gitclone 下来或者下载在 IDEA 中就能运行了.</span></p>\r\n<h2 id=\"先添加依赖\" style=\"margin: 8px 0px 16px; padding: 0px; box-sizing: border-box; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun; line-height: 32px; color: rgb(79, 79, 79); font-size: 24px; white-space: normal;\">\r\n	<a name=\"t0\" style=\"box-sizing: border-box; color: rgb(12, 137, 207);\" target=\"_blank\"></a>先添加依赖</h2>','来源','2,3,','1'),('10','文章内容内容内容内容','来源','1,2,3','1'),('11','文章内容内容内容内容','来源','1,2,3','1'),('12','文章内容内容内容内容','来源','1,2,3','1'),('13','文章内容内容内容内容','来源','1,2,3','1'),('14','文章内容内容内容内容','来源','1,2,3','1'),('15','文章内容内容内容内容','来源','1,2,3','1'),('16','文章内容内容内容内容','来源','1,2,3','1'),('17','文章内容内容内容内容','来源','1,2,3','1'),('18','文章内容内容内容内容','来源','1,2,3','1'),('19','文章内容内容内容内容','来源','1,2,3','1'),('2','文章内容内容内容内容','来源','1,2,3','1'),('20','文章内容内容内容内容','来源','1,2,3','1'),('21','文章内容内容内容内容','来源','1,2,3','1'),('22','文章内容内容内容内容','来源','1,2,3','1'),('23','文章内容内容内容内容','来源','1,2,3','1'),('24','文章内容内容内容内容','来源','1,2,3','1'),('25','文章内容内容内容内容','来源','1,2,3','1'),('26','文章内容内容内容内容','来源','1,2,3','1'),('27','文章内容内容内容内容','来源','1,2,3','1'),('28','文章内容内容内容内容','来源','1,2,3','1'),('29','文章内容内容内容内容','来源','1,2,3','1'),('3','文章内容内容内容内容','来源','1,2,3','1'),('30','文章内容内容内容内容','来源','1,2,3','1'),('31','文章内容内容内容内容','来源','1,2,3','1'),('32','文章内容内容内容内容','来源','1,2,3','1'),('33','文章内容内容内容内容','来源','1,2,3','1'),('34','文章内容内容内容内容','来源','1,2,3','1'),('35','文章内容内容内容内容','来源','1,2,3','1'),('36','文章内容内容内容内容','来源','1,2,3','1'),('37','文章内容内容内容内容','来源','1,2,3','1'),('38','文章内容内容内容内容','来源','1,2,3','1'),('39','文章内容内容内容内容','来源','1,2,3','1'),('4','文章内容内容内容内容','来源','1,2,3','1'),('40','文章内容内容内容内容','来源','1,2,3','1'),('41','文章内容内容内容内容','来源','1,2,3','1'),('42','文章内容内容内容内容','来源','1,2,3','1'),('43','文章内容内容内容内容','来源','1,2,3','1'),('44','文章内容内容内容内容','来源','1,2,3','1'),('45','文章内容内容内容内容','来源','1,2,3','1'),('46','文章内容内容内容内容','来源','1,2,3','1'),('47','文章内容内容内容内容','来源','1,2,3','1'),('48','文章内容内容内容内容','来源','1,2,3','1'),('49','文章内容内容内容内容','来源','1,2,3','1'),('5','文章内容内容内容内容','来源','1,2,3','1'),('50','文章内容内容内容内容','来源','1,2,3','1'),('51','文章内容内容内容内容','来源','1,2,3','1'),('52','文章内容内容内容内容','来源','1,2,3','1'),('53','文章内容内容内容内容','来源','1,2,3','1'),('6','文章内容内容内容内容','来源','1,2,3','1'),('7','文章内容内容内容内容','来源','1,2,3','1'),('8','文章内容内容内容内容','来源','1,2,3','1'),('9','文章内容内容内容内容','来源','1,2,3','1');

/*Table structure for table `cms_category` */

DROP TABLE IF EXISTS `cms_category`;

CREATE TABLE `cms_category` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `site_id` varchar(64) DEFAULT '1' COMMENT '站点编号',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属机构',
  `module` varchar(20) DEFAULT NULL COMMENT '栏目模块',
  `name` varchar(100) NOT NULL COMMENT '栏目名称',
  `image` varchar(255) DEFAULT NULL COMMENT '栏目图片',
  `href` varchar(255) DEFAULT NULL COMMENT '链接',
  `target` varchar(20) DEFAULT NULL COMMENT '目标',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `sort` int(11) DEFAULT '30' COMMENT '排序（升序）',
  `in_menu` char(1) DEFAULT '1' COMMENT '是否在导航中显示',
  `in_list` char(1) DEFAULT '1' COMMENT '是否在分类页中显示列表',
  `show_modes` char(1) DEFAULT '0' COMMENT '展现方式',
  `allow_comment` char(1) DEFAULT NULL COMMENT '是否允许评论',
  `is_audit` char(1) DEFAULT NULL COMMENT '是否需要审核',
  `custom_list_view` varchar(255) DEFAULT NULL COMMENT '自定义列表视图',
  `custom_content_view` varchar(255) DEFAULT NULL COMMENT '自定义内容视图',
  `view_config` text COMMENT '视图配置',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_category_parent_id` (`parent_id`),
  KEY `cms_category_module` (`module`),
  KEY `cms_category_name` (`name`),
  KEY `cms_category_sort` (`sort`),
  KEY `cms_category_del_flag` (`del_flag`),
  KEY `cms_category_office_id` (`office_id`),
  KEY `cms_category_site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='栏目表';

/*Data for the table `cms_category` */

insert  into `cms_category`(`id`,`parent_id`,`parent_ids`,`site_id`,`office_id`,`module`,`name`,`image`,`href`,`target`,`description`,`keywords`,`sort`,`in_menu`,`in_list`,`show_modes`,`allow_comment`,`is_audit`,`custom_list_view`,`custom_content_view`,`view_config`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('1','0','0,','0','1',NULL,'顶级栏目',NULL,NULL,NULL,NULL,NULL,0,'1','1','0','0','1',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','1','0,1,','1','4','article','软件介绍',NULL,NULL,NULL,NULL,NULL,20,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('11','10','0,1,10,','1','4','article','网络工具',NULL,NULL,NULL,NULL,NULL,30,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('12','10','0,1,10,','1','4','article','浏览工具',NULL,NULL,NULL,NULL,NULL,40,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13','10','0,1,10,','1','4','article','浏览辅助',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('14','10','0,1,10,','1','4','article','网络优化',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('15','10','0,1,10,','1','4','article','邮件处理',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('16','10','0,1,10,','1','4','article','下载工具',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('17','10','0,1,10,','1','4','article','搜索工具',NULL,NULL,NULL,NULL,NULL,50,'1','1','2','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('18','1','0,1,','1','5','link','友情链接',NULL,NULL,NULL,NULL,NULL,90,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('19','18','0,1,18,','1','5','link','常用网站',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','1','0,1,','1','3','article','组织机构',NULL,NULL,NULL,NULL,NULL,10,'1','1','0','0','1',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('20','18','0,1,18,','1','5','link','门户网站',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('21','18','0,1,18,','1','5','link','购物网站',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('22','18','0,1,18,','1','5','link','交友社区',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('23','18','0,1,18,','1','5','link','音乐视频',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('24','1','0,1,','1','6',NULL,'百度一下',NULL,'http://www.baidu.com','_blank',NULL,NULL,90,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('25','1','0,1,','1','6',NULL,'全文检索',NULL,'/search',NULL,NULL,NULL,90,'0','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('26','1','0,1,','2','6','article','测试栏目',NULL,NULL,NULL,NULL,NULL,90,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('27','1','0,1,','1','6',NULL,'公共留言',NULL,'/guestbook',NULL,NULL,NULL,90,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','2','0,1,2,','1','3','article','网站简介',NULL,NULL,NULL,NULL,NULL,30,'1','1','0','0','1',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','2','0,1,2,','1','3','article','内部机构',NULL,NULL,NULL,NULL,NULL,40,'1','1','0','0','1',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5','2','0,1,2,','1','3','article','地方机构',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','0','1',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','1','0,1,','1','3','article','质量检验',NULL,NULL,NULL,NULL,NULL,20,'1','1','1','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('7','6','0,1,6,','1','3','article','产品质量',NULL,NULL,NULL,NULL,NULL,30,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('8','6','0,1,6,','1','3','article','技术质量',NULL,NULL,NULL,NULL,NULL,40,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('9','6','0,1,6,','1','3','article','工程质量',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `cms_comment` */

DROP TABLE IF EXISTS `cms_comment`;

CREATE TABLE `cms_comment` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `category_id` varchar(64) NOT NULL COMMENT '栏目编号',
  `content_id` varchar(64) NOT NULL COMMENT '栏目内容的编号',
  `title` varchar(255) DEFAULT NULL COMMENT '栏目内容的标题',
  `content` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `name` varchar(100) DEFAULT NULL COMMENT '评论姓名',
  `ip` varchar(100) DEFAULT NULL COMMENT '评论IP',
  `create_date` datetime NOT NULL COMMENT '评论时间',
  `audit_user_id` varchar(64) DEFAULT NULL COMMENT '审核人',
  `audit_date` datetime DEFAULT NULL COMMENT '审核时间',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_comment_category_id` (`category_id`),
  KEY `cms_comment_content_id` (`content_id`),
  KEY `cms_comment_status` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';

/*Data for the table `cms_comment` */

/*Table structure for table `cms_guestbook` */

DROP TABLE IF EXISTS `cms_guestbook`;

CREATE TABLE `cms_guestbook` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `type` char(1) NOT NULL COMMENT '留言分类',
  `content` varchar(255) NOT NULL COMMENT '留言内容',
  `name` varchar(100) NOT NULL COMMENT '姓名',
  `email` varchar(100) NOT NULL COMMENT '邮箱',
  `phone` varchar(100) NOT NULL COMMENT '电话',
  `workunit` varchar(100) NOT NULL COMMENT '单位',
  `ip` varchar(100) NOT NULL COMMENT 'IP',
  `create_date` datetime NOT NULL COMMENT '留言时间',
  `re_user_id` varchar(64) DEFAULT NULL COMMENT '回复人',
  `re_date` datetime DEFAULT NULL COMMENT '回复时间',
  `re_content` varchar(100) DEFAULT NULL COMMENT '回复内容',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_guestbook_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='留言板';

/*Data for the table `cms_guestbook` */

/*Table structure for table `cms_link` */

DROP TABLE IF EXISTS `cms_link`;

CREATE TABLE `cms_link` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `category_id` varchar(64) NOT NULL COMMENT '栏目编号',
  `title` varchar(255) NOT NULL COMMENT '链接名称',
  `color` varchar(50) DEFAULT NULL COMMENT '标题颜色',
  `image` varchar(255) DEFAULT NULL COMMENT '链接图片',
  `href` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `weight` int(11) DEFAULT '0' COMMENT '权重，越大越靠前',
  `weight_date` datetime DEFAULT NULL COMMENT '权重期限',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_link_category_id` (`category_id`),
  KEY `cms_link_title` (`title`),
  KEY `cms_link_del_flag` (`del_flag`),
  KEY `cms_link_weight` (`weight`),
  KEY `cms_link_create_by` (`create_by`),
  KEY `cms_link_update_date` (`update_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='友情链接';

/*Data for the table `cms_link` */

insert  into `cms_link`(`id`,`category_id`,`title`,`color`,`image`,`href`,`weight`,`weight_date`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('1','19','JeeSite',NULL,NULL,'http://thinkgem.github.com/jeesite',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','22','58同城',NULL,NULL,'http://www.58.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('11','23','视频大全',NULL,NULL,'http://v.360.cn/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('12','23','凤凰网',NULL,NULL,'http://www.ifeng.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','19','ThinkGem',NULL,NULL,'http://thinkgem.iteye.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','19','百度一下',NULL,NULL,'http://www.baidu.com',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','19','谷歌搜索',NULL,NULL,'http://www.google.com',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5','20','新浪网',NULL,NULL,'http://www.sina.com.cn',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','20','腾讯网',NULL,NULL,'http://www.qq.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('7','21','淘宝网',NULL,NULL,'http://www.taobao.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('8','21','新华网',NULL,NULL,'http://www.xinhuanet.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('9','22','赶集网',NULL,NULL,'http://www.ganji.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `cms_site` */

DROP TABLE IF EXISTS `cms_site`;

CREATE TABLE `cms_site` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(100) NOT NULL COMMENT '站点名称',
  `title` varchar(100) NOT NULL COMMENT '站点标题',
  `logo` varchar(255) DEFAULT NULL COMMENT '站点Logo',
  `domain` varchar(255) DEFAULT NULL COMMENT '站点域名',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `theme` varchar(255) DEFAULT 'default' COMMENT '主题',
  `copyright` text COMMENT '版权信息',
  `custom_index_view` varchar(255) DEFAULT NULL COMMENT '自定义站点首页视图',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_site_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站点表';

/*Data for the table `cms_site` */

insert  into `cms_site`(`id`,`name`,`title`,`logo`,`domain`,`description`,`keywords`,`theme`,`copyright`,`custom_index_view`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('1','默认站点','JeeSite Web',NULL,NULL,'JeeSite','JeeSite','basic','Copyright &copy; 2012-2013 <a href=\'http://thinkgem.iteye.com\' target=\'_blank\'>ThinkGem</a> - Powered By <a href=\'https://github.com/thinkgem/jeesite\' target=\'_blank\'>JeeSite</a> V1.0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','子站点测试','JeeSite Subsite',NULL,NULL,'JeeSite subsite','JeeSite subsite','basic','Copyright &copy; 2012-2013 <a href=\'http://thinkgem.iteye.com\' target=\'_blank\'>ThinkGem</a> - Powered By <a href=\'https://github.com/thinkgem/jeesite\' target=\'_blank\'>JeeSite</a> V1.0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `gen_scheme` */

DROP TABLE IF EXISTS `gen_scheme`;

CREATE TABLE `gen_scheme` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `category` varchar(2000) DEFAULT NULL COMMENT '分类',
  `package_name` varchar(500) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `sub_module_name` varchar(30) DEFAULT NULL COMMENT '生成子模块名',
  `function_name` varchar(500) DEFAULT NULL COMMENT '生成功能名',
  `function_name_simple` varchar(100) DEFAULT NULL COMMENT '生成功能名（简写）',
  `function_author` varchar(100) DEFAULT NULL COMMENT '生成功能作者',
  `gen_table_id` varchar(200) DEFAULT NULL COMMENT '生成表编号',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  `can_xls_export` char(1) DEFAULT '0' COMMENT '是否支持Excel导出',
  `can_xls_import` char(1) DEFAULT '0' COMMENT '是否支持Excel导入',
  `form_print` char(1) DEFAULT '0' COMMENT '是否支持表单打印',
  PRIMARY KEY (`id`),
  KEY `gen_scheme_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='生成方案';

/*Data for the table `gen_scheme` */

insert  into `gen_scheme`(`id`,`name`,`category`,`package_name`,`module_name`,`sub_module_name`,`function_name`,`function_name_simple`,`function_author`,`gen_table_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`,`can_xls_export`,`can_xls_import`,`form_print`) values ('02b85ca04ab54572bafb48be0e93b74b','体检中心','curd','com.thinkgem.jeesite.modules','wshbj','','体检中心','体检中心','zhxl','5e8fb141d8f04235996da148395083ed','1','2018-03-06 14:16:17','1','2018-03-06 14:16:17','','1','0','0','0'),('06cea655c7dc4312bbcae7d5bf3dc119','检查小类','curd','com.thinkgem.jeesite.modules','wshbj','','检查小类','检查小类','zhxl','6c9094e7e22b4aadb26da86e9b8cbaa3','1','2018-03-07 16:29:28','1','2018-03-07 16:29:28','','0','0','0','0'),('07ca5544e38f419eb25950e537a47023','测试1方案','curd','com.thinkgem.jeesite.modules','test1','','测试1 描述','测试1','崔鹏宇','0f64808413ec40b4890b094920d9ed3c','1','2018-03-05 13:04:24','1','2018-03-05 14:15:06','','0','0','0','0'),('108cde6cf4284d21b36685022eb82467','Test1表生成','curd','com.thinkgem.jeesite.modules','test1','','测试一下从test1表生成类','测试1','崔鹏宇','5ccbcfb5e27348c4826ed976bbd1cc56','1','2018-03-03 00:32:46','1','2018-03-03 00:46:08','','1','0','0','0'),('1a9e026a6152438c80b24eeb040cd630','检查大类','curd','com.thinkgem.jeesite.modules','wshbj','','检查大类','检查大类','zhxl','fb90f165141648fe89fb2774ad2afbad','1','2018-03-07 16:27:55','1','2018-03-07 16:27:55','','0','0','0','0'),('1ac77aab612944ba9aeb6ded35f6ba3f','体检结果字典','curd','com.thinkgem.jeesite.modules','wshbj','','体检结果字典','体检结果字典','zhxl','38ca93fc0d8f4fa08d622c0ecdeefa6d','1','2018-03-07 16:32:03','1','2018-03-12 10:31:13','','0','0','0','0'),('20d5319d345245a0b6eba6568a10ade0','序列号生成','curd','com.thinkgem.jeesite.modules','wshbj','','序列号生成','序列号生成','zhxl','a98828fcd5844036b3bd6203a5c2a15d','1','2018-03-19 18:48:38','1','2018-03-19 18:48:38','','0','0','0','0'),('25fb299e12bf4d759552013251ec9017','样本编号包','curd','com.thinkgem.jeesite.modules','wshbj','','样本编号包','样本编号包','cuipengyu','0c1a5cd70b104852b79102cb62270f52','1','2018-04-20 17:00:48','1','2018-04-20 17:00:48','','0','0','0','0'),('35a13dc260284a728a270db3f382664b','树结构','treeTable','com.thinkgem.jeesite.modules','test',NULL,'树结构生成','树结构','ThinkGem','f6e4dafaa72f4c509636484715f33a96','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0','0'),('413f0d40bf5f400dbc0f6dfc95174801','检查项目类型','curd','com.thinkgem.jeesite.modules','wshbj','','检查项目类型','检查项目类型','zhxl','778b701a91b64ea5b35c17fd63948436','1','2018-03-07 16:29:55','1','2018-03-07 16:29:55','','0','0','0','0'),('419d250b09124478806a667f8af9835a','工作岗位','curd','com.thinkgem.jeesite.modules','wshbj','','工作岗位','工作岗位管理','zhxl','0ef5b1fbbf594e32ac90c2524935eb15','1','2018-03-06 13:47:14','1','2018-03-11 13:43:19','','0','0','0','0'),('4c7222ae306c4a3dadc3a015903ae98f','体检记录','curd_many','com.thinkgem.jeesite.modules','wshbj','','体检记录','体检记录','zhxl','263df3b73ec844e89e6ce388e2ede14b','1','2018-03-07 16:31:36','1','2018-03-17 12:03:45','','0','1','0','0'),('554eefaf19e744a491ebb79d973b9f41','检查项目','curd','com.thinkgem.jeesite.modules','wshbj','','检查项目','检查项目','zhxl','38e44531dea149a0a70219a175eb65cb','1','2018-03-07 16:29:03','1','2018-03-07 16:29:03','','0','0','0','0'),('5f60920d6bdd4cae8bd40ab15e0ae0bc','体检单位','curd','com.thinkgem.jeesite.modules','wshbj','','体检单位','体检单位','zhxl','7003dd8eb3554a0ab99771fdd1464c74','1','2018-03-07 16:01:51','1','2018-03-12 12:24:21','','0','0','0','0'),('6255e493563f441bbef216a19361023a','样本编号库','curd','com.thinkgem.jeesite.modules','wshbj','','样本编号库','样本编号库','cuipengyu','7ea5e9edfc8f4eb293b9f7d54d19f4f3','1','2018-04-20 17:03:49','1','2018-04-20 17:04:30','','0','0','0','0'),('75d1513e04654777aabaace09de46a4e','体检流程表模板','curd','com.thinkgem.jeesite.modules','sys','','体检流程表模板','体检流程表模板','zhxl','85e80c76deba4aeb93da7b186077c44a','1','2018-03-14 12:59:42','1','2018-04-18 11:40:59','','0','0','0','1'),('9c9de9db6da743bb899036c6546061ac','单表','curd','com.thinkgem.jeesite.modules','test',NULL,'单表生成','单表','ThinkGem','aef6f1fc948f4c9ab1c1b780bc471cc2','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0','0'),('9f918300db7344279356b5283c857e22','行业管理','curd','com.thinkgem.jeesite.modules','wshbj','','行业基础数据管理','行业管理','zhxl','b9dcbd6f07b34b09a7de65921518d6a1','1','2018-03-06 12:47:39','1','2018-03-11 13:43:04','','0','0','0','0'),('a791f1d0da8141679599294ab65bdb7e','体检用户','curd','com.thinkgem.jeesite.modules','wshbj','','体检用户','体检用户','zhxl','1fc82bd23cb64af4bc5f5874b9148aa3','1','2018-03-07 16:32:28','1','2018-03-07 16:32:28','','0','0','0','0'),('b156432b63d44be5a28f99b449191be5','全局参数配置','curd','com.thinkgem.jeesite.modules','sys','','全局参数配置','全局参数配置','cuipengyu','7313b302ac694a0f9639efaa0ad188d1','1','2018-04-18 11:33:47','1','2018-04-18 11:43:16','','0','0','0','1'),('b45d2fb40b804418bc9e7efea2e11651','检查部门','curd','com.thinkgem.jeesite.modules','wshbj','','检查部门','检查部门','zhxl','74db589fc1e74881be178df82449d5ee','1','2018-03-07 16:28:28','1','2018-03-07 16:28:28','','0','0','0','0'),('c32ec055a91549a09709ec339bcd3de4','检查标本类型','curd','com.thinkgem.jeesite.modules','wshbj','','检查标本类型','检查标本类型','zhxl','3a4d8288c1ff4277b4beaed0ddad3301','1','2018-03-07 15:58:01','1','2018-03-07 16:01:14','','0','0','0','0'),('e4dd89f13bc1440bac103ade400b5244','体检套餐','curd_many','com.thinkgem.jeesite.modules','wshbj','','体检套餐','体检套餐','zhxl','67146f87f0b847a5a855efe4e9077e40','1','2018-03-07 16:31:00','1','2018-03-12 16:37:12','','0','0','0','0'),('e6d905fd236b46d1af581dd32bdfb3b0','主子表','curd_many','com.thinkgem.jeesite.modules','test',NULL,'主子表生成','主子表','ThinkGem','43d6d5acffa14c258340ce6765e46c6f','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0','0'),('fa032188dbb747768e485a27a37c7824','制卡记录','curd','com.thinkgem.jeesite.modules','wshbj','','制卡记录','制卡记录','zhxl','165367ce1a75430da8729b0561adce25','1','2018-03-25 16:01:37','1','2018-03-25 17:51:57','','0','0','0','0');

/*Table structure for table `gen_seq_number` */

DROP TABLE IF EXISTS `gen_seq_number`;

CREATE TABLE `gen_seq_number` (
  `noid` char(32) NOT NULL,
  `key_code` varchar(32) NOT NULL,
  `curr_val` int(11) NOT NULL DEFAULT '1' COMMENT '当前值，取一个，增加一个',
  PRIMARY KEY (`noid`),
  UNIQUE KEY `noid_UNIQUE` (`noid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='序列号';

/*Data for the table `gen_seq_number` */

insert  into `gen_seq_number`(`noid`,`key_code`,`curr_val`) values ('043fafb22b4a11e896a7d7a8c4dd088c','a',2),('4af1cb8c2b4c11e896a7d7a8c4dd088c','null1803',5),('fb80ae162b4f11e896a7d7a8c4dd088c','0020011803',1),('899ca39e2b5011e896a7d7a8c4dd088c','0020011',1),('d0ddc0c62b5011e896a7d7a8c4dd088c','00200118',353),('93af872a2b5511e896a7d7a8c4dd088c','10000018',111),('f5dad3222b8811e896a7d7a8c4dd088c','002001ITEM_',14),('8b75fc202b8b11e896a7d7a8c4dd088c','111',1),('1a898485411f11e88548000c29b69695','00218',35),('68703c77412311e88548000c29b69695','002ITEM_',2);

/*Table structure for table `gen_table` */

DROP TABLE IF EXISTS `gen_table`;

CREATE TABLE `gen_table` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) DEFAULT NULL COMMENT '描述',
  `class_name` varchar(100) DEFAULT NULL COMMENT '实体类名称',
  `parent_table` varchar(200) DEFAULT NULL COMMENT '关联父表',
  `parent_table_fk` varchar(100) DEFAULT NULL COMMENT '关联父表外键',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_table_name` (`name`),
  KEY `gen_table_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务表';

/*Data for the table `gen_table` */

insert  into `gen_table`(`id`,`name`,`comments`,`class_name`,`parent_table`,`parent_table_fk`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('0c1a5cd70b104852b79102cb62270f52','bj_sample_codes_pack','样本编号包','SampleCodesPack','','','1','2018-04-20 16:58:56','1','2018-04-20 16:58:56','','0'),('0ef5b1fbbf594e32ac90c2524935eb15','bj_job_post','工作岗位','JobPost','','','1','2018-03-06 13:46:01','1','2018-03-11 13:42:45','','0'),('0f64808413ec40b4890b094920d9ed3c','test1','测试表1','Test1','','','1','2018-03-05 13:03:35','1','2018-03-05 14:14:51','','0'),('165367ce1a75430da8729b0561adce25','bj_cert_record','制卡记录','CertRecord','','','1','2018-03-25 16:00:45','1','2018-03-25 16:13:40','','0'),('1fc82bd23cb64af4bc5f5874b9148aa3','bj_examination_user','体检用户','ExaminationUser','','','1','2018-03-07 16:24:52','1','2018-03-07 16:24:52','','0'),('263df3b73ec844e89e6ce388e2ede14b','bj_examination_record','体检记录','ExaminationRecord','','','1','2018-03-07 16:26:02','1','2018-03-17 12:03:35','','0'),('38ca93fc0d8f4fa08d622c0ecdeefa6d','bj_examination_result_dict','体检结果字典','ExaminationResultDict','','','1','2018-03-07 16:23:20','1','2018-03-12 10:30:56','','0'),('38e44531dea149a0a70219a175eb65cb','bj_examination_item','检查项目','ExaminationItem','','','1','2018-03-07 16:18:04','1','2018-03-07 16:18:04','','0'),('3a4d8288c1ff4277b4beaed0ddad3301','bj_specimen','检查标本类型','Specimen','','','1','2018-03-07 15:57:22','1','2018-03-07 15:59:38','','0'),('43d6d5acffa14c258340ce6765e46c6f','test_data_main','业务数据表','TestDataMain',NULL,NULL,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('4beae09010714fba860989f8d26cf1d0','bj_package_item','套餐包含检查项目','PackageItem','bj_examination_package','package_id','1','2018-03-12 15:09:25','1','2018-03-12 16:36:54','','0'),('5ccbcfb5e27348c4826ed976bbd1cc56','test1','测试表1','Test1','','','1','2018-03-03 00:29:13','1','2018-03-03 00:29:13','','1'),('5e8fb141d8f04235996da148395083ed','bj_m_e_center','体检中心','MECenter','','','1','2018-03-06 14:15:33','1','2018-03-06 14:15:33','','1'),('67146f87f0b847a5a855efe4e9077e40','bj_examination_package','体检套餐','ExaminationPackage','','','1','2018-03-07 16:20:28','1','2018-03-07 16:20:28','','0'),('6c9094e7e22b4aadb26da86e9b8cbaa3','bj_examination_item_category','检查小类','ExaminationItemCategory','','','1','2018-03-07 16:11:09','1','2018-03-07 16:11:09','','0'),('6e05c389f3c6415ea34e55e9dfb28934','test_data_child','业务数据子表','TestDataChild','test_data_main','test_data_main_id','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('7003dd8eb3554a0ab99771fdd1464c74','bj_organ','体检单位','Organ','','','1','2018-03-07 15:59:22','1','2018-03-12 12:24:06','','0'),('7313b302ac694a0f9639efaa0ad188d1','bj_global_set','体检项目全局参数配置','GlobalSet','','','1','2018-04-18 11:31:06','1','2018-04-18 11:31:06','','0'),('74db589fc1e74881be178df82449d5ee','bj_examination_dept','检查部门','ExaminationDept','','','1','2018-03-07 16:03:58','1','2018-03-07 16:03:58','','0'),('778b701a91b64ea5b35c17fd63948436','bj_examination_item_type','检查项目类型','ExaminationItemType','','','1','2018-03-07 16:15:19','1','2018-03-07 16:15:19','','0'),('7ea5e9edfc8f4eb293b9f7d54d19f4f3','bj_sample_codes','样本编号库','SampleCodes','','','1','2018-04-20 17:02:28','1','2018-04-20 17:02:28','','0'),('85e80c76deba4aeb93da7b186077c44a','bj_examination_form','体检流程表模板','ExaminationForm','','','1','2018-03-14 12:07:44','1','2018-03-14 12:07:44','','0'),('8cc24412bbc4414a9ab589e7877028f9','bj_examination_result_dict','体检套餐','ExaminationResultDict','','','1','2018-03-07 16:19:25','1','2018-03-07 16:19:25','','1'),('a98828fcd5844036b3bd6203a5c2a15d','gen_seq_number','序列号','GenSeqNumber','','','1','2018-03-19 18:47:50','1','2018-03-19 18:47:50','','0'),('aef6f1fc948f4c9ab1c1b780bc471cc2','test_data','业务数据表','TestData',NULL,NULL,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('b9dcbd6f07b34b09a7de65921518d6a1','bj_industry','行业数据','Industry','','','1','2018-03-06 13:14:05','1','2018-03-11 13:42:28','','0'),('c657d573d06d48fd9e7c68bf8254674b','bj_examination_record_item','检查记录项目','ExaminationRecordItem','bj_examination_record','record_id','1','2018-03-17 11:16:33','1','2018-03-17 11:16:33','','0'),('de5493dc511c454a823c223814ad2ec3','bj_industry','行业数据','Industry','','','1','2018-03-06 12:45:42','1','2018-03-06 12:45:42','','1'),('f6e4dafaa72f4c509636484715f33a96','test_tree','树结构表','TestTree',NULL,NULL,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('fb90f165141648fe89fb2774ad2afbad','bj_examination_category','检查大类','ExaminationCategory','','','1','2018-03-07 16:09:00','1','2018-03-07 16:09:00','','0');

/*Table structure for table `gen_table_column` */

DROP TABLE IF EXISTS `gen_table_column`;

CREATE TABLE `gen_table_column` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `gen_table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) DEFAULT NULL COMMENT '描述',
  `jdbc_type` varchar(100) DEFAULT NULL COMMENT '列的数据类型的字节长度',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键',
  `is_null` char(1) DEFAULT NULL COMMENT '是否可为空',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段',
  `query_type` varchar(200) DEFAULT NULL COMMENT '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）',
  `show_type` varchar(200) DEFAULT NULL COMMENT '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）',
  `dict_type` varchar(200) DEFAULT NULL COMMENT '字典类型',
  `settings` varchar(2000) DEFAULT NULL COMMENT '其它设置（扩展字段JSON）',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序（升序）',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  `is_invent` char(1) DEFAULT '0' COMMENT '是否虚字段',
  `is_unique` varchar(45) DEFAULT '0' COMMENT '是否唯一字段',
  `tree_url` varchar(64) DEFAULT NULL COMMENT '外键读取tree地址',
  PRIMARY KEY (`id`),
  KEY `gen_table_column_table_id` (`gen_table_id`),
  KEY `gen_table_column_name` (`name`),
  KEY `gen_table_column_sort` (`sort`),
  KEY `gen_table_column_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务表字段';

/*Data for the table `gen_table_column` */

insert  into `gen_table_column`(`id`,`gen_table_id`,`name`,`comments`,`jdbc_type`,`java_type`,`java_field`,`is_pk`,`is_null`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`show_type`,`dict_type`,`settings`,`sort`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`,`is_invent`,`is_unique`,`tree_url`) values ('0087c897058e4ebd8d59719b1d93a2eb','263df3b73ec844e89e6ce388e2ede14b','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'120','1','2018-03-07 16:26:03','1','2018-03-17 12:03:35',NULL,'0','0','0',NULL),('00c7839e82b74b7490e2978b99773c44','c657d573d06d48fd9e7c68bf8254674b','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-17 11:16:33','1','2018-03-17 11:16:33',NULL,'0','0','0',NULL),('014c859545074713bee8f01662a5d9d4','de5493dc511c454a823c223814ad2ec3','update_by','update_by','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'70','1','2018-03-06 12:45:42','1','2018-03-06 12:45:42',NULL,'1','0','0',NULL),('0490b9527f274deba7cd43f08dbaf3ae','778b701a91b64ea5b35c17fd63948436','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,'80','1','2018-03-07 16:15:20','1','2018-03-07 16:15:20',NULL,'0','0','0',NULL),('06998543e0ec4b44ac4c5a54ab7166cb','38e44531dea149a0a70219a175eb65cb','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'70','1','2018-03-07 16:18:04','1','2018-03-07 16:18:04',NULL,'0','0','0',NULL),('071863f566514bd4af489f4a4a0d2d51','67146f87f0b847a5a855efe4e9077e40','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'50','1','2018-03-07 16:20:28','1','2018-03-07 16:20:28',NULL,'0','0','0',NULL),('073b6a2dd1914527b5282e539c6bf237','1fc82bd23cb64af4bc5f5874b9148aa3','birthday','出生日期','varchar(10)','String','birthday','0','0','1','1','0','0','=','input','',NULL,'80','1','2018-03-07 16:24:52','1','2018-03-07 16:24:52',NULL,'0','0','0',NULL),('0792d13c4cf940019ec3b12721ff14d4','5e8fb141d8f04235996da148395083ed','status','状态','varchar(4)','String','status','0','0','1','1','0','1','=','input','',NULL,'90','1','2018-03-06 14:15:33','1','2018-03-06 14:15:33',NULL,'1','0','0',NULL),('07b1a683773046a7a8e902db9ca634b9','74db589fc1e74881be178df82449d5ee','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,'70','1','2018-03-07 16:03:59','1','2018-03-07 16:03:59',NULL,'0','0','0',NULL),('0847f2d08e93405190c0e67cc4fc1c70','5ccbcfb5e27348c4826ed976bbd1cc56','remarks','备注信息','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'90','1','2018-03-03 00:29:13','1','2018-03-03 00:29:13',NULL,'1','0','0',NULL),('08adfd2eeae84bb180ffa00bc6b8c0c9','7ea5e9edfc8f4eb293b9f7d54d19f4f3','specimen_id','样本类型ID','varchar(128)','String','specimenId','0','0','1','1','0','0','=','input','',NULL,'20','1','2018-04-20 17:02:28','1','2018-04-20 17:02:28',NULL,'0','0','0',NULL),('0902a0cb3e8f434280c20e9d771d0658','aef6f1fc948f4c9ab1c1b780bc471cc2','sex','性别','char(1)','String','sex','0','1','1','1','1','1','=','radiobox','sex',NULL,'6','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('09446ee775a64c3e83dc95a63f5a7b8f','c657d573d06d48fd9e7c68bf8254674b','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'80','1','2018-03-17 11:16:34','1','2018-03-17 11:16:34',NULL,'0','0','0',NULL),('0acce1589f8f4c0099b60970266dc196','263df3b73ec844e89e6ce388e2ede14b','package_id','体检套餐','varchar(64)','String','packageId','0','1','1','1','1','1','=','select','',NULL,'180','1','2018-03-07 16:26:03','1','2018-03-17 12:03:35',NULL,'0','0','0',NULL),('0b61d58ec21e4a198788f48fcda1501f','8cc24412bbc4414a9ab589e7877028f9','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'80','1','2018-03-07 16:19:26','1','2018-03-07 16:19:26',NULL,'1','0','0',NULL),('0bc03a3d513a4ff4b05f069a0e3c1196','165367ce1a75430da8729b0561adce25','user_name','姓名','varchar(50)','String','userName','0','0','1','1','1','1','=','input','',NULL,'60','1','2018-03-25 16:00:45','1','2018-03-25 16:13:40',NULL,'0','0','0',NULL),('0bd4debdba454a999f169443dda7df9b','85e80c76deba4aeb93da7b186077c44a','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-14 12:07:44','1','2018-03-14 12:07:44',NULL,'0','0','0',NULL),('0cc30e4e310048e38c70dedbda5b14e1','de5493dc511c454a823c223814ad2ec3','update_date','update_date','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,'80','1','2018-03-06 12:45:42','1','2018-03-06 12:45:42',NULL,'1','0','0',NULL),('0d8f0ff9c60b485a8b8a58651ebcc522','8cc24412bbc4414a9ab589e7877028f9','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-07 16:19:25','1','2018-03-07 16:19:25',NULL,'1','0','0',NULL),('0d94b8a26a124364aeaf8592589a9f35','38e44531dea149a0a70219a175eb65cb','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'60','1','2018-03-07 16:18:04','1','2018-03-07 16:18:04',NULL,'0','0','0',NULL),('0e44fb394ace45fb8040ae08ece9fd5b','de5493dc511c454a823c223814ad2ec3','del_flag','del_flag','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'40','1','2018-03-06 12:45:42','1','2018-03-06 12:45:42',NULL,'1','0','0',NULL),('0fc5c73d9ce74e85aad72a49c33af28d','1fc82bd23cb64af4bc5f5874b9148aa3','code','编号','varchar(50)','String','code','0','0','1','1','1','1','=','input','',NULL,'20','1','2018-03-07 16:24:52','1','2018-03-07 16:24:52',NULL,'0','0','0',NULL),('102b3e19b44647509eb95138c3c6b395','0ef5b1fbbf594e32ac90c2524935eb15','reference_flag','参考标识：0-否，1-是','char(1)','String','referenceFlag','0','1','1','1','0','0','=','input','',NULL,'100','1','2018-03-11 13:42:46','1','2018-03-11 13:42:46',NULL,'0','0','0',NULL),('103fc05c88ff40639875c2111881996a','aef6f1fc948f4c9ab1c1b780bc471cc2','create_date','创建时间','timestamp(6)','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect',NULL,NULL,'9','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('10d8903566ff441aae6a62bdbc78114c','0f64808413ec40b4890b094920d9ed3c','id','编号','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-05 13:03:35','1','2018-03-05 14:14:52',NULL,'0','0','0',NULL),('129f60a2b32349c3ac9cbdd6a40a923b','165367ce1a75430da8729b0561adce25','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','0','0','0','=','input','',NULL,'100','1','2018-03-25 16:00:45','1','2018-03-25 16:13:40',NULL,'0','0','0',NULL),('12fa38dd986e41908f7fefa5839d1220','6e05c389f3c6415ea34e55e9dfb28934','create_by','创建者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input',NULL,NULL,'4','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('1375e859a25441c581aaf3d765dea208','c657d573d06d48fd9e7c68bf8254674b','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'90','1','2018-03-17 11:16:34','1','2018-03-17 11:16:34',NULL,'0','0','0',NULL),('141a243c131c4bbabd22011d92915f11','6c9094e7e22b4aadb26da86e9b8cbaa3','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-07 16:11:10','1','2018-03-07 16:11:10',NULL,'0','0','0',NULL),('1475c91f59774e0fab1fabf621af17b4','0c1a5cd70b104852b79102cb62270f52','id','编号','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-04-20 16:58:56','1','2018-04-20 16:58:56',NULL,'0','0','0',NULL),('14a359dfaf1f4f369d01facb3d11e286','38ca93fc0d8f4fa08d622c0ecdeefa6d','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'70','1','2018-03-07 16:23:20','1','2018-03-12 10:30:56',NULL,'0','0','0',NULL),('14b86396b282419a9ac53e328c4066e1','38e44531dea149a0a70219a175eb65cb','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-07 16:18:04','1','2018-03-07 16:18:04',NULL,'0','0','0',NULL),('14dfce94c5d84851af5477232858454e','5e8fb141d8f04235996da148395083ed','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'70','1','2018-03-06 14:15:33','1','2018-03-06 14:15:33',NULL,'1','0','0',NULL),('1881315dd90c4bb4aa7b1afea9071f43','263df3b73ec844e89e6ce388e2ede14b','post_id','岗位','varchar(64)','String','postId','0','0','1','1','0','0','=','select','',NULL,'80','1','2018-03-07 16:26:02','1','2018-03-17 12:03:35',NULL,'0','0','0',NULL),('195ee9241f954d008fe01625f4adbfef','f6e4dafaa72f4c509636484715f33a96','create_by','创建者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input',NULL,NULL,'6','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('19c6478b8ff54c60910c2e4fc3d27503','43d6d5acffa14c258340ce6765e46c6f','id','编号','varchar2(64)','String','id','1','0','1','0','0','0','=','input',NULL,NULL,'1','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('1a42d948003d4bbe98d8ad529161bb69','263df3b73ec844e89e6ce388e2ede14b','phone_number','联系电话','varchar(45)','String','phoneNumber','0','0','1','1','1','1','=','input','',NULL,'50','1','2018-03-07 16:26:02','1','2018-03-17 12:03:35',NULL,'0','0','0',NULL),('1a637a9d834640c48b5f4fdaa7bd3889','778b701a91b64ea5b35c17fd63948436','reference_flag','参考标识：0-否，1-是','char(1)','String','referenceFlag','0','0','1','1','0','0','=','input','',NULL,'100','1','2018-03-07 16:15:20','1','2018-03-07 16:15:20',NULL,'0','0','0',NULL),('1ac6562f753d4e599693840651ab2bf7','43d6d5acffa14c258340ce6765e46c6f','in_date','加入日期','date(7)','java.util.Date','inDate','0','1','1','1','0','0','=','dateselect',NULL,NULL,'7','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('1b8eb55f65284fa6b0a5879b6d8ad3ec','aef6f1fc948f4c9ab1c1b780bc471cc2','in_date','加入日期','date(7)','java.util.Date','inDate','0','1','1','1','0','1','between','dateselect',NULL,NULL,'7','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('1bea0e125bc346e08c49f551df878d7b','5e8fb141d8f04235996da148395083ed','linkman','联系人','varchar(45)','String','linkman','0','1','1','1','0','0','like','input','',NULL,'110','1','2018-03-06 14:15:33','1','2018-03-06 14:15:33',NULL,'1','0','0',NULL),('1d5ca4d114be41e99f8dc42a682ba609','aef6f1fc948f4c9ab1c1b780bc471cc2','user_id','归属用户','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','user.id|name','0','1','1','1','1','1','=','userselect',NULL,NULL,'2','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('1d640a60844147849f4a7a8b672ab753','0ef5b1fbbf594e32ac90c2524935eb15','owner','所属体检中心','varchar(64)','String','owner','0','1','1','1','0','0','=','input','',NULL,'110','1','2018-03-11 13:42:46','1','2018-03-11 13:42:46',NULL,'0','0','0',NULL),('1ed6153102f14b67b06db613a9c020ec','a98828fcd5844036b3bd6203a5c2a15d','key_code','key_code','varchar(32)','String','keyCode','0','0','1','1','0','0','=','input','',NULL,'20','1','2018-03-19 18:47:50','1','2018-03-19 18:47:50',NULL,'0','0','0',NULL),('1f5beb64c0b645c49770aca4d6e4430d','263df3b73ec844e89e6ce388e2ede14b','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'130','1','2018-03-07 16:26:03','1','2018-03-17 12:03:35',NULL,'0','0','0',NULL),('1f6d0fb1fdfe47cdb778d6af414d9108','0f64808413ec40b4890b094920d9ed3c','auth_id','作者id','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','auth.id|name','0','0','1','1','0','1','=','userselect','',NULL,'40','1','2018-03-05 13:03:35','1','2018-03-05 14:14:52',NULL,'0','0','0',NULL),('207fcca5393b4fa2a5c6d72cdf5405f5','38e44531dea149a0a70219a175eb65cb','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'40','1','2018-03-07 16:18:04','1','2018-03-07 16:18:04',NULL,'0','0','0',NULL),('20f4ff043bf24893b2c36c1611c77b64','0ef5b1fbbf594e32ac90c2524935eb15','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'40','1','2018-03-06 13:46:01','1','2018-03-11 13:42:45',NULL,'0','0','0',NULL),('212c4bcb1d7a41469094d64a3a796847','778b701a91b64ea5b35c17fd63948436','name','名称','varchar(50)','String','name','0','0','1','1','1','1','like','input','',NULL,'30','1','2018-03-07 16:15:19','1','2018-03-07 16:15:19',NULL,'0','0','0',NULL),('21756504ffdc487eb167a823f89c0c06','43d6d5acffa14c258340ce6765e46c6f','update_by','更新者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input',NULL,NULL,'10','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('21b2d13671a84f6aaa65932fcd26aaf8','38e44531dea149a0a70219a175eb65cb','code','编号','varchar(45)','String','code','0','0','1','1','1','1','=','input','',NULL,'20','1','2018-03-07 16:18:04','1','2018-03-07 16:18:04',NULL,'0','0','0',NULL),('21de0290a69741b9bb5c6106198afdac','3a4d8288c1ff4277b4beaed0ddad3301','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'70','1','2018-03-07 15:57:22','1','2018-03-07 15:59:38',NULL,'0','0','0',NULL),('221f969628834fc0a166be5837b1241e','de5493dc511c454a823c223814ad2ec3','create_date','create_date','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'60','1','2018-03-06 12:45:42','1','2018-03-06 12:45:42',NULL,'1','0','0',NULL),('2448c2b49fb943d4a78b91e99f2f60ed','67146f87f0b847a5a855efe4e9077e40','reference_flag','参考标识：0-否，1-是','char(1)','String','referenceFlag','0','1','1','1','0','0','=','input','',NULL,'110','1','2018-03-07 16:20:29','1','2018-03-07 16:20:29',NULL,'0','0','0',NULL),('24bbdc0a555e4412a106ab1c5f03008e','f6e4dafaa72f4c509636484715f33a96','parent_ids','所有父级编号','varchar2(2000)','String','parentIds','0','0','1','1','0','0','like','input',NULL,NULL,'3','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('25789828621845a688a5cecfd1240191','165367ce1a75430da8729b0561adce25','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','0','0','0','=','dateselect','',NULL,'110','1','2018-03-25 16:00:45','1','2018-03-25 16:13:40',NULL,'0','0','0',NULL),('257ce6318f5a4df2b38efbc232add58e','5e8fb141d8f04235996da148395083ed','phone_number','联系电话','varchar(45)','String','phoneNumber','0','1','1','1','0','1','=','input','',NULL,'120','1','2018-03-06 14:15:34','1','2018-03-06 14:15:34',NULL,'1','0','0',NULL),('259bedcec63f4d6ba8abab61920c1165','7ea5e9edfc8f4eb293b9f7d54d19f4f3','auth_id','auth_id','varchar(64)','String','authId','0','0','1','1','0','0','=','input','',NULL,'70','1','2018-04-20 17:02:29','1','2018-04-20 17:02:29',NULL,'0','0','0',NULL),('2662bb122ebb42f1b3d0ca3fded53fb5','fb90f165141648fe89fb2774ad2afbad','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'70','1','2018-03-07 16:09:01','1','2018-03-07 16:09:01',NULL,'0','0','0',NULL),('26702fd35e7749caaadf880273856c12','165367ce1a75430da8729b0561adce25','code','卡号','varchar(50)','String','code','0','1','1','1','1','1','=','input','',NULL,'20','1','2018-03-25 16:00:45','1','2018-03-25 16:13:40',NULL,'0','0','0',NULL),('268a5026fe6c4bab8ea3e21b2fe5e07c','6c9094e7e22b4aadb26da86e9b8cbaa3','code','编号','varchar(45)','String','code','0','0','1','1','1','1','=','input','',NULL,'20','1','2018-03-07 16:11:10','1','2018-03-07 16:11:10',NULL,'0','0','0',NULL),('270b689e79f345e98b59b3c185c4aba0','778b701a91b64ea5b35c17fd63948436','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'40','1','2018-03-07 16:15:20','1','2018-03-07 16:15:20',NULL,'0','0','0',NULL),('27691c351b1c4f69bbcce922828e634a','165367ce1a75430da8729b0561adce25','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'80','1','2018-03-25 16:00:45','1','2018-03-25 16:13:40',NULL,'0','0','0',NULL),('288f9e5e9d0147ba9c34fd1e93f00574','165367ce1a75430da8729b0561adce25','examination_code','体检编号','varchar(50)','String','examinationCode','0','0','1','1','1','1','=','input','',NULL,'30','1','2018-03-25 16:00:45','1','2018-03-25 16:13:40',NULL,'0','0','0',NULL),('28b66c808a7f4b2081350be686834c85','b9dcbd6f07b34b09a7de65921518d6a1','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','0','0','=','dateselect','',NULL,'80','1','2018-03-06 13:14:06','1','2018-03-11 13:42:28',NULL,'0','0','0',NULL),('2a26e00a841a4f35b0cbc35e1ad38d03','0f64808413ec40b4890b094920d9ed3c','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'110','1','2018-03-05 13:03:35','1','2018-03-05 14:14:52',NULL,'0','0','0',NULL),('2ac394219be2486e911c5962b79c83cf','fb90f165141648fe89fb2774ad2afbad','code','编号','varchar(45)','String','code','0','0','1','1','1','1','=','input','',NULL,'20','1','2018-03-07 16:09:00','1','2018-03-07 16:09:00',NULL,'0','0','0',NULL),('2d061ef89c4d40b7bdaec788a6679207','38e44531dea149a0a70219a175eb65cb','reference_flag','参考标识：0-否，1-是','char(1)','String','referenceFlag','0','0','1','1','0','0','=','input','',NULL,'100','1','2018-03-07 16:18:05','1','2018-03-07 16:18:05',NULL,'0','0','0',NULL),('2d5382b8d1b2428abea57056c234dd4a','85e80c76deba4aeb93da7b186077c44a','owner','所属体检中心','varchar(64)','String','owner','0','1','1','1','0','0','=','input','',NULL,'110','1','2018-03-14 12:07:44','1','2018-03-14 12:07:44',NULL,'0','0','0',NULL),('2d90964356834f93914a81afcd2e4061','38ca93fc0d8f4fa08d622c0ecdeefa6d','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,'90','1','2018-03-07 16:23:20','1','2018-03-12 10:30:56',NULL,'0','0','0',NULL),('2d9df670af494b6ab74eaf75a94daf46','6c9094e7e22b4aadb26da86e9b8cbaa3','remarks','备注','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'90','1','2018-03-07 16:11:10','1','2018-03-07 16:11:10',NULL,'0','0','0',NULL),('2dc2fb84be5a465bb53a2972b10f0110','7003dd8eb3554a0ab99771fdd1464c74','reference_flag','参考标识：0-否，1-是','char(1)','String','referenceFlag','0','1','1','1','0','0','=','input','',NULL,'90','1','2018-03-12 12:24:07','1','2018-03-12 12:24:07',NULL,'0','0','0',NULL),('2e11469a981844f4ba0c517a1ee45b33','85e80c76deba4aeb93da7b186077c44a','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'60','1','2018-03-14 12:07:44','1','2018-03-14 12:07:44',NULL,'0','0','0',NULL),('2f2c57264a2240938f11a59df49ce29c','c657d573d06d48fd9e7c68bf8254674b','item_id','检查项目','varchar(64)','String','itemId','0','0','1','1','0','0','=','input','',NULL,'30','1','2018-03-17 11:16:34','1','2018-03-17 11:16:34',NULL,'0','0','0',NULL),('2f941261702445f2b6a67f043770a608','38e44531dea149a0a70219a175eb65cb','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'50','1','2018-03-07 16:18:04','1','2018-03-07 16:18:04',NULL,'0','0','0',NULL),('2f99f1f90c984294b35c24f4c88c21b5','fb90f165141648fe89fb2774ad2afbad','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'50','1','2018-03-07 16:09:01','1','2018-03-07 16:09:01',NULL,'0','0','0',NULL),('318ab537ddbc4e7c8665bb1b7dc74392','5e8fb141d8f04235996da148395083ed','code','编号','varchar(45)','String','code','0','0','1','1','0','1','like','input','',NULL,'20','1','2018-03-06 14:15:33','1','2018-03-06 14:15:33',NULL,'1','0','0',NULL),('32343a06a4bb47ee911de2627e95c25c','1fc82bd23cb64af4bc5f5874b9148aa3','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'130','1','2018-03-07 16:24:53','1','2018-03-07 16:24:53',NULL,'0','0','0',NULL),('33152ce420904594b3eac796a27f0560','6e05c389f3c6415ea34e55e9dfb28934','id','编号','varchar2(64)','String','id','1','0','1','0','0','0','=','input',NULL,NULL,'1','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('335c7bde25e44763aba17f3668b09ce9','3a4d8288c1ff4277b4beaed0ddad3301','remarks','备注','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'90','1','2018-03-07 15:57:22','1','2018-03-07 15:59:38',NULL,'0','0','0',NULL),('35af241859624a01917ab64c3f4f0813','aef6f1fc948f4c9ab1c1b780bc471cc2','del_flag','删除标记（0：正常；1：删除）','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'13','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('35e9ff3404d840f48bf7427f1ec1364a','67146f87f0b847a5a855efe4e9077e40','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'70','1','2018-03-07 16:20:28','1','2018-03-07 16:20:28',NULL,'0','0','0',NULL),('3830e7a9ac5f4b81b3f388a42f5d2745','1fc82bd23cb64af4bc5f5874b9148aa3','phone_number','联系电话','varchar(45)','String','phoneNumber','0','0','1','1','1','1','=','input','',NULL,'40','1','2018-03-07 16:24:52','1','2018-03-07 16:24:52',NULL,'0','0','0',NULL),('38a37e1cb20b44419658b136831fe214','4beae09010714fba860989f8d26cf1d0','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'50','1','2018-03-12 15:09:26','1','2018-03-12 16:36:54',NULL,'0','0','0',NULL),('38da3b896a5449a6bcbd55ca48cd0cf5','fb90f165141648fe89fb2774ad2afbad','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'60','1','2018-03-07 16:09:01','1','2018-03-07 16:09:01',NULL,'0','0','0',NULL),('398b4a03f06940bfb979ca574e1911e3','aef6f1fc948f4c9ab1c1b780bc471cc2','create_by','创建者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input',NULL,NULL,'8','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('3a7cf23ae48a4c849ceb03feffc7a524','43d6d5acffa14c258340ce6765e46c6f','area_id','归属区域','nvarchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.Area','area.id|name','0','1','1','1','0','0','=','areaselect',NULL,NULL,'4','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('3ac1739bc6704c6d85621e72d849e369','7003dd8eb3554a0ab99771fdd1464c74','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-07 15:59:22','1','2018-03-12 12:24:06',NULL,'0','0','0',NULL),('3b2b00fb9257448f8976d0f39411fb2a','7ea5e9edfc8f4eb293b9f7d54d19f4f3','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,'120','1','2018-04-20 17:02:29','1','2018-04-20 17:02:29',NULL,'0','0','0',NULL),('3b911e060ac54f0ab4ce2572814313d3','0f64808413ec40b4890b094920d9ed3c','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'80','1','2018-03-05 13:03:35','1','2018-03-05 14:14:52',NULL,'0','0','0',NULL),('3ba0c0ec74394de68d9f78e6a5587f5e','3a4d8288c1ff4277b4beaed0ddad3301','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-07 15:57:22','1','2018-03-07 15:59:38',NULL,'0','0','0',NULL),('3ce8ba6ba36a4fae906297e65df1cf94','a98828fcd5844036b3bd6203a5c2a15d','curr_val','当前值，取一个，增加一个','int(11)','String','currVal','0','0','1','1','0','0','=','input','',NULL,'30','1','2018-03-19 18:47:50','1','2018-03-19 18:47:50',NULL,'0','0','0',NULL),('3cef34196fe543c9aae306e0e167ff47','165367ce1a75430da8729b0561adce25','user_id','体检用户','varchar(64)','String','userId','0','0','1','1','0','1','=','fk_sys_user','',NULL,'40','1','2018-03-25 16:00:45','1','2018-03-25 16:13:40',NULL,'0','0','0','/sys/office/treeData?type=3'),('3d139b71a4fd47beaef6f40e7be75202','4beae09010714fba860989f8d26cf1d0','remarks','备注','varchar(255)','String','remarks','0','1','1','1','1','0','=','input','',NULL,'90','1','2018-03-12 15:09:26','1','2018-03-12 16:36:54',NULL,'0','0','0',NULL),('3d9c32865bb44e85af73381df0ffbf3d','43d6d5acffa14c258340ce6765e46c6f','update_date','更新时间','timestamp(6)','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect',NULL,NULL,'11','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('3df59db3747640d7a39d625ff54da67d','fb90f165141648fe89fb2774ad2afbad','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,'80','1','2018-03-07 16:09:01','1','2018-03-07 16:09:01',NULL,'0','0','0',NULL),('3e265b4a836c4932807d6d2ed512eb21','5e8fb141d8f04235996da148395083ed','name','名称','varchar(50)','String','name','0','0','1','1','1','1','like','input','',NULL,'30','1','2018-03-06 14:15:33','1','2018-03-06 14:15:33',NULL,'1','0','0',NULL),('3e41db865c3b4601a05f65e6868b1632','263df3b73ec844e89e6ce388e2ede14b','industry_id','行业','varchar(64)','String','industryId','0','0','1','1','0','0','=','select','',NULL,'70','1','2018-03-07 16:26:02','1','2018-03-17 12:03:35',NULL,'0','0','0',NULL),('3e4e90e6859b4d3cae042283499991ab','74db589fc1e74881be178df82449d5ee','remarks','备注','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'80','1','2018-03-07 16:03:59','1','2018-03-07 16:03:59',NULL,'0','0','0',NULL),('412cd53f68c54d22aab2ec23db19166a','6c9094e7e22b4aadb26da86e9b8cbaa3','reference_flag','参考标识：0-否，1-是','char(1)','String','referenceFlag','0','0','1','1','0','0','=','input','',NULL,'100','1','2018-03-07 16:11:10','1','2018-03-07 16:11:10',NULL,'0','0','0',NULL),('416c76d2019b4f76a96d8dc3a8faf84c','f6e4dafaa72f4c509636484715f33a96','update_date','更新时间','timestamp(6)','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect',NULL,NULL,'9','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('420fc0cf4a00411a8e05700064afcda4','8cc24412bbc4414a9ab589e7877028f9','name','名称','varchar(50)','String','name','0','0','1','1','1','1','like','input','',NULL,'20','1','2018-03-07 16:19:26','1','2018-03-07 16:19:26',NULL,'1','0','0',NULL),('4455a83bdab84eb7a36fae65d96995e9','7ea5e9edfc8f4eb293b9f7d54d19f4f3','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'90','1','2018-04-20 17:02:29','1','2018-04-20 17:02:29',NULL,'0','0','0',NULL),('44f9d55e0c1841c3b7e3b667569222a8','5e8fb141d8f04235996da148395083ed','enable_date','有效期','datetime','java.util.Date','enableDate','0','0','1','1','0','1','=','dateselect','',NULL,'100','1','2018-03-06 14:15:33','1','2018-03-06 14:15:33',NULL,'1','0','0',NULL),('4572ae9b9f51475faeeceb037b2f3ae3','38ca93fc0d8f4fa08d622c0ecdeefa6d','item_id','检查项目','varchar(64)','String','itemId','0','0','1','1','0','0','=','select','',NULL,'30','1','2018-03-07 16:23:20','1','2018-03-12 10:30:56',NULL,'0','0','0',NULL),('46e6d8283270493687085d29efdecb05','f6e4dafaa72f4c509636484715f33a96','del_flag','删除标记（0：正常；1：删除）','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'11','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('472601e6e45c41d69594b6f67329343b','263df3b73ec844e89e6ce388e2ede14b','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-07 16:26:02','1','2018-03-17 12:03:35',NULL,'0','0','0',NULL),('475f39608f9e4e6eac7d95a7dfb900ea','38e44531dea149a0a70219a175eb65cb','unit','单位','varchar(64)','String','unit','0','0','1','1','1','0','=','input','',NULL,'130','1','2018-03-07 16:18:05','1','2018-03-07 16:18:05',NULL,'0','0','0',NULL),('47d61f891eda491dbf9c3ea17f7efc6d','5e8fb141d8f04235996da148395083ed','remarks','备注','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'150','1','2018-03-06 14:15:34','1','2018-03-06 14:15:34',NULL,'1','0','0',NULL),('48bfa2bcd0fa4d4bb1d6cfe011789153','6c9094e7e22b4aadb26da86e9b8cbaa3','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'70','1','2018-03-07 16:11:10','1','2018-03-07 16:11:10',NULL,'0','0','0',NULL),('4a0a1fff86ca46519477d66b82e01991','aef6f1fc948f4c9ab1c1b780bc471cc2','name','名称','nvarchar2(100)','String','name','0','1','1','1','1','1','like','input',NULL,NULL,'5','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('4bb81aa2d9014d8d922de9eec6f88172','8cc24412bbc4414a9ab589e7877028f9','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'70','1','2018-03-07 16:19:26','1','2018-03-07 16:19:26',NULL,'1','0','0',NULL),('4c8ef12cb6924b9ba44048ba9913150b','43d6d5acffa14c258340ce6765e46c6f','create_date','创建时间','timestamp(6)','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect',NULL,NULL,'9','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('4df3b7d6db12496f896eb5a8fb7d11fc','0c1a5cd70b104852b79102cb62270f52','specimen_name','样本类型名称','varchar(64)','String','specimenName','0','1','1','1','0','0','=','input','',NULL,'30','1','2018-04-20 16:58:56','1','2018-04-20 16:58:56',NULL,'0','0','0',NULL),('4e42469cbe3c489394e6a4de89ff1c18','38e44531dea149a0a70219a175eb65cb','range_min','参考范围最小值','varchar(45)','String','rangeMin','0','1','1','1','1','0','=','input','',NULL,'160','1','2018-03-07 16:18:05','1','2018-03-07 16:18:05',NULL,'0','0','0',NULL),('4eb26e0e6081442ca0ef1dacd15ae234','6c9094e7e22b4aadb26da86e9b8cbaa3','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,'80','1','2018-03-07 16:11:10','1','2018-03-07 16:11:10',NULL,'0','0','0',NULL),('505fa2c2cff04c8fa19f1fc1cecf0b6e','0c1a5cd70b104852b79102cb62270f52','code_count','样本编号数量','varchar(10)','String','codeCount','0','1','1','1','0','0','=','input','',NULL,'40','1','2018-04-20 16:58:56','1','2018-04-20 16:58:56',NULL,'0','0','0',NULL),('515ff9d8b2804fbc9cb73d0a22369cf5','de5493dc511c454a823c223814ad2ec3','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-06 12:45:42','1','2018-03-06 12:45:42',NULL,'1','0','0',NULL),('5295e8257a754bc29d4cf052a3a13184','6c9094e7e22b4aadb26da86e9b8cbaa3','owner','所属体检中心','varchar(64)','String','owner','0','1','1','1','0','0','=','input','',NULL,'110','1','2018-03-07 16:11:10','1','2018-03-07 16:11:10',NULL,'0','0','0',NULL),('53d65a3d306d4fac9e561db9d3c66912','6e05c389f3c6415ea34e55e9dfb28934','del_flag','删除标记（0：正常；1：删除）','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'9','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('55131190e5a74828bdd96241fb66a2d0','8cc24412bbc4414a9ab589e7877028f9','item_id','检查项目','varchar(64)','String','itemId','0','0','1','1','0','0','=','input','',NULL,'40','1','2018-03-07 16:19:26','1','2018-03-07 16:19:26',NULL,'1','0','0',NULL),('55473826ef53403f9c2600a62593374c','0ef5b1fbbf594e32ac90c2524935eb15','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-06 13:46:01','1','2018-03-11 13:42:45',NULL,'0','0','0',NULL),('5572d9a2e9dc444281603cc0390a34f3','67146f87f0b847a5a855efe4e9077e40','name','名称','varchar(50)','String','name','0','0','1','1','1','1','like','input','',NULL,'20','1','2018-03-07 16:20:28','1','2018-03-07 16:20:28',NULL,'0','0','0',NULL),('56456cb1916e4e46bb289e9420a03565','7ea5e9edfc8f4eb293b9f7d54d19f4f3','id','编号','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-04-20 17:02:28','1','2018-04-20 17:02:28',NULL,'0','0','0',NULL),('56c7d4476cd74d15891a77eb69c1521d','778b701a91b64ea5b35c17fd63948436','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'60','1','2018-03-07 16:15:20','1','2018-03-07 16:15:20',NULL,'0','0','0',NULL),('56d12196f64141c18c38eaa12b3b1e03','67146f87f0b847a5a855efe4e9077e40','category_id','检查大类','varchar(64)','String','categoryId','0','0','1','1','0','0','=','input','',NULL,'40','1','2018-03-07 16:20:28','1','2018-03-07 16:20:28',NULL,'0','0','0',NULL),('56fa71c0bd7e4132931874e548dc9ba5','6e05c389f3c6415ea34e55e9dfb28934','update_by','更新者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input',NULL,NULL,'6','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('572d26f0eb2c4ba4a436af28482b112f','38ca93fc0d8f4fa08d622c0ecdeefa6d','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'80','1','2018-03-07 16:23:20','1','2018-03-12 10:30:56',NULL,'0','0','0',NULL),('57b2e7e12a0147f8b9c475ab3afcddf0','b9dcbd6f07b34b09a7de65921518d6a1','owner','所属体检中心','varchar(64)','String','owner','0','1','1','1','0','0','=','input','',NULL,'110','1','2018-03-11 13:42:01','1','2018-03-11 13:42:29',NULL,'0','0','0',NULL),('5806cd01e87842f5a7d0c33d989893d7','38e44531dea149a0a70219a175eb65cb','specimen_id','所需标本','varchar(64)','String','specimenId','0','1','1','1','1','0','=','input','',NULL,'170','1','2018-03-07 16:18:05','1','2018-03-07 16:18:05',NULL,'0','0','0',NULL),('58a5b27c3a74472083958f84f74d677e','38ca93fc0d8f4fa08d622c0ecdeefa6d','default_flag','是否默认：0-否，1-是','char(1)','String','defaultFlag','0','0','1','1','0','0','=','select','yes_no',NULL,'40','1','2018-03-07 16:23:20','1','2018-03-12 10:30:56',NULL,'0','0','0',NULL),('593d8788493b4dea9bb206226bccf5f2','7003dd8eb3554a0ab99771fdd1464c74','remarks','备注','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'80','1','2018-03-07 15:59:22','1','2018-03-12 12:24:07',NULL,'0','0','0',NULL),('59ac652f303d4695ae8750ab96034943','74db589fc1e74881be178df82449d5ee','name','名称','varchar(50)','String','name','0','0','1','1','1','1','like','input','',NULL,'20','1','2018-03-07 16:03:59','1','2018-03-07 16:03:59',NULL,'0','0','0',NULL),('5a4a1933c9c844fdba99de043dc8205e','aef6f1fc948f4c9ab1c1b780bc471cc2','update_by','更新者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input',NULL,NULL,'10','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('5aa171b6dced474785f6b555102749ad','38e44531dea149a0a70219a175eb65cb','type_id','检查项目类型','varchar(64)','String','typeId','0','0','1','1','0','0','=','input','',NULL,'120','1','2018-03-07 16:18:05','1','2018-03-07 16:18:05',NULL,'0','0','0',NULL),('5cd32b23e2ee49eca43231cf58718ce6','5ccbcfb5e27348c4826ed976bbd1cc56','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'70','1','2018-03-03 00:29:13','1','2018-03-03 00:29:13',NULL,'1','0','0',NULL),('5e5c69bd3eaa4dcc9743f361f3771c08','aef6f1fc948f4c9ab1c1b780bc471cc2','id','编号','varchar2(64)','String','id','1','0','1','0','0','0','=','input',NULL,NULL,'1','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('5fc81de91c29413eb6ee77953460709e','67146f87f0b847a5a855efe4e9077e40','owner','所属体检中心','varchar(64)','String','owner','0','1','1','1','0','0','=','input','',NULL,'120','1','2018-03-07 16:20:29','1','2018-03-07 16:20:29',NULL,'0','0','0',NULL),('60c08cbd528347e983d130f12ec7a36a','0f64808413ec40b4890b094920d9ed3c','auth_name','作者','varchar(64)','String','authName','0','1','0','0','0','0','=','input','',NULL,'50','1','2018-03-05 13:03:35','1','2018-03-05 14:14:52',NULL,'0','0','0',NULL),('60c3114025c34127ae1398112db07fb8','0c1a5cd70b104852b79102cb62270f52','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'80','1','2018-04-20 16:58:56','1','2018-04-20 16:58:56',NULL,'0','0','0',NULL),('627381bc3bf74bc18722ae47ce9dd507','5ccbcfb5e27348c4826ed976bbd1cc56','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'100','1','2018-03-03 00:29:13','1','2018-03-03 00:29:13',NULL,'1','0','0',NULL),('62d06ee60e6c4ce38047bd42da833844','0c1a5cd70b104852b79102cb62270f52','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'70','1','2018-04-20 16:58:56','1','2018-04-20 16:58:56',NULL,'0','0','0',NULL),('633f5a49ec974c099158e7b3e6bfa930','f6e4dafaa72f4c509636484715f33a96','name','名称','nvarchar2(100)','String','name','0','0','1','1','1','1','like','input',NULL,NULL,'4','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('63500ca2a8934c1aaf7beff01c4d7d72','0ef5b1fbbf594e32ac90c2524935eb15','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'60','1','2018-03-06 13:46:01','1','2018-03-11 13:42:45',NULL,'0','0','0',NULL),('652491500f2641ffa7caf95a93e64d34','6e05c389f3c6415ea34e55e9dfb28934','update_date','更新时间','timestamp(6)','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect',NULL,NULL,'7','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('65715e24446e475ab02ae7379c18ca3a','38e44531dea149a0a70219a175eb65cb','name','名称','varchar(50)','String','name','0','0','1','1','1','1','like','input','',NULL,'30','1','2018-03-07 16:18:04','1','2018-03-07 16:18:04',NULL,'0','0','0',NULL),('664996d9b3c54097918122c2f2b82ae1','1fc82bd23cb64af4bc5f5874b9148aa3','sex','性别','varchar(64)','String','sex','0','0','1','1','1','0','=','input','',NULL,'50','1','2018-03-07 16:24:52','1','2018-03-07 16:24:52',NULL,'0','0','0',NULL),('673f21591d3d44bf8aeb233f643951ee','263df3b73ec844e89e6ce388e2ede14b','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,'150','1','2018-03-07 16:26:03','1','2018-03-17 12:03:35',NULL,'0','0','0',NULL),('6763ff6dc7cd4c668e76cf9b697d3ff6','f6e4dafaa72f4c509636484715f33a96','sort','排序','number(10)','Integer','sort','0','0','1','1','1','0','=','input',NULL,NULL,'5','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('676f0bb881b9495294e8fbe6a0dc140f','b9dcbd6f07b34b09a7de65921518d6a1','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'50','1','2018-03-06 13:14:06','1','2018-03-11 13:42:28',NULL,'0','0','0',NULL),('67d0331f809a48ee825602659f0778e8','43d6d5acffa14c258340ce6765e46c6f','name','名称','nvarchar2(100)','String','name','0','1','1','1','1','1','like','input',NULL,NULL,'5','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('67e2c8c4b6d8469fa2c20d55edd331e4','67146f87f0b847a5a855efe4e9077e40','price','价格','varchar(100)','String','price','0','1','1','1','1','0','=','input','',NULL,'30','1','2018-03-07 16:20:28','1','2018-03-07 16:20:28',NULL,'0','0','0',NULL),('68345713bef3445c906f70e68f55de38','6e05c389f3c6415ea34e55e9dfb28934','test_data_main_id','业务主表','varchar2(64)','String','testDataMain.id','0','1','1','1','0','0','=','input',NULL,NULL,'2','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('69d51444dd4641f4bb4743333f4fdbf8','85e80c76deba4aeb93da7b186077c44a','code','编号','varchar(45)','String','code','0','0','1','1','0','0','=','input','',NULL,'20','1','2018-03-14 12:07:44','1','2018-03-14 12:07:44',NULL,'0','0','0',NULL),('69f49d4af6134400b2d483028d9e42e8','b9dcbd6f07b34b09a7de65921518d6a1','remarks','备注','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'90','1','2018-03-06 14:12:20','1','2018-03-11 13:42:28',NULL,'0','0','0',NULL),('6a156a5bb89d49ed81a1afad7e97c9bd','778b701a91b64ea5b35c17fd63948436','code','编号','varchar(45)','String','code','0','0','1','1','1','1','=','input','',NULL,'20','1','2018-03-07 16:15:19','1','2018-03-07 16:15:19',NULL,'0','0','0',NULL),('6a6651ff4b08424f9706bffeb8c14a02','7ea5e9edfc8f4eb293b9f7d54d19f4f3','sample_code','样本编号','varchar(64)','String','sampleCode','0','0','1','1','0','0','=','input','',NULL,'50','1','2018-04-20 17:02:28','1','2018-04-20 17:02:28',NULL,'0','0','0',NULL),('6a6805388b63411485a6275b2314deb0','38ca93fc0d8f4fa08d622c0ecdeefa6d','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-07 16:23:20','1','2018-03-12 10:30:56',NULL,'0','0','0',NULL),('6a84032a85284d26b1abb6998fe0148d','0c1a5cd70b104852b79102cb62270f52','auth_id','auth_id','varchar(64)','String','authId','0','0','1','1','0','0','=','input','',NULL,'50','1','2018-04-20 16:58:56','1','2018-04-20 16:58:56',NULL,'0','0','0',NULL),('6ae109f6e1c241e4bcf260f372ad2588','6c9094e7e22b4aadb26da86e9b8cbaa3','name','名称','varchar(50)','String','name','0','0','1','1','1','1','like','input','',NULL,'30','1','2018-03-07 16:11:10','1','2018-03-07 16:11:10',NULL,'0','0','0',NULL),('6b9cae3a6c8d45518328fb3cc8f6ecdb','fb90f165141648fe89fb2774ad2afbad','remarks','备注','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'90','1','2018-03-07 16:09:01','1','2018-03-07 16:09:01',NULL,'0','0','0',NULL),('6c2824179cb74c97847a26f65d0b9e61','0c1a5cd70b104852b79102cb62270f52','auth_name','作者','varchar(64)','String','authName','0','1','1','1','0','0','=','input','',NULL,'60','1','2018-04-20 16:58:56','1','2018-04-20 16:58:56',NULL,'0','0','0',NULL),('6e068514809b4a00998d6d0b5f34f83b','c657d573d06d48fd9e7c68bf8254674b','record_id','检查记录','varchar(64)','String','recordId','0','0','1','1','0','0','=','input','',NULL,'20','1','2018-03-17 11:16:34','1','2018-03-17 11:16:34',NULL,'0','0','0',NULL),('711243d6e0f142c7acbaffe279edfd1e','7003dd8eb3554a0ab99771fdd1464c74','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'40','1','2018-03-07 15:59:22','1','2018-03-12 12:24:06',NULL,'0','0','0',NULL),('71ea4bc10d274911b405f3165fc1bb1a','aef6f1fc948f4c9ab1c1b780bc471cc2','area_id','归属区域','nvarchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.Area','area.id|name','0','1','1','1','1','1','=','areaselect',NULL,NULL,'4','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('72e35cc1216146b582ef50babdf78f78','5ccbcfb5e27348c4826ed976bbd1cc56','auth_name','作者','varchar(64)','String','authName','0','1','1','1','0','1','=','input','',NULL,'40','1','2018-03-03 00:29:13','1','2018-03-03 00:29:13',NULL,'1','0','0',NULL),('731c937506604874a998379435687897','67146f87f0b847a5a855efe4e9077e40','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','0','0','=','dateselect','',NULL,'90','1','2018-03-07 16:20:28','1','2018-03-07 16:20:28',NULL,'0','0','0',NULL),('750a345675f94ec7bf239a08d212d857','0ef5b1fbbf594e32ac90c2524935eb15','code','编号','varchar(45)','String','code','0','0','1','1','1','1','like','input','',NULL,'20','1','2018-03-06 13:46:01','1','2018-03-11 13:42:45',NULL,'0','0','0',NULL),('7546051fe713464dbfed534779d74f49','263df3b73ec844e89e6ce388e2ede14b','owner','所属体检中心','varchar(64)','String','owner','0','1','1','1','0','0','=','input','',NULL,'170','1','2018-03-07 16:26:03','1','2018-03-17 12:03:35',NULL,'0','0','0',NULL),('75f8e3d3d89f4141977f28b3af5c6d38','85e80c76deba4aeb93da7b186077c44a','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'50','1','2018-03-14 12:07:44','1','2018-03-14 12:07:44',NULL,'0','0','0',NULL),('78f5f07499164fa2865fb141922548a9','263df3b73ec844e89e6ce388e2ede14b','user_id','体检用户','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','user.id','0','0','1','1','1','1','=','fk_sys_user','',NULL,'20','1','2018-03-07 16:26:02','1','2018-03-17 12:03:35',NULL,'0','0','0','/sys/office/treeData?type=3'),('798673faab5f419397dfc5fea736b12e','165367ce1a75430da8729b0561adce25','id_number','身份证号','varchar(20)','String','idNumber','0','1','1','1','1','1','=','input','',NULL,'50','1','2018-03-25 16:00:45','1','2018-03-25 16:13:40',NULL,'0','0','0',NULL),('79cfd1a3c38f4f2687647b39861f85ea','c657d573d06d48fd9e7c68bf8254674b','remarks','备注','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'110','1','2018-03-17 11:16:34','1','2018-03-17 11:16:34',NULL,'0','0','0',NULL),('7b07da14d0af40049ac9f543aca65a5f','263df3b73ec844e89e6ce388e2ede14b','package_price','套餐价格','varchar(64)','String','packagePrice','0','1','1','1','1','0','=','input','',NULL,'190','1','2018-03-07 16:26:03','1','2018-03-17 12:03:35',NULL,'0','0','0',NULL),('7b41844a657e4f7db7a506e88cfbff1d','778b701a91b64ea5b35c17fd63948436','owner','所属体检中心','varchar(64)','String','owner','0','1','1','1','0','0','=','input','',NULL,'110','1','2018-03-07 16:15:20','1','2018-03-07 16:15:20',NULL,'0','0','0',NULL),('7b41d9d496f8419eb845f0c12ca9de60','7ea5e9edfc8f4eb293b9f7d54d19f4f3','auth_name','作者','varchar(64)','String','authName','0','1','1','1','0','0','=','input','',NULL,'80','1','2018-04-20 17:02:29','1','2018-04-20 17:02:29',NULL,'0','0','0',NULL),('7b51ff26a6a7416ab09014dd820e0b5e','fb90f165141648fe89fb2774ad2afbad','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-07 16:09:00','1','2018-03-07 16:09:00',NULL,'0','0','0',NULL),('7c5599e103d5466395fb2e928a04ef6f','de5493dc511c454a823c223814ad2ec3','code','code','varchar(45)','String','code','0','0','1','1','1','1','=','input','',NULL,'20','1','2018-03-06 12:45:42','1','2018-03-06 12:45:42',NULL,'1','0','0',NULL),('7d195536091b4432835bf199c7e0b424','778b701a91b64ea5b35c17fd63948436','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'70','1','2018-03-07 16:15:20','1','2018-03-07 16:15:20',NULL,'0','0','0',NULL),('7f871058d94c4d9a89084be7c9ce806d','6e05c389f3c6415ea34e55e9dfb28934','remarks','备注信息','nvarchar2(255)','String','remarks','0','1','1','1','1','0','=','input',NULL,NULL,'8','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('7facc7a3c64c43de8db0438a05a19012','1fc82bd23cb64af4bc5f5874b9148aa3','post_id','岗位','varchar(64)','String','postId','0','0','1','1','0','0','=','input','',NULL,'70','1','2018-03-07 16:24:52','1','2018-03-07 16:24:52',NULL,'0','0','0',NULL),('802d777e0bd04ce6918cc8c7fb9ad868','0f64808413ec40b4890b094920d9ed3c','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,'90','1','2018-03-05 13:03:35','1','2018-03-05 14:14:52',NULL,'0','0','0',NULL),('8168e1ab2f864618a11ceb1120e1fc8d','8cc24412bbc4414a9ab589e7877028f9','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','0','0','=','dateselect','',NULL,'100','1','2018-03-07 16:19:26','1','2018-03-07 16:19:26',NULL,'1','0','0',NULL),('84df1af9436d4e81a20662633407ee14','de5493dc511c454a823c223814ad2ec3','name','name','varchar(50)','String','name','0','0','1','1','1','1','like','input','',NULL,'30','1','2018-03-06 12:45:42','1','2018-03-06 12:45:42',NULL,'1','0','0',NULL),('862df9afa26d48abbf7adf6ff9e2c7a4','0f64808413ec40b4890b094920d9ed3c','content','内容','varchar(20000)','String','content','0','0','1','1','0','0','=','ckeditor','',NULL,'30','1','2018-03-05 13:03:35','1','2018-03-05 14:14:52',NULL,'0','0','0',NULL),('865ccff0c236493fa5eca71976cbca4f','fb90f165141648fe89fb2774ad2afbad','reference_flag','参考标识：0-否，1-是','char(1)','String','referenceFlag','0','0','1','1','0','0','=','input','',NULL,'100','1','2018-03-07 16:09:01','1','2018-03-07 16:09:01',NULL,'0','0','0',NULL),('8667f2d3ed0b454fa795b1e9f28e898b','38e44531dea149a0a70219a175eb65cb','owner','所属体检中心','varchar(64)','String','owner','0','1','1','1','0','0','=','input','',NULL,'110','1','2018-03-07 16:18:05','1','2018-03-07 16:18:05',NULL,'0','0','0',NULL),('87594b1c8f014674a6a5c8d02a4e873b','67146f87f0b847a5a855efe4e9077e40','remarks','备注','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'100','1','2018-03-07 16:20:29','1','2018-03-07 16:20:29',NULL,'0','0','0',NULL),('876b1d89c7474de8b7bb6110d657aa34','85e80c76deba4aeb93da7b186077c44a','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'70','1','2018-03-14 12:07:44','1','2018-03-14 12:07:44',NULL,'0','0','0',NULL),('87a0383b2e1e4fb2a7f05a131cc0761f','74db589fc1e74881be178df82449d5ee','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'50','1','2018-03-07 16:03:59','1','2018-03-07 16:03:59',NULL,'0','0','0',NULL),('89cbd17e03534d6694cf0a25b54bcc14','fb90f165141648fe89fb2774ad2afbad','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'40','1','2018-03-07 16:09:00','1','2018-03-07 16:09:00',NULL,'0','0','0',NULL),('8b4330c964b14507a33ee396d8287a68','4beae09010714fba860989f8d26cf1d0','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','0','1','0','=','dateselect','',NULL,'80','1','2018-03-12 15:09:26','1','2018-03-12 16:36:54',NULL,'0','0','0',NULL),('8b48774cfe184913b8b5eb17639cf12d','43d6d5acffa14c258340ce6765e46c6f','create_by','创建者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input',NULL,NULL,'8','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('8b7cf0525519474ebe1de9e587eb7067','6e05c389f3c6415ea34e55e9dfb28934','create_date','创建时间','timestamp(6)','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect',NULL,NULL,'5','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('8b9de88df53e485d8ef461c4b1824bc1','43d6d5acffa14c258340ce6765e46c6f','user_id','归属用户','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','user.id|name','0','1','1','1','1','1','=','userselect',NULL,NULL,'2','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('8ba46b9ced4f47f1b6ba0dae8e0ad176','38ca93fc0d8f4fa08d622c0ecdeefa6d','name','名称','varchar(50)','String','name','0','0','1','1','1','1','like','input','',NULL,'20','1','2018-03-07 16:23:20','1','2018-03-12 10:30:56',NULL,'0','0','0',NULL),('8bcba22e49f642ffa0c156411fd32bad','3a4d8288c1ff4277b4beaed0ddad3301','code','编号','varchar(45)','String','code','0','0','1','1','1','0','=','input','',NULL,'20','1','2018-03-07 15:57:22','1','2018-03-07 15:59:38',NULL,'0','0','0',NULL),('8c5349cef95847dcac90f6e2099018fd','85e80c76deba4aeb93da7b186077c44a','template_path','模板路径','varchar(64)','String','templatePath','0','1','1','1','0','0','=','input','',NULL,'120','1','2018-03-14 12:07:44','1','2018-03-14 12:07:44',NULL,'0','0','0',NULL),('8da38dbe5fe54e9bb1f9682c27fbf403','aef6f1fc948f4c9ab1c1b780bc471cc2','remarks','备注信息','nvarchar2(255)','String','remarks','0','1','1','1','1','0','=','textarea',NULL,NULL,'12','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('8eb444bae02148d6b8a7cf836cca3de1','38ca93fc0d8f4fa08d622c0ecdeefa6d','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'50','1','2018-03-07 16:23:20','1','2018-03-12 10:30:56',NULL,'0','0','0',NULL),('8f9d774237314e9f81de6537de987d74','0ef5b1fbbf594e32ac90c2524935eb15','name','名称','varchar(50)','String','name','0','0','1','1','1','1','like','input','',NULL,'30','1','2018-03-06 13:46:01','1','2018-03-11 13:42:45',NULL,'0','0','0',NULL),('9198fcb6d1f149aea720b817b690a17a','8cc24412bbc4414a9ab589e7877028f9','price','价格','varchar(100)','String','price','0','1','1','1','1','0','=','input','',NULL,'30','1','2018-03-07 16:19:26','1','2018-03-07 16:19:26',NULL,'1','0','0',NULL),('91a06e50b6a9402badfb974605ea4407','4beae09010714fba860989f8d26cf1d0','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'40','1','2018-03-12 15:09:26','1','2018-03-12 16:36:54',NULL,'0','0','0',NULL),('91e1304f73894ee78b113ad4a524e0e8','778b701a91b64ea5b35c17fd63948436','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'50','1','2018-03-07 16:15:20','1','2018-03-07 16:15:20',NULL,'0','0','0',NULL),('92481c16a0b94b0e8bba16c3c54eb1e4','f6e4dafaa72f4c509636484715f33a96','create_date','创建时间','timestamp(6)','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect',NULL,NULL,'7','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('9295b9885260443fa50c19536af087fc','1fc82bd23cb64af4bc5f5874b9148aa3','industry_id','行业','varchar(64)','String','industryId','0','0','1','1','0','0','=','input','',NULL,'60','1','2018-03-07 16:24:52','1','2018-03-07 16:24:52',NULL,'0','0','0',NULL),('933f03ca21e3454692568892f114e805','0ef5b1fbbf594e32ac90c2524935eb15','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','0','0','=','dateselect','',NULL,'80','1','2018-03-06 13:46:01','1','2018-03-11 13:42:45',NULL,'0','0','0',NULL),('93a12b991185481c96750e053b5beeb7','8cc24412bbc4414a9ab589e7877028f9','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'90','1','2018-03-07 16:19:26','1','2018-03-07 16:19:26',NULL,'1','0','0',NULL),('94cb3adb334348a092533f039aa1ff85','7003dd8eb3554a0ab99771fdd1464c74','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','0','0','=','dateselect','',NULL,'70','1','2018-03-07 15:59:22','1','2018-03-12 12:24:06',NULL,'0','0','0',NULL),('957fcf422b66419db0723d10b7f3139a','7313b302ac694a0f9639efaa0ad188d1','center_name','体检中心名称，添加后，自动增加到部门的体检中心节点下','varchar(32)','String','centerName','0','1','1','1','0','0','=','input','',NULL,'40','1','2018-04-18 11:31:06','1','2018-04-18 11:31:06',NULL,'0','0','0',NULL),('9861d597f67d458cb89ad3479d88f974','7313b302ac694a0f9639efaa0ad188d1','code_pre','当前体检中心编号前缀','varchar(16)','String','codePre','0','1','1','1','0','0','=','input','',NULL,'30','1','2018-04-18 11:31:06','1','2018-04-18 11:31:06',NULL,'0','0','0',NULL),('986419ff4a224aa6b6b11f58e9a9c692','fb90f165141648fe89fb2774ad2afbad','owner','所属体检中心','varchar(64)','String','owner','0','1','1','0','0','0','=','input','',NULL,'110','1','2018-03-07 16:09:01','1','2018-03-07 16:09:01',NULL,'0','0','0',NULL),('98c1d297160543b0894fae18b56792a4','74db589fc1e74881be178df82449d5ee','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'40','1','2018-03-07 16:03:59','1','2018-03-07 16:03:59',NULL,'0','0','0',NULL),('98fe8c837c2148e0b369f7dbadb4a2e7','263df3b73ec844e89e6ce388e2ede14b','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'140','1','2018-03-07 16:26:03','1','2018-03-17 12:03:35',NULL,'0','0','0',NULL),('99214ee17c73473fa53d4ec45d97ffe8','5ccbcfb5e27348c4826ed976bbd1cc56','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,'80','1','2018-03-03 00:29:13','1','2018-03-03 00:29:13',NULL,'1','0','0',NULL),('9955912078e64220aeb8cb7dca6650ff','165367ce1a75430da8729b0561adce25','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'70','1','2018-03-25 16:00:45','1','2018-03-25 16:13:40',NULL,'0','0','0',NULL),('997eddec1fc14b1196567002a05d5847','85e80c76deba4aeb93da7b186077c44a','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'40','1','2018-03-14 12:07:44','1','2018-03-14 12:07:44',NULL,'0','0','0',NULL),('9a012c1d2f934dbf996679adb7cc827a','f6e4dafaa72f4c509636484715f33a96','parent_id','父级编号','varchar2(64)','This','parent.id|name','0','0','1','1','0','0','=','treeselect',NULL,NULL,'2','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('9a485e43a1964390b9ae76a644a14186','7003dd8eb3554a0ab99771fdd1464c74','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'50','1','2018-03-07 15:59:22','1','2018-03-12 12:24:06',NULL,'0','0','0',NULL),('9bc771570a924d49bb6787d4b84ac90a','0f64808413ec40b4890b094920d9ed3c','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'60','1','2018-03-05 13:03:35','1','2018-03-05 14:14:52',NULL,'0','0','0',NULL),('9bf105aacb3d4fd1bc9fb12a8a5969a0','3a4d8288c1ff4277b4beaed0ddad3301','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'50','1','2018-03-07 15:57:22','1','2018-03-07 15:59:38',NULL,'0','0','0',NULL),('9c5ee9a0633f43d087cfcb11b4cdbddf','38e44531dea149a0a70219a175eb65cb','price','价格','varchar(45)','String','price','0','1','1','1','1','0','=','input','',NULL,'140','1','2018-03-07 16:18:05','1','2018-03-07 16:18:05',NULL,'0','0','0',NULL),('9d244adf2b7c4b81a4d0096d8603e6c9','7ea5e9edfc8f4eb293b9f7d54d19f4f3','specimen_name','样本类型名称','varchar(64)','String','specimenName','0','0','1','1','0','0','=','input','',NULL,'30','1','2018-04-20 17:02:28','1','2018-04-20 17:02:28',NULL,'0','0','0',NULL),('9d36c09d6ac34596a742a901486f2176','3a4d8288c1ff4277b4beaed0ddad3301','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'60','1','2018-03-07 15:57:22','1','2018-03-07 15:59:38',NULL,'0','0','0',NULL),('9e2454cb13e24b12b64c591f1084eb7e','263df3b73ec844e89e6ce388e2ede14b','organ_id','单位','varchar(64)','String','organId','0','0','1','1','1','0','=','input','',NULL,'100','1','2018-03-07 16:26:03','1','2018-03-17 12:03:35',NULL,'0','0','0',NULL),('9f20a97606fe46079eea17b10f9fef4f','0c1a5cd70b104852b79102cb62270f52','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,'100','1','2018-04-20 16:58:56','1','2018-04-20 16:58:56',NULL,'0','0','0',NULL),('9f54d0edf5a743899af64cbf7e73fe59','7003dd8eb3554a0ab99771fdd1464c74','name','名称','varchar(50)','String','name','0','0','1','1','1','1','like','input','',NULL,'20','1','2018-03-07 15:59:22','1','2018-03-12 12:24:06',NULL,'0','0','0',NULL),('a0c90ea85d5344da90c961ae9143a373','7313b302ac694a0f9639efaa0ad188d1','owner','所属的体检中心','varchar(64)','String','owner','0','0','1','1','0','0','=','input','',NULL,'20','1','2018-04-18 11:31:06','1','2018-04-18 11:31:06',NULL,'0','0','0',NULL),('a0dc2ca52742486c96686ef218bbd455','8cc24412bbc4414a9ab589e7877028f9','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'60','1','2018-03-07 16:19:26','1','2018-03-07 16:19:26',NULL,'1','0','0',NULL),('a12598f2d8cf4ca1a03c21f9a1bbe18e','263df3b73ec844e89e6ce388e2ede14b','remarks','备注','varchar(255)','String','remarks','0','1','1','1','0','0','=','textarea','',NULL,'160','1','2018-03-07 16:26:03','1','2018-03-17 12:03:35',NULL,'0','0','0',NULL),('a1692cca65ca4b0c8951037b8aaeae0d','38e44531dea149a0a70219a175eb65cb','remarks','备注','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'90','1','2018-03-07 16:18:04','1','2018-03-07 16:18:04',NULL,'0','0','0',NULL),('a1ddeec1ba664735b1922803d942aa5f','de5493dc511c454a823c223814ad2ec3','create_by','create_by','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'50','1','2018-03-06 12:45:42','1','2018-03-06 12:45:42',NULL,'1','0','0',NULL),('a21a3bc1cac84a28b16d1ee4b52ebc3e','38e44531dea149a0a70219a175eb65cb','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,'80','1','2018-03-07 16:18:04','1','2018-03-07 16:18:04',NULL,'0','0','0',NULL),('a290e56b770e454ba7e110e8c9567f72','778b701a91b64ea5b35c17fd63948436','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-07 16:15:19','1','2018-03-07 16:15:19',NULL,'0','0','0',NULL),('a4f8346c64db496fb0882911c4f6e661','7ea5e9edfc8f4eb293b9f7d54d19f4f3','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'110','1','2018-04-20 17:02:29','1','2018-04-20 17:02:29',NULL,'0','0','0',NULL),('a569004c6dbf4a24a5f6d9f48aa77569','5ccbcfb5e27348c4826ed976bbd1cc56','content','内容','varchar(2000)','String','content','0','1','1','1','0','0','like','textarea','',NULL,'30','1','2018-03-03 00:29:13','1','2018-03-03 00:29:13',NULL,'1','0','0',NULL),('a60d713935934d4f8ae4cb0001417eec','165367ce1a75430da8729b0561adce25','remarks','备注','varchar(255)','String','remarks','0','1','1','0','1','0','=','textarea','',NULL,'120','1','2018-03-25 16:00:45','1','2018-03-25 16:13:40',NULL,'0','0','0',NULL),('a6f44ca21254496e989911d6c5923e61','38ca93fc0d8f4fa08d622c0ecdeefa6d','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'60','1','2018-03-07 16:23:20','1','2018-03-12 10:30:56',NULL,'0','0','0',NULL),('a860674ea1584978a478c973633fe553','4beae09010714fba860989f8d26cf1d0','item_id','检查项目','varchar(64)','String','itemId','0','0','1','1','0','0','=','select','',NULL,'30','1','2018-03-12 15:09:25','1','2018-03-12 16:36:54',NULL,'0','0','0',NULL),('a9c0460ac63e496d859b22646fab0e30','778b701a91b64ea5b35c17fd63948436','tips','提示信息','varchar(100)','String','tips','0','1','1','1','0','0','=','input','',NULL,'140','1','2018-03-07 16:15:20','1','2018-03-07 16:15:20',NULL,'0','0','0',NULL),('ad3bf0d4b44b4528a5211a66af88f322','aef6f1fc948f4c9ab1c1b780bc471cc2','office_id','归属部门','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.Office','office.id|name','0','1','1','1','1','1','=','officeselect',NULL,NULL,'3','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('ad8d8a9cef1e47e3a277f21b46e516df','b9dcbd6f07b34b09a7de65921518d6a1','name','名称','varchar(50)','String','name','0','0','1','1','1','1','like','input','',NULL,'30','1','2018-03-06 13:14:05','1','2018-03-11 13:42:28',NULL,'0','0','0',NULL),('afb4f5824f8848f581d4170cd989a405','67146f87f0b847a5a855efe4e9077e40','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'80','1','2018-03-07 16:20:28','1','2018-03-07 16:20:28',NULL,'0','0','0',NULL),('b25a71d5ddb241c9a2e7837e6090b938','38ca93fc0d8f4fa08d622c0ecdeefa6d','remarks','具体描述','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'100','1','2018-03-07 16:23:20','1','2018-03-12 10:30:56',NULL,'0','0','0',NULL),('b2f8713761f74e648455af46dc8b48a0','6c9094e7e22b4aadb26da86e9b8cbaa3','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'50','1','2018-03-07 16:11:10','1','2018-03-07 16:11:10',NULL,'0','0','0',NULL),('b33b4e856c9a4692b13961eecbdeb797','74db589fc1e74881be178df82449d5ee','reference_flag','参考标识：0-否，1-是','char(1)','String','referenceFlag','0','0','1','1','0','0','=','input','',NULL,'90','1','2018-03-07 16:03:59','1','2018-03-07 16:03:59',NULL,'0','0','0',NULL),('b407063d3fab4650b62bbd3c1e2c5cf9','263df3b73ec844e89e6ce388e2ede14b','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'110','1','2018-03-07 16:26:03','1','2018-03-17 12:03:35',NULL,'0','0','0',NULL),('b465aa3c04f84c3aad7c38e9020d3c05','74db589fc1e74881be178df82449d5ee','owner','所属体检中心','varchar(64)','String','owner','0','1','1','1','0','0','=','input','',NULL,'100','1','2018-03-07 16:03:59','1','2018-03-07 16:03:59',NULL,'0','0','0',NULL),('b5d65ecb68cd402783c083df0880421d','3a4d8288c1ff4277b4beaed0ddad3301','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,'80','1','2018-03-07 15:57:22','1','2018-03-07 15:59:38',NULL,'0','0','0',NULL),('b6630779be72482c87f40a4178354a9e','85e80c76deba4aeb93da7b186077c44a','reference_flag','参考标识：0-否，1-是','char(1)','String','referenceFlag','0','1','1','1','0','0','=','input','',NULL,'100','1','2018-03-14 12:07:44','1','2018-03-14 12:07:44',NULL,'0','0','0',NULL),('b69dec91896e489a84a527b67cfe4a30','3a4d8288c1ff4277b4beaed0ddad3301','reference_flag','参考标识：0-否，1-是','char(1)','String','referenceFlag','0','0','1','1','0','0','=','input','',NULL,'100','1','2018-03-07 15:57:22','1','2018-03-07 15:59:38',NULL,'0','0','0',NULL),('b69e2f852b5846aca7d6bb7fbc7d0e8c','c657d573d06d48fd9e7c68bf8254674b','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,'100','1','2018-03-17 11:16:34','1','2018-03-17 11:16:34',NULL,'0','0','0',NULL),('b77075c6bc8e463589f5c097819a1112','1fc82bd23cb64af4bc5f5874b9148aa3','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'100','1','2018-03-07 16:24:52','1','2018-03-07 16:24:52',NULL,'0','0','0',NULL),('b778aa9101794741b5e09a1c445f41c1','6c9094e7e22b4aadb26da86e9b8cbaa3','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'40','1','2018-03-07 16:11:10','1','2018-03-07 16:11:10',NULL,'0','0','0',NULL),('b7ac4b1d9b6248a5aea7d1894a5680ce','7ea5e9edfc8f4eb293b9f7d54d19f4f3','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'140','1','2018-04-20 17:02:29','1','2018-04-20 17:02:29',NULL,'0','0','0',NULL),('b7b4bf5892c04610b9960ccf902b7f8b','c657d573d06d48fd9e7c68bf8254674b','user_id','体检用户','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','user.id|name','0','0','1','1','0','0','=','fk_sys_user','',NULL,'40','1','2018-03-17 11:16:34','1','2018-03-17 11:16:34',NULL,'0','0','0','/sys/office/treeData?type=3'),('b7e92c0b93c94fc8becc27699b94175f','5e8fb141d8f04235996da148395083ed','mobile_number','手机号码','varchar(45)','String','mobileNumber','0','1','1','1','0','0','=','input','',NULL,'130','1','2018-03-06 14:15:34','1','2018-03-06 14:15:34',NULL,'1','0','0',NULL),('b8ec1bccf59e4a34a93a80cdb8458b23','0f64808413ec40b4890b094920d9ed3c','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'70','1','2018-03-05 13:03:35','1','2018-03-05 14:14:52',NULL,'0','0','0',NULL),('b9393983f5084983bc0e0e8ed1bdb417','5e8fb141d8f04235996da148395083ed','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-06 14:15:33','1','2018-03-06 14:15:33',NULL,'1','0','0',NULL),('b96c1a1f856d456bb6a4481432be9e44','38e44531dea149a0a70219a175eb65cb','range_max','参考范围最大值','varchar(45)','String','rangeMax','0','1','1','1','1','0','=','input','',NULL,'150','1','2018-03-07 16:18:05','1','2018-03-07 16:18:05',NULL,'0','0','0',NULL),('badc51e2b7104d21badce5f4c3449294','1fc82bd23cb64af4bc5f5874b9148aa3','name','姓名','varchar(50)','String','name','0','0','1','1','1','1','like','input','',NULL,'30','1','2018-03-07 16:24:52','1','2018-03-07 16:24:52',NULL,'0','0','0',NULL),('bb1256a8d1b741f6936d8fed06f45eed','f6e4dafaa72f4c509636484715f33a96','update_by','更新者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input',NULL,NULL,'8','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('bb3e27c78dca4f769fbe0deb077b2833','4beae09010714fba860989f8d26cf1d0','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','0','0','0','=','input','',NULL,'70','1','2018-03-12 15:09:26','1','2018-03-12 16:36:54',NULL,'0','0','0',NULL),('bc9b35c59e084cc69ec79ff5c127a569','778b701a91b64ea5b35c17fd63948436','item_category_id','检查小类','varchar(64)','String','itemCategoryId','0','1','1','1','0','0','=','input','',NULL,'120','1','2018-03-07 16:15:20','1','2018-03-07 16:15:20',NULL,'0','0','0',NULL),('bcc7c7fb30174567ade2bbc98795405d','7313b302ac694a0f9639efaa0ad188d1','id','id','varchar(64)','String','id','0','1','1','0','0','0','=','input','',NULL,'10','1','2018-04-18 11:31:06','1','2018-04-18 11:31:06',NULL,'0','0','0',NULL),('bceb7e4f3f654368a6eb8a9d1f465142','6c9094e7e22b4aadb26da86e9b8cbaa3','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'60','1','2018-03-07 16:11:10','1','2018-03-07 16:11:10',NULL,'0','0','0',NULL),('bd956f146e6c47438a4856a49c7d6df3','b9dcbd6f07b34b09a7de65921518d6a1','code','编号','varchar(45)','String','code','0','0','1','1','1','1','like','input','',NULL,'20','1','2018-03-06 13:14:05','1','2018-03-11 13:42:28',NULL,'0','0','0',NULL),('bdfa137220614eeb8069e4d125052311','c657d573d06d48fd9e7c68bf8254674b','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'70','1','2018-03-17 11:16:34','1','2018-03-17 11:16:34',NULL,'0','0','0',NULL),('beb55815e6b64fbea6bc64339d338de0','165367ce1a75430da8729b0561adce25','owner','所属体检中心','varchar(64)','String','owner','0','1','1','0','0','0','=','input','',NULL,'130','1','2018-03-25 16:00:45','1','2018-03-25 16:13:40',NULL,'0','0','0',NULL),('bf127ec98a0549deac8115d98dc69c17','5e8fb141d8f04235996da148395083ed','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','0','0','=','dateselect','',NULL,'80','1','2018-03-06 14:15:33','1','2018-03-06 14:15:33',NULL,'1','0','0',NULL),('bfd43008788a4de9a2820d4cbf2c1988','263df3b73ec844e89e6ce388e2ede14b','name','姓名','varchar(50)','String','name','0','0','1','1','1','1','like','input','',NULL,'40','1','2018-03-07 16:26:02','1','2018-03-17 12:03:35',NULL,'0','0','0',NULL),('c0b206a1a20444a39ebb994a963d547a','4beae09010714fba860989f8d26cf1d0','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'60','1','2018-03-12 15:09:26','1','2018-03-12 16:36:54',NULL,'0','0','0',NULL),('c267025ee68547c5a7711940d97deb46','74db589fc1e74881be178df82449d5ee','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'60','1','2018-03-07 16:03:59','1','2018-03-07 16:03:59',NULL,'0','0','0',NULL),('c290fd4a8a83488b951013612a43cb7e','0c1a5cd70b104852b79102cb62270f52','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'120','1','2018-04-20 16:58:57','1','2018-04-20 16:58:57',NULL,'0','0','0',NULL),('c3a354f9f4fc486c882127fef8d0970f','263df3b73ec844e89e6ce388e2ede14b','code','编号','varchar(50)','String','code','0','0','1','1','0','1','=','input','',NULL,'30','1','2018-03-07 16:26:02','1','2018-03-17 12:03:35',NULL,'0','0','0',NULL),('c41b3ab77759453f9eb768c9c9951e46','8cc24412bbc4414a9ab589e7877028f9','remarks','具体描述','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'110','1','2018-03-07 16:19:26','1','2018-03-07 16:19:26',NULL,'1','0','0',NULL),('c4a221e65f43426ab3366bdee944ca5f','b9dcbd6f07b34b09a7de65921518d6a1','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'60','1','2018-03-06 13:14:06','1','2018-03-11 13:42:28',NULL,'0','0','0',NULL),('c4f62018248a47d59a08f0033e74116a','4beae09010714fba860989f8d26cf1d0','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-12 15:09:25','1','2018-03-12 16:36:54',NULL,'0','0','0',NULL),('c50304b46e9b4246a5a8a1ed954e55bc','0c1a5cd70b104852b79102cb62270f52','specimen_id','样本类型ID','varchar(128)','String','specimenId','0','1','1','1','0','0','=','input','',NULL,'20','1','2018-04-20 16:58:56','1','2018-04-20 16:58:56',NULL,'0','0','0',NULL),('c5c0ae36920d4c488be7e68256494eff','85e80c76deba4aeb93da7b186077c44a','name','名称','varchar(50)','String','name','0','0','1','1','1','1','like','input','',NULL,'30','1','2018-03-14 12:07:44','1','2018-03-14 12:07:44',NULL,'0','0','0',NULL),('c680b6620bca4361b4477539ee8c16d1','7ea5e9edfc8f4eb293b9f7d54d19f4f3','pack_id','批次id','varchar(64)','String','packId','0','1','1','1','0','0','=','input','',NULL,'40','1','2018-04-20 17:02:28','1','2018-04-20 17:02:28',NULL,'0','0','0',NULL),('c6c91884cdd644f4b7ab7a7f03cdf9ff','7003dd8eb3554a0ab99771fdd1464c74','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'60','1','2018-03-07 15:59:22','1','2018-03-12 12:24:06',NULL,'0','0','0',NULL),('c9291308de26401fb6b15691f52efbf3','1fc82bd23cb64af4bc5f5874b9148aa3','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-07 16:24:52','1','2018-03-07 16:24:52',NULL,'0','0','0',NULL),('ca68a2d403f0449cbaa1d54198c6f350','43d6d5acffa14c258340ce6765e46c6f','office_id','归属部门','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.Office','office.id|name','0','1','1','1','0','0','=','officeselect',NULL,NULL,'3','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('cb9c0ec3da26432d9cbac05ede0fd1d0','43d6d5acffa14c258340ce6765e46c6f','remarks','备注信息','nvarchar2(255)','String','remarks','0','1','1','1','1','0','=','textarea',NULL,NULL,'12','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('cbc07d2265c243bf838af1b99f0372ab','b9dcbd6f07b34b09a7de65921518d6a1','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'70','1','2018-03-06 13:14:06','1','2018-03-11 13:42:28',NULL,'0','0','0',NULL),('cd08d51fb30d4beda8aa3ba44d22cb04','fb90f165141648fe89fb2774ad2afbad','name','名称','varchar(50)','String','name','0','0','1','1','1','1','like','input','',NULL,'30','1','2018-03-07 16:09:00','1','2018-03-07 16:09:00',NULL,'0','0','0',NULL),('cd206c6143fe408eab85668aa36ecc0e','263df3b73ec844e89e6ce388e2ede14b','status','体检状态，对应examination_record_status字典','varchar(64)','String','status','0','1','1','1','0','0','=','select','examination_record_status',NULL,'210','1','2018-03-17 11:20:22','1','2018-03-17 12:03:35',NULL,'0','0','0',NULL),('cf529cfdb8de4edfae51da29043d5930','0c1a5cd70b104852b79102cb62270f52','remarks','备注信息','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'110','1','2018-04-20 16:58:57','1','2018-04-20 16:58:57',NULL,'0','0','0',NULL),('cfcfa06ea61749c9b4c4dbc507e0e580','f6e4dafaa72f4c509636484715f33a96','id','编号','varchar2(64)','String','id','1','0','1','0','0','0','=','input',NULL,NULL,'1','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('d0abf26bfdca40fc92cbb221bc0480fd','3a4d8288c1ff4277b4beaed0ddad3301','owner','所属体检中心','varchar(64)','String','owner','0','1','1','1','0','0','=','input','',NULL,'110','1','2018-03-07 15:57:22','1','2018-03-07 15:59:38',NULL,'0','0','0',NULL),('d0c5e0c1b9204ad6a84c4a48f260f841','7ea5e9edfc8f4eb293b9f7d54d19f4f3','remarks','备注信息','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'130','1','2018-04-20 17:02:29','1','2018-04-20 17:02:29',NULL,'0','0','0',NULL),('d1d3395d7389427895089f9cbe1b11e5','c657d573d06d48fd9e7c68bf8254674b','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'60','1','2018-03-17 11:16:34','1','2018-03-17 11:16:34',NULL,'0','0','0',NULL),('d3bccf699f944badab077ddb124a21b6','0ef5b1fbbf594e32ac90c2524935eb15','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'70','1','2018-03-06 13:46:01','1','2018-03-11 13:42:45',NULL,'0','0','0',NULL),('d4b931fbba764d0d873c502002433be5','0f64808413ec40b4890b094920d9ed3c','remarks','备注信息','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'100','1','2018-03-05 13:03:35','1','2018-03-05 14:14:52',NULL,'0','0','0',NULL),('d5c2d932ae904aa8a9f9ef34cd36fb0b','43d6d5acffa14c258340ce6765e46c6f','sex','性别','char(1)','String','sex','0','1','1','1','0','1','=','select','sex',NULL,'6','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('d7275267c20f44fd8d3711d3bd029b61','5e8fb141d8f04235996da148395083ed','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'60','1','2018-03-06 14:15:33','1','2018-03-06 14:15:33',NULL,'1','0','0',NULL),('d93a4f3f582a4788a20b11a8bece9b18','7ea5e9edfc8f4eb293b9f7d54d19f4f3','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'100','1','2018-04-20 17:02:29','1','2018-04-20 17:02:29',NULL,'0','0','0',NULL),('d9700df921b24be98672fe6195260184','a98828fcd5844036b3bd6203a5c2a15d','noid','noid','char(32)','String','noid','1','0','1','1','0','0','=','input','',NULL,'10','1','2018-03-19 18:47:50','1','2018-03-19 18:47:50',NULL,'0','0','0',NULL),('d9e260363a7e4bd6b49f1c653ecb6449','1fc82bd23cb64af4bc5f5874b9148aa3','remarks','备注','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'150','1','2018-03-07 16:24:53','1','2018-03-07 16:24:53',NULL,'0','0','0',NULL),('dad973735423470cb9d6dc4105d19f16','5e8fb141d8f04235996da148395083ed','address','地址','varchar(200)','String','address','0','1','1','1','0','1','=','input','',NULL,'140','1','2018-03-06 14:15:34','1','2018-03-06 14:15:34',NULL,'1','0','0',NULL),('db113743c77140319e33637f0766d1ed','1fc82bd23cb64af4bc5f5874b9148aa3','owner','所属体检中心','varchar(64)','String','owner','0','1','1','1','0','0','=','input','',NULL,'160','1','2018-03-07 16:24:53','1','2018-03-07 16:24:53',NULL,'0','0','0',NULL),('dbb9e03fbc5844e3a914cd12f27b93e3','263df3b73ec844e89e6ce388e2ede14b','birthday','出生日期','varchar(10)','String','birthday','0','0','1','1','0','0','=','input','',NULL,'90','1','2018-03-07 16:26:03','1','2018-03-17 12:03:35',NULL,'0','0','0',NULL),('de654468b44f4e8eb7bfe053bc3c96c8','1fc82bd23cb64af4bc5f5874b9148aa3','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'120','1','2018-03-07 16:24:53','1','2018-03-07 16:24:53',NULL,'0','0','0',NULL),('e06177e0e132412ea58e540a52961b8d','5ccbcfb5e27348c4826ed976bbd1cc56','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'60','1','2018-03-03 00:29:13','1','2018-03-03 00:29:13',NULL,'1','0','0',NULL),('e2698cf8b40e4f1c8c21fe5a460062a9','74db589fc1e74881be178df82449d5ee','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-07 16:03:59','1','2018-03-07 16:03:59',NULL,'0','0','0',NULL),('e472aba97d0440ac8495dd04da650910','165367ce1a75430da8729b0561adce25','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','1','1','=','dateselect','',NULL,'90','1','2018-03-25 16:00:45','1','2018-03-25 16:13:40',NULL,'0','0','0',NULL),('e5e4f35115ea46d59b1469e38b55240e','7003dd8eb3554a0ab99771fdd1464c74','owner','所属体检中心','varchar(64)','String','owner','0','1','1','1','0','0','=','input','',NULL,'100','1','2018-03-12 12:24:07','1','2018-03-12 12:24:07',NULL,'0','0','0',NULL),('e64050a2ebf041faa16f12dda5dcf784','6e05c389f3c6415ea34e55e9dfb28934','name','名称','nvarchar2(100)','String','name','0','1','1','1','1','1','like','input',NULL,NULL,'3','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('e69b3cd5cc1441a1b668c0726d9e54be','5ccbcfb5e27348c4826ed976bbd1cc56','id','编号','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-03 00:29:13','1','2018-03-03 00:29:13',NULL,'1','0','0',NULL),('e6b9c9700b5c40838fc472fb741aaf02','263df3b73ec844e89e6ce388e2ede14b','sex','性别','varchar(64)','String','sex','0','0','1','1','1','0','=','select','sex',NULL,'60','1','2018-03-07 16:26:02','1','2018-03-17 12:03:35',NULL,'0','0','0',NULL),('e780e12c3bd14f1b9ecae5deaca7f90a','4beae09010714fba860989f8d26cf1d0','package_id','检查套餐','varchar(64)','String','examinationPackage.id','0','0','1','1','0','0','=','input','',NULL,'20','1','2018-03-12 15:09:25','1','2018-03-12 16:36:54',NULL,'0','0','0',NULL),('e8cc5a90024646aba6387fcb90fbf17a','b9dcbd6f07b34b09a7de65921518d6a1','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-06 13:14:05','1','2018-03-11 13:42:28',NULL,'0','0','0',NULL),('e8d11127952d4aa288bb3901fc83127f','43d6d5acffa14c258340ce6765e46c6f','del_flag','删除标记（0：正常；1：删除）','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'13','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('e98fc5ccc7104bf2811d15dd12d16d5c','67146f87f0b847a5a855efe4e9077e40','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-07 16:20:28','1','2018-03-07 16:20:28',NULL,'0','0','0',NULL),('e9fbb46d6f7949779f41d199c4ce78d2','b9dcbd6f07b34b09a7de65921518d6a1','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'40','1','2018-03-06 13:14:05','1','2018-03-11 13:42:28',NULL,'0','0','0',NULL),('ea89adadff7d414bbd979a8544ce34f6','5ccbcfb5e27348c4826ed976bbd1cc56','title','标题','varchar(128)','String','title','0','1','1','1','1','1','like','input','',NULL,'20','1','2018-03-03 00:29:13','1','2018-03-03 00:29:13',NULL,'1','0','0',NULL),('eb2e5afd13f147a990d30e68e7f64e12','aef6f1fc948f4c9ab1c1b780bc471cc2','update_date','更新时间','timestamp(6)','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect',NULL,NULL,'11','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('ec4c4ce73fd34bcda9aa4de59490d74a','5e8fb141d8f04235996da148395083ed','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'40','1','2018-03-06 14:15:33','1','2018-03-06 14:15:33',NULL,'1','0','0',NULL),('ec6982d7c117423d81e640ea5e00f300','8cc24412bbc4414a9ab589e7877028f9','default_flag','是否默认：0-否，1-是','char(1)','String','defaultFlag','0','0','1','1','0','0','=','input','',NULL,'50','1','2018-03-07 16:19:26','1','2018-03-07 16:19:26',NULL,'1','0','0',NULL),('ef59c79bc66a4e308585221cb67ae3f2','778b701a91b64ea5b35c17fd63948436','remarks','备注','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'90','1','2018-03-07 16:15:20','1','2018-03-07 16:15:20',NULL,'0','0','0',NULL),('ef70d0f10144407fb70863dc57479138','85e80c76deba4aeb93da7b186077c44a','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,'80','1','2018-03-14 12:07:44','1','2018-03-14 12:07:44',NULL,'0','0','0',NULL),('f076b87dad5f4e4f8275e2215f0f64dc','b9dcbd6f07b34b09a7de65921518d6a1','reference_flag','参考标识：0-否，1-是','char(1)','String','referenceFlag','0','1','1','1','0','0','=','input','',NULL,'100','1','2018-03-11 13:42:01','1','2018-03-11 13:42:28',NULL,'0','0','0',NULL),('f0d18d65656a48918679835baa262d26','7ea5e9edfc8f4eb293b9f7d54d19f4f3','is_used','是否使用，0未使用 1已使用','char(1)','String','isUsed','0','0','1','1','0','0','=','input','',NULL,'60','1','2018-04-20 17:02:28','1','2018-04-20 17:02:28',NULL,'0','0','0',NULL),('f1cba09a57ce4afda68997dfd497ae8c','0f64808413ec40b4890b094920d9ed3c','title','标题','varchar(128)','String','title','0','0','1','1','1','1','like','input','',NULL,'20','1','2018-03-05 13:03:35','1','2018-03-05 14:14:52',NULL,'0','0','0',NULL),('f1d8ac118cad461893074b906946624a','3a4d8288c1ff4277b4beaed0ddad3301','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'40','1','2018-03-07 15:57:22','1','2018-03-07 15:59:38',NULL,'0','0','0',NULL),('f33509fda8a541a9a4aba686346ef41e','1fc82bd23cb64af4bc5f5874b9148aa3','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'110','1','2018-03-07 16:24:53','1','2018-03-07 16:24:53',NULL,'0','0','0',NULL),('f35f123bbc54444fb5ee24f82cc96c39','263df3b73ec844e89e6ce388e2ede14b','id_number','身份证号','varchar(20)','String','idNumber','0','1','1','1','0','0','=','input','',NULL,'200','1','2018-03-17 11:20:22','1','2018-03-17 12:03:35',NULL,'0','0','0',NULL),('f53a2754bb0d4178bd1d9638a1e9cf67','c657d573d06d48fd9e7c68bf8254674b','result_dict_id','体检结果','varchar(64)','String','resultDictId','0','0','1','1','0','0','=','input','',NULL,'50','1','2018-03-17 11:16:34','1','2018-03-17 11:16:34',NULL,'0','0','0',NULL),('f55443b31606438687a74fdcd4b430a8','74db589fc1e74881be178df82449d5ee','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'30','1','2018-03-07 16:03:59','1','2018-03-07 16:03:59',NULL,'0','0','0',NULL),('f5b3a1e08a07496481e94e9afe525523','1fc82bd23cb64af4bc5f5874b9148aa3','organ_id','单位','varchar(64)','String','organId','0','0','1','1','1','1','=','officeselect','',NULL,'90','1','2018-03-07 16:24:52','1','2018-03-07 16:24:52',NULL,'0','0','0',NULL),('f5ed8c82bad0413fbfcccefa95931358','f6e4dafaa72f4c509636484715f33a96','remarks','备注信息','nvarchar2(255)','String','remarks','0','1','1','1','1','0','=','textarea',NULL,NULL,'10','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('f6374a6318c743cea53251518e5c721b','5e8fb141d8f04235996da148395083ed','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'50','1','2018-03-06 14:15:33','1','2018-03-06 14:15:33',NULL,'1','0','0',NULL),('f70d580dc23b4f9ca5092c1f5935a1dc','0ef5b1fbbf594e32ac90c2524935eb15','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'50','1','2018-03-06 13:46:01','1','2018-03-11 13:42:45',NULL,'0','0','0',NULL),('f747ad8f36944f2d801790edf6d617f6','778b701a91b64ea5b35c17fd63948436','examination_dept_id','检查部门','varchar(64)','String','examinationDeptId','0','1','1','1','0','0','=','input','',NULL,'130','1','2018-03-07 16:15:20','1','2018-03-07 16:15:20',NULL,'0','0','0',NULL),('f79bf80ad96e44438488456af4596a35','5ccbcfb5e27348c4826ed976bbd1cc56','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','1','=','input','',NULL,'50','1','2018-03-03 00:29:13','1','2018-03-03 00:29:13',NULL,'1','0','0',NULL),('f82714e2159c45cc9bed6cc03074dc68','7003dd8eb3554a0ab99771fdd1464c74','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'30','1','2018-03-07 15:59:22','1','2018-03-12 12:24:06',NULL,'0','0','0',NULL),('f94bdc5538214238a02c0edcc5491f6f','67146f87f0b847a5a855efe4e9077e40','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'60','1','2018-03-07 16:20:28','1','2018-03-07 16:20:28',NULL,'0','0','0',NULL),('faa7026664384fe2902b68ff8b0b61b7','1fc82bd23cb64af4bc5f5874b9148aa3','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,'140','1','2018-03-07 16:24:53','1','2018-03-07 16:24:53',NULL,'0','0','0',NULL),('fc295eedbf30439e8d1820b9fcf9b8ee','165367ce1a75430da8729b0561adce25','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-25 16:00:45','1','2018-03-25 16:13:40',NULL,'0','0','0',NULL),('fe2ced04e28946a5a4449ec26f34160a','85e80c76deba4aeb93da7b186077c44a','remarks','备注','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'90','1','2018-03-14 12:07:44','1','2018-03-14 12:07:44',NULL,'0','0','0',NULL),('fe4758f2f3044f96a1d3ab572cb3af75','0ef5b1fbbf594e32ac90c2524935eb15','remarks','备注','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'90','1','2018-03-06 14:11:50','1','2018-03-11 13:42:45',NULL,'0','0','0',NULL),('ff26417aceea4dfa9b0be62da2ccd594','3a4d8288c1ff4277b4beaed0ddad3301','name','名称','varchar(50)','String','name','0','0','1','1','1','1','like','input','',NULL,'30','1','2018-03-07 15:57:22','1','2018-03-07 15:59:38',NULL,'0','0','0',NULL),('ff339d68f5ba47af90b3f268cbc7e6b3','0c1a5cd70b104852b79102cb62270f52','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'90','1','2018-04-20 16:58:56','1','2018-04-20 16:58:56',NULL,'0','0','0',NULL);

/*Table structure for table `gen_template` */

DROP TABLE IF EXISTS `gen_template`;

CREATE TABLE `gen_template` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `category` varchar(2000) DEFAULT NULL COMMENT '分类',
  `file_path` varchar(500) DEFAULT NULL COMMENT '生成文件路径',
  `file_name` varchar(200) DEFAULT NULL COMMENT '生成文件名',
  `content` text COMMENT '内容',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_template_del_falg` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代码模板表';

/*Data for the table `gen_template` */

/*Table structure for table `oa_leave` */

DROP TABLE IF EXISTS `oa_leave`;

CREATE TABLE `oa_leave` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `process_instance_id` varchar(64) DEFAULT NULL COMMENT '流程实例编号',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `leave_type` varchar(20) DEFAULT NULL COMMENT '请假类型',
  `reason` varchar(255) DEFAULT NULL COMMENT '请假理由',
  `apply_time` datetime DEFAULT NULL COMMENT '申请时间',
  `reality_start_time` datetime DEFAULT NULL COMMENT '实际开始时间',
  `reality_end_time` datetime DEFAULT NULL COMMENT '实际结束时间',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `oa_leave_create_by` (`create_by`),
  KEY `oa_leave_process_instance_id` (`process_instance_id`),
  KEY `oa_leave_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='请假流程表';

/*Data for the table `oa_leave` */

/*Table structure for table `oa_notify` */

DROP TABLE IF EXISTS `oa_notify`;

CREATE TABLE `oa_notify` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `type` char(1) DEFAULT NULL COMMENT '类型',
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `content` varchar(2000) DEFAULT NULL COMMENT '内容',
  `files` varchar(2000) DEFAULT NULL COMMENT '附件',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `oa_notify_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知通告';

/*Data for the table `oa_notify` */

insert  into `oa_notify`(`id`,`type`,`title`,`content`,`files`,`status`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('d953377b907b4caeb956509b6b23278c','2','好吧','速度快建安费\r\n卡三等奖发\r\n卡三等奖','','1','1','2018-03-03 11:19:28','1','2018-03-03 11:19:48',NULL,'0'),('f468177e62144f2989cace097aa63a5c','1','今天要开会','迷你改天必须来。\r\n快点结束吧。','','1','1','2018-03-03 09:56:00','1','2018-03-03 09:56:00',NULL,'0');

/*Table structure for table `oa_notify_record` */

DROP TABLE IF EXISTS `oa_notify_record`;

CREATE TABLE `oa_notify_record` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `oa_notify_id` varchar(64) DEFAULT NULL COMMENT '通知通告ID',
  `user_id` varchar(64) DEFAULT NULL COMMENT '接受人',
  `read_flag` char(1) DEFAULT '0' COMMENT '阅读标记',
  `read_date` date DEFAULT NULL COMMENT '阅读时间',
  PRIMARY KEY (`id`),
  KEY `oa_notify_record_notify_id` (`oa_notify_id`),
  KEY `oa_notify_record_user_id` (`user_id`),
  KEY `oa_notify_record_read_flag` (`read_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知通告发送记录';

/*Data for the table `oa_notify_record` */

insert  into `oa_notify_record`(`id`,`oa_notify_id`,`user_id`,`read_flag`,`read_date`) values ('059f4b68c5ee4902b1c739ca4ac9a0b6','f468177e62144f2989cace097aa63a5c','9','0',NULL),('06aace7c3783456e8561700f3ed6e4eb','f468177e62144f2989cace097aa63a5c','10','0',NULL),('0fc08b2f69b744c1ad9415b371eb1922','d953377b907b4caeb956509b6b23278c','6','0',NULL),('10c5d97cfc624ffbba0ec399353be1c3','f468177e62144f2989cace097aa63a5c','11','0',NULL),('2e7c30554d8b47379147507a17d1b3d5','d953377b907b4caeb956509b6b23278c','13','0',NULL),('2eef72896f4c40b3b52c5204975c3112','f468177e62144f2989cace097aa63a5c','13','0',NULL),('56fc50cd25a04ed5a74660e3283cd5cf','d953377b907b4caeb956509b6b23278c','5','0',NULL),('6c33207612bf4ada92801369b6c07dbb','d953377b907b4caeb956509b6b23278c','9','0',NULL),('77008f0dbdf042c98b6c1d038dbe6f3a','f468177e62144f2989cace097aa63a5c','4','0',NULL),('78c5a481afca4d979933cd0fbda374f8','f468177e62144f2989cace097aa63a5c','2','0',NULL),('79848b62312d488fba1872005bfff8a8','f468177e62144f2989cace097aa63a5c','3','0',NULL),('7c9a8152e8c141aa8ba305a9a64458e6','d953377b907b4caeb956509b6b23278c','10','0',NULL),('80741bf482a2493e95e2dfc5994512ed','f468177e62144f2989cace097aa63a5c','12','0',NULL),('89294e0dbb204f7284bcb8c2c71ef7b4','d953377b907b4caeb956509b6b23278c','12','0',NULL),('8edd88336e54420cbe95c94b5fa43920','f468177e62144f2989cace097aa63a5c','6','0',NULL),('94a1378fd70c4055a1acbfa1e4a3aa0f','d953377b907b4caeb956509b6b23278c','1','1','2018-03-03'),('acd7af1cbfef4971a1855d89b310b3d4','f468177e62144f2989cace097aa63a5c','8','0',NULL),('b2b70d0eefbe4ed9b4346a15e47794a6','f468177e62144f2989cace097aa63a5c','5','0',NULL),('b3d90fa81a1e49fea79a0e2dfc7c5a51','f468177e62144f2989cace097aa63a5c','7','0',NULL),('b6c4975eee014d0eada97cf4020a2357','d953377b907b4caeb956509b6b23278c','4','0',NULL),('b7e682e8174b43939f0a48be7f27511f','d953377b907b4caeb956509b6b23278c','8','0',NULL),('bd7946bf2ec84e0a93b85518827e1fca','d953377b907b4caeb956509b6b23278c','2','0',NULL),('c21a9dcd327746e780b5628c1c29a11d','d953377b907b4caeb956509b6b23278c','3','0',NULL),('db3b8fde7bd449e5ae097417da901581','f468177e62144f2989cace097aa63a5c','1','1','2018-03-03'),('e135ff9dfbf64a66985cc2cfab091b93','d953377b907b4caeb956509b6b23278c','7','0',NULL),('e40846456ed74480831d1e0448b1284a','d953377b907b4caeb956509b6b23278c','11','0',NULL);

/*Table structure for table `oa_test_audit` */

DROP TABLE IF EXISTS `oa_test_audit`;

CREATE TABLE `oa_test_audit` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `PROC_INS_ID` varchar(64) DEFAULT NULL COMMENT '流程实例ID',
  `USER_ID` varchar(64) DEFAULT NULL COMMENT '变动用户',
  `OFFICE_ID` varchar(64) DEFAULT NULL COMMENT '归属部门',
  `POST` varchar(255) DEFAULT NULL COMMENT '岗位',
  `AGE` char(1) DEFAULT NULL COMMENT '性别',
  `EDU` varchar(255) DEFAULT NULL COMMENT '学历',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '调整原因',
  `OLDA` varchar(255) DEFAULT NULL COMMENT '现行标准 薪酬档级',
  `OLDB` varchar(255) DEFAULT NULL COMMENT '现行标准 月工资额',
  `OLDC` varchar(255) DEFAULT NULL COMMENT '现行标准 年薪总额',
  `NEWA` varchar(255) DEFAULT NULL COMMENT '调整后标准 薪酬档级',
  `NEWB` varchar(255) DEFAULT NULL COMMENT '调整后标准 月工资额',
  `NEWC` varchar(255) DEFAULT NULL COMMENT '调整后标准 年薪总额',
  `ADD_NUM` varchar(255) DEFAULT NULL COMMENT '月增资',
  `EXE_DATE` varchar(255) DEFAULT NULL COMMENT '执行时间',
  `HR_TEXT` varchar(255) DEFAULT NULL COMMENT '人力资源部门意见',
  `LEAD_TEXT` varchar(255) DEFAULT NULL COMMENT '分管领导意见',
  `MAIN_LEAD_TEXT` varchar(255) DEFAULT NULL COMMENT '集团主要领导意见',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `OA_TEST_AUDIT_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='审批流程测试表';

/*Data for the table `oa_test_audit` */

/*Table structure for table `sequence_define` */

DROP TABLE IF EXISTS `sequence_define`;

CREATE TABLE `sequence_define` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `class_name` varchar(64) NOT NULL COMMENT '类名',
  `method_name` varchar(64) NOT NULL COMMENT '方法名',
  `ann_express` varchar(64) NOT NULL COMMENT '注解上默认的表达式，只读',
  `custom_express` varchar(64) NOT NULL COMMENT '自定义的表达式',
  `ann_describe` varchar(64) NOT NULL COMMENT '编号描述，只读',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sequence_define_class_method` (`class_name`,`method_name`),
  UNIQUE KEY `sequence_define_ann_express` (`ann_express`),
  UNIQUE KEY `sequence_define_custom_express` (`custom_express`),
  KEY `sequence_define_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='序列表';

/*Data for the table `sequence_define` */

/*Table structure for table `sys_area` */

DROP TABLE IF EXISTS `sys_area`;

CREATE TABLE `sys_area` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `type` char(1) DEFAULT NULL COMMENT '区域类型',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `default_record` char(1) NOT NULL DEFAULT '0' COMMENT '系统默认记录，不可删除。不可修改',
  PRIMARY KEY (`id`),
  KEY `sys_area_parent_id` (`parent_id`),
  KEY `sys_area_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域表';

/*Data for the table `sys_area` */

insert  into `sys_area`(`id`,`parent_id`,`parent_ids`,`name`,`sort`,`code`,`type`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`,`default_record`) values ('1','0','0,','中国','10','100000','1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('6ac2c7dec6754eb0a992d089a8176375','ff194b1d2f404810a45001f836a6348d','0,1,8cc21c3cd6564faca50bafb92424926b,ff194b1d2f404810a45001f836a6348d,','桥西区','30','050051','4','1','2018-04-18 09:56:30','1','2018-04-18 09:56:30','','0','0'),('8cc21c3cd6564faca50bafb92424926b','1','0,1,','河北省','30','130000','2','1','2018-03-07 17:06:30','1','2018-03-07 17:06:30','','0','1'),('ff194b1d2f404810a45001f836a6348d','8cc21c3cd6564faca50bafb92424926b','0,1,8cc21c3cd6564faca50bafb92424926b,','石家庄市','30','130100','3','1','2018-03-07 17:09:07','1','2018-03-07 17:09:07','','0','1');

/*Table structure for table `sys_dict` */

DROP TABLE IF EXISTS `sys_dict`;

CREATE TABLE `sys_dict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `value` varchar(100) NOT NULL COMMENT '数据值',
  `label` varchar(100) NOT NULL COMMENT '标签名',
  `type` varchar(100) NOT NULL COMMENT '类型',
  `description` varchar(100) NOT NULL COMMENT '描述',
  `sort` decimal(10,0) NOT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) DEFAULT '0' COMMENT '父级编号',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `default_record` char(1) NOT NULL DEFAULT '0' COMMENT '系统记录，不可删除，值不可修改',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`label`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';

/*Data for the table `sys_dict` */

insert  into `sys_dict`(`id`,`value`,`label`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`,`default_record`) values ('1','0','正常','del_flag','删除标记','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('10','yellow','黄色','color','颜色值','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('100','java.util.Date','Date','gen_java_type','Java类型\0\0','50','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('101','com.thinkgem.jeesite.modules.sys.entity.User','User','gen_java_type','Java类型\0\0','60','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('102','com.thinkgem.jeesite.modules.sys.entity.Office','Office','gen_java_type','Java类型\0\0','70','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('103','com.thinkgem.jeesite.modules.sys.entity.Area','Area','gen_java_type','Java类型\0\0','80','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('104','Custom','Custom','gen_java_type','Java类型\0\0','90','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('105','1','会议通告\0\0\0\0','oa_notify_type','通知通告类型','10','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0','1'),('106','2','奖惩通告\0\0\0\0','oa_notify_type','通知通告类型','20','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0','1'),('107','3','活动通告\0\0\0\0','oa_notify_type','通知通告类型','30','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0','1'),('108','0','草稿','oa_notify_status','通知通告状态','10','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0','1'),('109','1','发布','oa_notify_status','通知通告状态','20','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0','1'),('11','orange','橙色','color','颜色值','50','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('110','0','未读','oa_notify_read','通知通告状态','10','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0','1'),('110eda8532bd44c1b1c55e380134eb41','40','初检合格可制证','examination_record_status','初检合格可制证','5','0','1','2018-04-14 17:59:27','1','2018-04-20 12:47:09','','0','1'),('111','1','已读','oa_notify_read','通知通告状态','20','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0','1'),('12','default','默认主题','theme','主题方案','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('13','cerulean','天蓝主题','theme','主题方案','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('14','readable','橙色主题','theme','主题方案','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('15','united','红色主题','theme','主题方案','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('16','flat','Flat主题','theme','主题方案','60','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('17','1','国家','sys_area_type','区域类型','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('18','2','省份、直辖市','sys_area_type','区域类型','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('19','3','地市','sys_area_type','区域类型','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('1f1bb10d0c484586804905fe6e5df940','30','复检不合格','examination_record_status','复检不合格','4','0','1','2018-04-14 17:59:03','1','2018-04-20 12:49:55','','0','1'),('2','1','删除','del_flag','删除标记','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('20','4','区县','sys_area_type','区域类型','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('21','1','公司','sys_office_type','机构类型','60','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('22','2','部门','sys_office_type','机构类型','70','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('23','3','小组','sys_office_type','机构类型','80','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('24','4','其它','sys_office_type','机构类型','90','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('25','1','综合部','sys_office_common','快捷通用部门','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('26','2','开发部','sys_office_common','快捷通用部门','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('27','3','人力部','sys_office_common','快捷通用部门','50','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('28','1','一级','sys_office_grade','机构等级','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('29','2','二级','sys_office_grade','机构等级','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('3','1','显示','show_hide','显示/隐藏','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('30','3','三级','sys_office_grade','机构等级','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('31','4','四级','sys_office_grade','机构等级','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('32','1','所有数据','sys_data_scope','数据范围','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('33','2','所在公司及以下数据','sys_data_scope','数据范围','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('34','3','所在公司数据','sys_data_scope','数据范围','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('35','4','所在部门及以下数据','sys_data_scope','数据范围','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('36','5','所在部门数据','sys_data_scope','数据范围','50','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('37','8','仅本人数据','sys_data_scope','数据范围','90','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('38','9','按明细设置','sys_data_scope','数据范围','100','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('39','1','系统管理','sys_user_type','用户类型','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('4','0','隐藏','show_hide','显示/隐藏','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('40','2','部门经理','sys_user_type','用户类型','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('41','3','普通用户','sys_user_type','用户类型','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('42','basic','基础主题','cms_theme','站点主题','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('43','blue','蓝色主题','cms_theme','站点主题','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1','1'),('44','red','红色主题','cms_theme','站点主题','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1','1'),('45','article','文章模型','cms_module','栏目模型','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('46','picture','图片模型','cms_module','栏目模型','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1','1'),('47','download','下载模型','cms_module','栏目模型','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1','1'),('48','link','链接模型','cms_module','栏目模型','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('49','special','专题模型','cms_module','栏目模型','50','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1','1'),('5','1','是','yes_no','是/否','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('50','0','默认展现方式','cms_show_modes','展现方式','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('5048f50a293e4218b1988e953d7e4aa7','20','初检不合格','examination_record_status','体检状态','3','0','1','2018-03-13 11:24:35','1','2018-04-20 12:45:47','','0','1'),('51','1','首栏目内容列表','cms_show_modes','展现方式','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('52','2','栏目第一条内容','cms_show_modes','展现方式','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('53','0','发布','cms_del_flag','内容状态','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('54','1','删除','cms_del_flag','内容状态','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('55','2','审核','cms_del_flag','内容状态','15','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('56','1','首页焦点图','cms_posid','推荐位','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('57','2','栏目页文章推荐','cms_posid','推荐位','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('57849b0370ee4d4589dc3b34da97de15','50','已制证','examination_record_status','已制证','10','0','1','2018-04-14 17:59:43','1','2018-04-14 17:59:43','','0','1'),('58','1','咨询','cms_guestbook','留言板分类','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('59','2','建议','cms_guestbook','留言板分类','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('6','0','否','yes_no','是/否','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('60','3','投诉','cms_guestbook','留言板分类','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('61','4','其它','cms_guestbook','留言板分类','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('62','1','公休','oa_leave_type','请假类型','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('63','2','病假','oa_leave_type','请假类型','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('64','3','事假','oa_leave_type','请假类型','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('65','4','调休','oa_leave_type','请假类型','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('66','5','婚假','oa_leave_type','请假类型','60','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('67','1','接入日志','sys_log_type','日志类型','30','0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0','1'),('68','2','异常日志','sys_log_type','日志类型','40','0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0','1'),('69','leave','请假流程','act_type','流程类型','10','0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0','1'),('6e7995624b0c49f584c29f23afe9e9db','10','未体检完','examination_record_status','体检状态','2','0','1','2018-03-13 11:24:17','1','2018-04-14 17:58:14','','0','1'),('7','red','红色','color','颜色值','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('70','test_audit','审批测试流程','act_type','流程类型','20','0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0','1'),('71','1','分类1','act_category','流程分类','10','0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0','1'),('71e164665d834b40a7b53c8ca3be7ac3','45','复检合格可制卡','examination_record_status','复检合格可制证','6','0','1','2018-04-20 12:46:44','1','2018-04-20 12:47:22','','0','1'),('72','2','分类2','act_category','流程分类','20','0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0','1'),('73','crud','增删改查','gen_category','代码生成分类','10','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('74','crud_many','增删改查（包含从表）','gen_category','代码生成分类','20','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('75','tree','树结构','gen_category','代码生成分类','30','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('76','=','=','gen_query_type','查询方式','10','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('77','!=','!=','gen_query_type','查询方式','20','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('78','&gt;','&gt;','gen_query_type','查询方式','30','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('79','&lt;','&lt;','gen_query_type','查询方式','40','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('8','green','绿色','color','颜色值','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('80','between','Between','gen_query_type','查询方式','50','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('81','like','Like','gen_query_type','查询方式','60','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('82','left_like','Left Like','gen_query_type','查询方式','70','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('83','right_like','Right Like','gen_query_type','查询方式','80','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('84','input','文本框','gen_show_type','字段生成方案','10','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('85','textarea','文本域','gen_show_type','字段生成方案','20','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('86','select','下拉框','gen_show_type','字段生成方案','30','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('87','checkbox','复选框','gen_show_type','字段生成方案','40','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('88','radiobox','单选框','gen_show_type','字段生成方案','50','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('89','dateselect','日期选择','gen_show_type','字段生成方案','60','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('9','blue','蓝色','color','颜色值','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('90','userselect','人员选择\0','gen_show_type','字段生成方案','70','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('91','officeselect','部门选择','gen_show_type','字段生成方案','80','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('92','areaselect','区域选择','gen_show_type','字段生成方案','90','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('93','String','String','gen_java_type','Java类型','10','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('94','Long','Long','gen_java_type','Java类型','20','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('95','dao','仅持久层','gen_category','代码生成分类\0\0\0\0\0\0','40','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('96','1','男','sex','性别','10','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'0','1'),('97','2','女','sex','性别','20','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'0','1'),('98','Integer','Integer','gen_java_type','Java类型\0\0','30','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('99','Double','Double','gen_java_type','Java类型\0\0','40','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('f24ac6e8515f42b3855bfcb463956b49','0','未体检','examination_record_status','体检状态','1','0','1','2018-04-18 20:09:11','1','2018-04-18 20:09:39','','0','1'),('f92ccb9da1a24f70ad77f95364a1252d','0','未体检','examination_record_status','体检状态','1','0','1','2018-03-13 11:23:48','1','2018-04-14 17:57:19','','1','1');

/*Table structure for table `sys_log` */

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `type` char(1) DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) DEFAULT '' COMMENT '日志标题',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `remote_addr` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(255) DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `method` varchar(5) DEFAULT NULL COMMENT '操作方式',
  `params` text COMMENT '操作提交的数据',
  `exception` text COMMENT '异常信息',
  PRIMARY KEY (`id`),
  KEY `sys_log_create_by` (`create_by`),
  KEY `sys_log_request_uri` (`request_uri`),
  KEY `sys_log_type` (`type`),
  KEY `sys_log_create_date` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志表';

/*Data for the table `sys_log` */

/*Table structure for table `sys_mdict` */

DROP TABLE IF EXISTS `sys_mdict`;

CREATE TABLE `sys_mdict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_mdict_parent_id` (`parent_id`),
  KEY `sys_mdict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='多级字典表';

/*Data for the table `sys_mdict` */

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `href` varchar(2000) DEFAULT NULL COMMENT '链接',
  `target` varchar(20) DEFAULT NULL COMMENT '目标',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `is_show` char(1) NOT NULL COMMENT '是否在菜单中显示',
  `permission` varchar(200) DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_menu_parent_id` (`parent_id`),
  KEY `sys_menu_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`id`,`parent_id`,`parent_ids`,`name`,`sort`,`href`,`target`,`icon`,`is_show`,`permission`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('053d3ddee6f048f69a3e8b73b41787a5','1efc52de37db406ba9be7dd3f06859b7','0,1,1efc52de37db406ba9be7dd3f06859b7,','体检流程','20','','','share-alt','1','','1','2018-03-12 12:07:58','1','2018-04-16 10:50:59','','0'),('0b2ebd4d639e4c2b83c2dd0764522f24','ba8092291b40482db8fe7fc006ea3d76','0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,','编辑','60','','','','0','test:testData:edit','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('0c59995d6e91463db215118bca49a1c9','053d3ddee6f048f69a3e8b73b41787a5','0,1,1efc52de37db406ba9be7dd3f06859b7,053d3ddee6f048f69a3e8b73b41787a5,','体检结果录入','50','/wshbj/examinationRecord/inputResult','','','0','wshbj:examinationRecord:inputResult','1','2018-03-25 14:02:33','1','2018-04-23 02:37:27','','0'),('0ca004d6b1bf4bcab9670a5060d82a55','3c92c17886944d0687e73e286cada573','0,1,79,3c92c17886944d0687e73e286cada573,','树结构','90','/test/testTree','','','1','','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('1','0','0,','功能菜单','0',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','3','0,1,2,3,','字典管理','60','/sys/dict/',NULL,'th-list','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('11','10','0,1,2,3,10,','查看','30',NULL,NULL,NULL,'0','sys:dict:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('12','10','0,1,2,3,10,','修改','40',NULL,NULL,NULL,'0','sys:dict:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13','2','0,1,2,','机构用户','970',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13549f076c454f92baaeac590b118990','9032a8d00f7d42b197f5a7a47b6830dd','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,','行业管理','7','/wshbj/industry/listByCenter','','','1','wshbj:industry:viewByCenter','1','2018-03-06 13:01:37','1','2018-03-10 11:18:21','','0'),('14','13','0,1,2,13,','区域管理','50','/sys/area/',NULL,'th','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('15','14','0,1,2,13,14,','查看','30',NULL,NULL,NULL,'0','sys:area:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('16','14','0,1,2,13,14,','修改','40',NULL,NULL,NULL,'0','sys:area:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('1603769af8384a84897a412a529d7934','fa8240e7b03b4f0993ab73c048e2cfbe','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,fa8240e7b03b4f0993ab73c048e2cfbe,','编辑','30','','','','0','wshbj:examinationItem:assigning','1','2018-03-22 20:24:03','1','2018-03-22 20:24:03','','0'),('17','13','0,1,2,13,','机构管理','40','/sys/office/',NULL,'th-large','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('18','17','0,1,2,13,17,','查看','30',NULL,NULL,NULL,'0','sys:office:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('19','17','0,1,2,13,17,','修改','40',NULL,NULL,NULL,'0','sys:office:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('19b0ae33a47e437196b41b664c95a34d','1','0,1,','辅助信息','2','','','','1','','1','2018-03-07 16:57:21','1','2018-03-10 11:25:27','','0'),('1efc52de37db406ba9be7dd3f06859b7','1','0,1,','体检数据','1','','','','1','','1','2018-03-12 12:00:46','1','2018-03-12 12:57:57','','0'),('2','1','0,1,','系统设置','900',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('20','13','0,1,2,13,','用户管理','30','/sys/user/index',NULL,'user','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('21','20','0,1,2,13,20,','查看','30',NULL,NULL,NULL,'0','sys:user:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2115345503a44f02b2e6a4032faa910e','9032a8d00f7d42b197f5a7a47b6830dd','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,','标本管理','6','/wshbj/specimen/listByCenter','','','1','wshbj:specimen:viewByCenter','1','2018-03-10 11:20:32','1','2018-03-11 00:21:21','','0'),('22','20','0,1,2,13,20,','修改','40',NULL,NULL,NULL,'0','sys:user:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('23','2','0,1,2,','关于帮助','990',NULL,NULL,NULL,'0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('236cec99b7f841c9879d396dd1c08ff7','3','0,1,2,3,','全局设置','5030','/sys/globalSet/form','','wrench','1','sys:globalSet:view,sys:globalSet:edit','1','2018-04-18 12:01:49','1','2018-04-18 13:02:52','','0'),('24','23','0,1,2,23','官方首页','30','http://jeesite.com','_blank',NULL,'0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2497901541794f699d496773d8397d1a','eaf34e221ac44d6f87dda25f5d2976d1','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,eaf34e221ac44d6f87dda25f5d2976d1,','查看','1','','','','0','wshbj:jobPost:viewByCenter','1','2018-03-10 11:23:31','1','2018-03-10 11:23:31','','0'),('25','23','0,1,2,23','项目支持','50','http://jeesite.com/donation.html','_blank',NULL,'0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('26','23','0,1,2,23','论坛交流','80','http://bbs.jeesite.com','_blank',NULL,'0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('264ea3ea128d4be294c44b94a98a41b9','ca6f2c5432294cb28b8c9fd8d26558c5','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,ca6f2c5432294cb28b8c9fd8d26558c5,','编辑','2','','','','0','wshbj:examinationItem:edit','1','2018-03-10 20:56:15','1','2018-03-10 20:56:15','','0'),('27','1','0,1,','我的面板','100',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('28','27','0,1,27,','个人信息','30','','','','1','','1','2013-05-27 08:00:00','1','2018-03-03 13:03:02','','0'),('29','28','0,1,27,28,','个人信息','30','/sys/user/info','','user-md','1','','1','2013-05-27 08:00:00','1','2018-03-02 21:45:42','','0'),('29c75b07c3454e489be6a62a76ec1094','9032a8d00f7d42b197f5a7a47b6830dd','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,','检查大类','1','/wshbj/examinationCategory/listByCenter','','','1','wshbj:examinationCategory:viewByCenter','1','2018-03-07 16:55:54','1','2018-03-10 11:24:41','','0'),('29d5c1f1f6904bdb9ee44a3c439a13f5','e5bcc15b76f8477195762c7248cc04aa','0,1,1efc52de37db406ba9be7dd3f06859b7,053d3ddee6f048f69a3e8b73b41787a5,e5bcc15b76f8477195762c7248cc04aa,','查看','1','','','','0','wshbj:examinationRecord:view','1','2018-03-12 12:02:38','1','2018-03-12 12:02:38','','0'),('2b1c4c7103204d57bc540f0a1e9ba0f5','f4780696ac6f4ac48122dec79e9ce519','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,f4780696ac6f4ac48122dec79e9ce519,','编辑','30','','','','0','wshbj:examinationItemType:editByCenter','1','2018-03-10 11:02:03','1','2018-03-11 15:25:59','','0'),('2c12a52a000841968083929aead0fe50','574a258f0ffc435faaaa557bcb421490','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,574a258f0ffc435faaaa557bcb421490,','查看','1','','','','0','wshbj:specimen:view','1','2018-03-11 00:21:26','1','2018-03-11 00:21:26','','0'),('2d890d8458e24bb9a753da8c36c42c08','55fc8176b2f74ee1a9bd8112ea93ba75','0,1,1efc52de37db406ba9be7dd3f06859b7,053d3ddee6f048f69a3e8b73b41787a5,55fc8176b2f74ee1a9bd8112ea93ba75,','采集','30','','','beaker','0','wshbj:examinationRecordItem:edit','1','2018-04-01 10:21:12','1','2018-04-21 14:21:17','','0'),('3','2','0,1,2,','系统设置','980',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('30','28','0,1,27,28,','修改密码','40','/sys/user/modifyPwd',NULL,'lock','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('30919dfb6532461d9e982662bdb9fabc','f3ee9c9fe5b948f0be57ceb0ffbd3082','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,f3ee9c9fe5b948f0be57ceb0ffbd3082,','编辑','2','','','','0','wshbj:examinationDept:edit','1','2018-03-11 15:58:43','1','2018-03-11 15:58:43','','0'),('31','1','0,1,','内容管理','500',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('32','31','0,1,31,','栏目设置','990',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('33','32','0,1,31,32','栏目管理','30','/cms/category/',NULL,'align-justify','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('34','33','0,1,31,32,33,','查看','30',NULL,NULL,NULL,'0','cms:category:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('35','33','0,1,31,32,33,','修改','40',NULL,NULL,NULL,'0','cms:category:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('36','32','0,1,31,32','站点设置','40','/cms/site/',NULL,'certificate','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3628fdf639cd4f9aa5251702edea6e7b','3c92c17886944d0687e73e286cada573','0,1,79,3c92c17886944d0687e73e286cada573,','测试1','12','/test1/test1','','asterisk','1','test1:test1:view,test1:test1:edit','1','2018-03-03 02:35:18','1','2018-03-03 02:35:18','','1'),('37','36','0,1,31,32,36,','查看','30',NULL,NULL,NULL,'0','cms:site:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('38','36','0,1,31,32,36,','修改','40',NULL,NULL,NULL,'0','cms:site:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('39','32','0,1,31,32','切换站点','50','/cms/site/select',NULL,'retweet','1','cms:site:select','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3b49c381c07641f7a249a5d31bca19b8','da445992999a4a13b749a7cc00ed4b7d','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,','检查大类','1','/wshbj/examinationCategory/list','','','1','wshbj:examinationCategory:view','1','2018-03-07 16:58:09','1','2018-03-10 11:25:06','','0'),('3c92c17886944d0687e73e286cada573','79','0,1,79,','生成示例','120','','','','1','','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('4','3','0,1,2,3,','菜单管理','30','/sys/menu/',NULL,'list-alt','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('40','31','0,1,31,','内容管理','500',NULL,NULL,NULL,'1','cms:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('41','40','0,1,31,40,','内容发布','30','/cms/',NULL,'briefcase','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('42','41','0,1,31,40,41,','文章模型','40','/cms/article/',NULL,'file','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('429e899b63fa4a9896544a3b3e5a7c43','3b49c381c07641f7a249a5d31bca19b8','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,3b49c381c07641f7a249a5d31bca19b8,','编辑','2','','','','0','wshbj:examinationCategory:edit','1','2018-03-10 11:26:53','1','2018-03-10 11:26:53','','0'),('43','42','0,1,31,40,41,42,','查看','30',NULL,NULL,NULL,'0','cms:article:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('44','42','0,1,31,40,41,42,','修改','40',NULL,NULL,NULL,'0','cms:article:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('45','42','0,1,31,40,41,42,','审核','50',NULL,NULL,NULL,'0','cms:article:audit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('46','41','0,1,31,40,41,','链接模型','60','/cms/link/',NULL,'random','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('46205ec931f44dbb8dda804b05284e3d','29c75b07c3454e489be6a62a76ec1094','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,29c75b07c3454e489be6a62a76ec1094,','编辑','2','','','','0','wshbj:examinationCategory:editByCenter','1','2018-03-07 17:30:53','1','2018-03-10 11:13:13','','0'),('47','46','0,1,31,40,41,46,','查看','30',NULL,NULL,NULL,'0','cms:link:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('48','46','0,1,31,40,41,46,','修改','40',NULL,NULL,NULL,'0','cms:link:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4855cf3b25c244fb8500a380db189d97','b1f6d1b86ba24365bae7fd86c5082317','0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,','查看','30','','','','0','test:testDataMain:view','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('48b5f7ff7ce44a519d2185fb8b1a92b1','b90dae451d4341f09e6e5493a8df017c','0,1,1efc52de37db406ba9be7dd3f06859b7,053d3ddee6f048f69a3e8b73b41787a5,b90dae451d4341f09e6e5493a8df017c,','查看','1','','','','0','wshbj:certRecord:view','1','2018-03-25 18:50:13','1','2018-03-25 18:50:13','','0'),('49','46','0,1,31,40,41,46,','审核','50',NULL,NULL,NULL,'0','cms:link:audit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4c454c20042542cebe3cee0a6279c4b8','053d3ddee6f048f69a3e8b73b41787a5','0,1,1efc52de37db406ba9be7dd3f06859b7,053d3ddee6f048f69a3e8b73b41787a5,','样本结果','40','/wshbj/examinationRecord/inputSamplesResult','','','0','wshbj:examinationRecord:inputSamplesResult','1','2018-03-22 21:16:41','1','2018-04-23 02:37:20','','0'),('5','4','0,1,2,3,4,','查看','30',NULL,NULL,NULL,'0','sys:menu:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('50','40','0,1,31,40,','评论管理','40','/cms/comment/?status=2',NULL,'comment','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('51','50','0,1,31,40,50,','查看','30',NULL,NULL,NULL,'0','cms:comment:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('52','50','0,1,31,40,50,','审核','40',NULL,NULL,NULL,'0','cms:comment:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('52127cbc635144d393530ea86e0d9b3b','574a258f0ffc435faaaa557bcb421490','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,574a258f0ffc435faaaa557bcb421490,','编辑','2','','','','0','wshbj:specimen:edit','1','2018-03-11 00:21:45','1','2018-03-11 00:21:45','','0'),('53','40','0,1,31,40,','公共留言','80','/cms/guestbook/?status=2',NULL,'glass','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('54','53','0,1,31,40,53,','查看','30',NULL,NULL,NULL,'0','cms:guestbook:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('55','53','0,1,31,40,53,','审核','40',NULL,NULL,NULL,'0','cms:guestbook:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('55fc8176b2f74ee1a9bd8112ea93ba75','053d3ddee6f048f69a3e8b73b41787a5','0,1,1efc52de37db406ba9be7dd3f06859b7,053d3ddee6f048f69a3e8b73b41787a5,','样本采集','30','/wshbj/examinationSamples/form','','beaker','1','wshbj:examinationRecordItem:edit','1','2018-03-19 10:10:31','1','2018-04-21 21:34:17','','0'),('56','71','0,1,27,71,','文件管理','90','/../static/ckfinder/ckfinder.html',NULL,'folder-open','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('57','56','0,1,27,40,56,','查看','30',NULL,NULL,NULL,'0','cms:ckfinder:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('574a258f0ffc435faaaa557bcb421490','da445992999a4a13b749a7cc00ed4b7d','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,','标本管理','6','/wshbj/specimen/list','','','1','wshbj:specimen:view','1','2018-03-11 00:21:04','1','2018-03-11 00:21:04','','0'),('57e4a401ceca4b7a923494ac93d0c558','9032a8d00f7d42b197f5a7a47b6830dd','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,','检查小类','2','/wshbj/examinationItemCategory/listByCenter','','','1','wshbj:examinationItemCategory:viewByCenter','1','2018-03-10 10:53:02','1','2018-03-11 00:42:04','','0'),('58','56','0,1,27,40,56,','上传','40',NULL,NULL,NULL,'0','cms:ckfinder:upload','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('586f7fa09f424462b65c02274fabef53','7f002e5edc524aa19a3bb3cabf0c1a17','0,1,1efc52de37db406ba9be7dd3f06859b7,679841c6cfbd4ab0b61592b738baddc9,7f002e5edc524aa19a3bb3cabf0c1a17,','查看','1','','','','0','wshbj:examinationUser:view','1','2018-03-12 12:05:00','1','2018-03-12 12:05:00','','0'),('59','56','0,1,27,40,56,','修改','50',NULL,NULL,NULL,'0','cms:ckfinder:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5bf62f84f476436bb901a6aa5f5a717b','9032a8d00f7d42b197f5a7a47b6830dd','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,','检查项目','4','/wshbj/examinationItem/listByCenter','','','1','wshbj:examinationItem:viewByCenter','1','2018-03-10 11:05:11','1','2018-03-10 11:05:24','','0'),('5c79380c225b41368264552635e3cbcb','2115345503a44f02b2e6a4032faa910e','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,2115345503a44f02b2e6a4032faa910e,','编辑','2','','','','0','wshbj:specimen:editByCenter','1','2018-03-10 11:21:46','1','2018-03-12 09:09:16','','0'),('6','4','0,1,2,3,4,','修改','40',NULL,NULL,NULL,'0','sys:menu:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('60','31','0,1,31,','统计分析','600',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('61','60','0,1,31,60,','信息量统计','30','/cms/stats/article',NULL,'tasks','1','cms:stats:article','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('62','1','0,1,','在线办公','200','','','','0','','1','2013-05-27 08:00:00','1','2018-04-16 09:11:58','','0'),('63','62','0,1,62,','个人办公','30',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('639f401e930a4cdfa4d863818297e817','e18d31899efa41059d5b15e34b2a2cd0','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,e18d31899efa41059d5b15e34b2a2cd0,','查看','1','','','','0','wshbj:industry:view','1','2018-03-11 00:24:56','1','2018-03-11 00:24:56','','0'),('64','63','0,1,62,63,','请假办理','300','/oa/leave',NULL,'leaf','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('65','64','0,1,62,63,64,','查看','30',NULL,NULL,NULL,'0','oa:leave:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('65db10286d984e22828e0e2d09f25e8d','df5844e85fb64ba3b16851fe062b443b','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,df5844e85fb64ba3b16851fe062b443b,','编辑','2','','','','0','wshbj:examinationResultDict:editByCenter','1','2018-03-10 11:10:22','1','2018-03-10 11:10:22','','0'),('66','64','0,1,62,63,64,','修改','40',NULL,NULL,NULL,'0','oa:leave:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('67','2','0,1,2,','日志查询','985',NULL,NULL,NULL,'1',NULL,'1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('679841c6cfbd4ab0b61592b738baddc9','1efc52de37db406ba9be7dd3f06859b7','0,1,1efc52de37db406ba9be7dd3f06859b7,','体检人','30','','','hand-right','1','','1','2018-04-16 10:14:09','1','2018-04-16 10:14:21','','0'),('68','67','0,1,2,67,','日志查询','30','/sys/log',NULL,'pencil','1','sys:log:view','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('69','62','0,1,62,','流程管理','300',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6d29e488517c4f8eb7a1c946760249f3','a85d1e78223646bfa5b16108c51c057d','0,1,c6f7ff36458f417f855ed1f523f84c83,a85d1e78223646bfa5b16108c51c057d,','编辑','2','','','','0','wshbj:examinationForm:edit','1','2018-03-15 09:55:23','1','2018-03-15 09:56:16','','0'),('7','3','0,1,2,3,','角色管理','50','/sys/role/',NULL,'lock','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('70','69','0,1,62,69,','流程管理','50','/act/process',NULL,'road','1','act:process:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('71','27','0,1,27,','文件管理','90',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('72','69','0,1,62,69,','模型管理','100','/act/model',NULL,'road','1','act:model:edit','1','2013-09-20 08:00:00','1','2013-09-20 08:00:00',NULL,'0'),('72ad2c4c721849119353081b73e2700c','1efc52de37db406ba9be7dd3f06859b7','0,1,1efc52de37db406ba9be7dd3f06859b7,','导航','10','','','home','1','','1','2018-04-16 10:12:45','1','2018-04-16 10:12:45','','0'),('72e0fea5017a409d80094df9e82c66a2','7b4af83064964e2e9bf6f4f1232b6d04','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,7b4af83064964e2e9bf6f4f1232b6d04,','查看','1','','','','0','wshbj:examinationItemType:view','1','2018-03-10 20:57:46','1','2018-03-10 20:57:46','','0'),('73','63','0,1,62,63,','我的任务','50','/act/task/todo/',NULL,'tasks','1',NULL,'1','2013-09-24 08:00:00','1','2013-09-24 08:00:00',NULL,'0'),('74','63','0,1,62,63,','审批测试','100','/oa/testAudit',NULL,NULL,'1','oa:testAudit:view,oa:testAudit:edit','1','2013-09-24 08:00:00','1','2013-09-24 08:00:00',NULL,'0'),('75','1','0,1,','在线演示','3000',NULL,NULL,NULL,'1',NULL,'1','2013-10-08 08:00:00','1','2013-10-08 08:00:00',NULL,'1'),('79','1','0,1,','代码生成','5000',NULL,NULL,NULL,'1',NULL,'1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),('7b4af83064964e2e9bf6f4f1232b6d04','da445992999a4a13b749a7cc00ed4b7d','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,','项目类型','3','/wshbj/examinationItemType/list','','','1','wshbj:examinationItemType:view','1','2018-03-10 20:57:31','1','2018-03-10 20:57:31','','0'),('7c29a315b29942d290ed2367a67ca319','053d3ddee6f048f69a3e8b73b41787a5','0,1,1efc52de37db406ba9be7dd3f06859b7,053d3ddee6f048f69a3e8b73b41787a5,','待录结果项目','37','/wshbj/examinationRecordItem/list_no_result','','calendar','1','wshbj:examinationRecordItem:view','1','2018-04-21 23:07:53','1','2018-04-21 23:53:30','','0'),('7c2a5804ccc448b88fd589f1249c52ca','1efc52de37db406ba9be7dd3f06859b7','0,1,1efc52de37db406ba9be7dd3f06859b7,','基础数据','40','','','asterisk','1','','1','2018-04-16 10:48:51','1','2018-04-16 10:48:51','','0'),('7e6aa5d1f2db491085183115922e67ee','29c75b07c3454e489be6a62a76ec1094','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,29c75b07c3454e489be6a62a76ec1094,','查看','1','','','','0','wshbj:examinationCategory:viewByCenter','1','2018-03-10 11:13:40','1','2018-03-10 11:13:40','','0'),('7f002e5edc524aa19a3bb3cabf0c1a17','679841c6cfbd4ab0b61592b738baddc9','0,1,1efc52de37db406ba9be7dd3f06859b7,679841c6cfbd4ab0b61592b738baddc9,','体检用户','10','/wshbj/examinationUser/list','','user','1','wshbj:examinationUser:view','1','2018-03-12 12:04:27','1','2018-04-16 10:14:34','','0'),('7fa72032991e45bab16053c5f6bf15b1','9032a8d00f7d42b197f5a7a47b6830dd','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,','检查部门','9','/wshbj/examinationDept/listByCenter','','','1','wshbj:examinationDept:viewByCenter','1','2018-03-11 15:56:44','1','2018-03-11 15:56:44','','0'),('8','7','0,1,2,3,7,','查看','30',NULL,NULL,NULL,'0','sys:role:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('80','79','0,1,79,','代码生成','50',NULL,NULL,NULL,'1',NULL,'1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),('800fd80a27aa4505ba8df8951aa7866b','eaf34e221ac44d6f87dda25f5d2976d1','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,eaf34e221ac44d6f87dda25f5d2976d1,','编辑','2','','','','0','wshbj:jobPost:editByCenter','1','2018-03-10 11:24:03','1','2018-03-10 11:24:03','','0'),('81','80','0,1,79,80,','生成方案配置','30','/gen/genScheme',NULL,NULL,'1','gen:genScheme:view,gen:genScheme:edit','1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),('82','80','0,1,79,80,','业务表配置','20','/gen/genTable',NULL,NULL,'1','gen:genTable:view,gen:genTable:edit,gen:genTableColumn:view,gen:genTableColumn:edit','1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),('83','80','0,1,79,80,','代码模板管理','90','/gen/genTemplate',NULL,NULL,'1','gen:genTemplate:view,gen:genTemplate:edit','1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'1'),('83ca127bffa14dd09b72fd0428cfe748','7f002e5edc524aa19a3bb3cabf0c1a17','0,1,1efc52de37db406ba9be7dd3f06859b7,679841c6cfbd4ab0b61592b738baddc9,7f002e5edc524aa19a3bb3cabf0c1a17,','添加','2','','','','0','wshbj:examinationUser:edit','1','2018-03-12 12:05:24','1','2018-03-12 12:05:24','','0'),('84','67','0,1,2,67,','连接池监视','40','/../druid',NULL,NULL,'1',NULL,'1','2013-10-18 08:00:00','1','2013-10-18 08:00:00',NULL,'0'),('85','76','0,1,75,76,','行政区域','80','/../static/map/map-city.html',NULL,NULL,'1',NULL,'1','2013-10-22 08:00:00','1','2013-10-22 08:00:00',NULL,'0'),('86','75','0,1,75,','组件演示','50',NULL,NULL,NULL,'1',NULL,'1','2013-10-22 08:00:00','1','2013-10-22 08:00:00',NULL,'1'),('860c8008a2ac44b990f8695278537a35','bc3665202c5140f7a5703b1272b4c5cd','0,1,1efc52de37db406ba9be7dd3f06859b7,679841c6cfbd4ab0b61592b738baddc9,bc3665202c5140f7a5703b1272b4c5cd,','添加','2','','','','0','wshbj:organ:edit','1','2018-03-12 12:15:55','1','2018-03-12 12:15:55','','0'),('87','86','0,1,75,86,','组件演示','30','/test/test/form',NULL,NULL,'1','test:test:view,test:test:edit','1','2013-10-22 08:00:00','1','2013-10-22 08:00:00',NULL,'1'),('88','62','0,1,62,','通知通告','20','','','','1','','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('89','88','0,1,62,88,','我的通告','30','/oa/oaNotify/self','','','1','','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('8b1e81ede9744ca29271e21bc7b9a300','f1ef203de0b54cf3a7f3637f5eaf482c','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,f1ef203de0b54cf3a7f3637f5eaf482c,','查看','1','','','','0','wshbj:examinationResultDict:view','1','2018-03-11 00:19:34','1','2018-03-11 00:19:34','','0'),('8d29454fbb4f4c04b8ae00b052d8a2e3','7fa72032991e45bab16053c5f6bf15b1','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,7fa72032991e45bab16053c5f6bf15b1,','查看','1','','','','0','wshbj:examinationDept:viewByCenter','1','2018-03-11 15:57:05','1','2018-03-11 15:57:05','','0'),('9','7','0,1,2,3,7,','修改','40',NULL,NULL,NULL,'0','sys:role:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('90','88','0,1,62,88,','通告管理','50','/oa/oaNotify','','','1','oa:oaNotify:view,oa:oaNotify:edit','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('9032a8d00f7d42b197f5a7a47b6830dd','c6f7ff36458f417f855ed1f523f84c83','0,1,c6f7ff36458f417f855ed1f523f84c83,','基础支撑','1','','','','1','','1','2018-03-06 12:58:43','1','2018-03-10 10:40:27','','0'),('927d6756e2974c58ade07742b74b05a1','df5844e85fb64ba3b16851fe062b443b','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,df5844e85fb64ba3b16851fe062b443b,','查看','1','','','','0','wshbj:examinationResultDict:viewByCenter','1','2018-03-10 11:09:29','1','2018-03-12 10:57:08','','0'),('9301ade5de3143d798a0bc77f4e731c5','7b4af83064964e2e9bf6f4f1232b6d04','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,7b4af83064964e2e9bf6f4f1232b6d04,','编辑','2','','','','0','wshbj:examinationItemType:edit','1','2018-03-10 20:58:05','1','2018-03-10 20:58:05','','0'),('94a46fdc598a48f78f726bcb5a55ab90','3b49c381c07641f7a249a5d31bca19b8','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,3b49c381c07641f7a249a5d31bca19b8,','查看','1','','','','0','wshbj:examinationCategory:view','1','2018-03-07 17:29:46','1','2018-03-10 11:26:34','','0'),('96c3d73e685b483fa82b11ca0cfffc22','2115345503a44f02b2e6a4032faa910e','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,2115345503a44f02b2e6a4032faa910e,','查看','1','','','','0','wshbj:specimen:viewByCenter','1','2018-03-10 11:21:16','1','2018-03-10 11:21:16','','0'),('98c867d6168948be877d1694836f15e5','57e4a401ceca4b7a923494ac93d0c558','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,57e4a401ceca4b7a923494ac93d0c558,','编辑','2','','','','0','wshbj:examinationItemCategory:editByCenter','1','2018-03-10 10:54:23','1','2018-03-10 11:11:37','','0'),('9ab09ab112b642bdaf68996b366449e0','c9f1ca975a0e46e4ab2b9b6f007199e9','0,1,1efc52de37db406ba9be7dd3f06859b7,7c2a5804ccc448b88fd589f1249c52ca,c9f1ca975a0e46e4ab2b9b6f007199e9,','编辑','2','','','','0','wshbj:examinationPackage:edit','1','2018-03-12 15:16:59','1','2018-03-12 15:16:59','','0'),('a08a70b711d84470bde6b408af118467','5bf62f84f476436bb901a6aa5f5a717b','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,5bf62f84f476436bb901a6aa5f5a717b,','编辑','2','','','','0','wshbj:examinationItem:editByCenter','1','2018-03-10 11:07:38','1','2018-03-10 11:07:38','','0'),('a15153de146e4b639a88c6cef3700fbd','053d3ddee6f048f69a3e8b73b41787a5','0,1,1efc52de37db406ba9be7dd3f06859b7,053d3ddee6f048f69a3e8b73b41787a5,','待采集样本','35','/wshbj/examinationRecordItem/list_need_sample_nodo','','film','1','wshbj:examinationRecordItem:view','1','2018-04-21 21:34:08','1','2018-04-21 23:05:25','','0'),('a1ad8e2c138a45679274b0983de5f8b5','e5bcc15b76f8477195762c7248cc04aa','0,1,1efc52de37db406ba9be7dd3f06859b7,053d3ddee6f048f69a3e8b73b41787a5,e5bcc15b76f8477195762c7248cc04aa,','添加','2','','','','0','wshbj:examinationRecord:edit','1','2018-03-12 12:03:01','1','2018-03-12 12:03:45','','0'),('a1e776ccaa8445b4bc488d5f07fa7f89','ca6f2c5432294cb28b8c9fd8d26558c5','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,ca6f2c5432294cb28b8c9fd8d26558c5,','查看','1','','','','0','wshbj:examinationItem:view','1','2018-03-10 20:55:56','1','2018-03-10 20:55:56','','0'),('a299f4c8d9b24b2d9e37819d08be8492','f4780696ac6f4ac48122dec79e9ce519','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,f4780696ac6f4ac48122dec79e9ce519,','查看','1','','','','0','wshbj:examinationItemType:viewByCenter','1','2018-03-10 11:02:58','1','2018-03-10 11:03:25','','0'),('a2cae1b7dbfa4336af96ec6409d02b12','13549f076c454f92baaeac590b118990','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,13549f076c454f92baaeac590b118990,','查看','1','','','','0','wshbj:industry:viewByCenter','1','2018-03-10 11:19:01','1','2018-03-10 11:19:01','','0'),('a707f252e00749f7ae613e0eef24a6dd','053d3ddee6f048f69a3e8b73b41787a5','0,1,1efc52de37db406ba9be7dd3f06859b7,053d3ddee6f048f69a3e8b73b41787a5,','信息登记','20','/wshbj/examinationRecord/form','','edit','1','wshbj:examinationRecord:edit','1','2018-03-19 10:07:45','1','2018-04-19 11:50:55','','0'),('a85d1e78223646bfa5b16108c51c057d','c6f7ff36458f417f855ed1f523f84c83','0,1,c6f7ff36458f417f855ed1f523f84c83,','流程表模板','2','/wshbj/examinationForm/list','','','1','wshbj:examinationForm:view','1','2018-03-15 09:54:17','1','2018-03-15 09:54:17','','0'),('a922363504e84b1783a4dbedd5ee4885','da445992999a4a13b749a7cc00ed4b7d','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,','岗位管理','8','/wshbj/jobPost/list','','','1','wshbj:jobPost:view','1','2018-03-11 00:26:15','1','2018-03-11 00:26:15','','0'),('a9e51d0b6f35491d9e5e2d7f2a874551','053d3ddee6f048f69a3e8b73b41787a5','0,1,1efc52de37db406ba9be7dd3f06859b7,053d3ddee6f048f69a3e8b73b41787a5,','体检记录列表','25','/wshbj/examinationRecord/list','','group','1','wshbj:examinationRecord:view','1','2018-04-19 11:50:17','1','2018-04-19 11:50:17','','0'),('abc0a0f01041452f9c233b5fd3d835dd','13549f076c454f92baaeac590b118990','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,13549f076c454f92baaeac590b118990,','编辑','2','','','','0','wshbj:industry:editByCenter','1','2018-03-06 13:41:12','1','2018-03-10 11:17:03','','0'),('af9ad6cfe1e741e3a68632cc2e8c359b','7fa72032991e45bab16053c5f6bf15b1','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,7fa72032991e45bab16053c5f6bf15b1,','编辑','2','','','','0','wshbj:examinationDept:editByCenter','1','2018-03-11 15:57:26','1','2018-03-11 15:57:26','','0'),('afab2db430e2457f9cf3a11feaa8b869','0ca004d6b1bf4bcab9670a5060d82a55','0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,','编辑','60','','','','0','test:testTree:edit','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('b076c39f152a42f6bbbbe29600754648','a85d1e78223646bfa5b16108c51c057d','0,1,c6f7ff36458f417f855ed1f523f84c83,a85d1e78223646bfa5b16108c51c057d,','查看','1','','','','0','wshbj:examinationForm:view','1','2018-03-15 09:54:55','1','2018-03-15 09:54:55','','0'),('b1f6d1b86ba24365bae7fd86c5082317','3c92c17886944d0687e73e286cada573','0,1,79,3c92c17886944d0687e73e286cada573,','主子表','60','/test/testDataMain','','','1','','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('b25a79da91ab4698a92a94920abbb06b','a922363504e84b1783a4dbedd5ee4885','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,a922363504e84b1783a4dbedd5ee4885,','查看','1','','','','0','wshbj:jobPost:view','1','2018-03-11 00:26:36','1','2018-03-11 00:26:36','','0'),('b90dae451d4341f09e6e5493a8df017c','053d3ddee6f048f69a3e8b73b41787a5','0,1,1efc52de37db406ba9be7dd3f06859b7,053d3ddee6f048f69a3e8b73b41787a5,','制卡','60','/wshbj/certRecord/form','','','0','wshbj:certRecord:edit','1','2018-03-25 18:48:37','1','2018-04-23 02:37:33','','0'),('ba15c2232943412dae72e1758a78c68b','e18d31899efa41059d5b15e34b2a2cd0','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,e18d31899efa41059d5b15e34b2a2cd0,','编辑','2','','','','0','wshbj:industry:edit','1','2018-03-11 00:25:15','1','2018-03-11 00:25:15','','0'),('ba8092291b40482db8fe7fc006ea3d76','3c92c17886944d0687e73e286cada573','0,1,79,3c92c17886944d0687e73e286cada573,','单表','30','/test/testData','','','1','','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('bc017b79d82c40bebaa825bd486a0143','c6f7ff36458f417f855ed1f523f84c83','0,1,c6f7ff36458f417f855ed1f523f84c83,','套餐管理','3','','','','1','','1','2018-03-10 10:41:03','1','2018-03-10 10:41:15','','0'),('bc3665202c5140f7a5703b1272b4c5cd','679841c6cfbd4ab0b61592b738baddc9','0,1,1efc52de37db406ba9be7dd3f06859b7,679841c6cfbd4ab0b61592b738baddc9,','体检单位','20','/wshbj/organ/list','','group','1','wshbj:organ:view','1','2018-03-12 12:14:21','1','2018-04-16 10:14:49','','0'),('c2c2be8854454a52892ea2315ce6146c','bc3665202c5140f7a5703b1272b4c5cd','0,1,1efc52de37db406ba9be7dd3f06859b7,679841c6cfbd4ab0b61592b738baddc9,bc3665202c5140f7a5703b1272b4c5cd,','查看','1','','','','0','wshbj:organ:view','1','2018-03-12 12:15:27','1','2018-03-12 12:15:27','','0'),('c2e4d9082a0b4386884a0b203afe2c5c','0ca004d6b1bf4bcab9670a5060d82a55','0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,','查看','30','','','','0','test:testTree:view','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('c2fd2e0661e94db8b3713f1eb445d71f','c9f1ca975a0e46e4ab2b9b6f007199e9','0,1,1efc52de37db406ba9be7dd3f06859b7,7c2a5804ccc448b88fd589f1249c52ca,c9f1ca975a0e46e4ab2b9b6f007199e9,','查看','1','','','','0','wshbj:examinationPackage:view','1','2018-03-12 15:16:40','1','2018-03-12 15:16:40','','0'),('c6f7ff36458f417f855ed1f523f84c83','1','0,1,','运营数据','1','','','','0','','1','2018-03-06 12:55:27','1','2018-04-16 09:11:44','','0'),('c9f1ca975a0e46e4ab2b9b6f007199e9','7c2a5804ccc448b88fd589f1249c52ca','0,1,1efc52de37db406ba9be7dd3f06859b7,7c2a5804ccc448b88fd589f1249c52ca,','体检套餐','40','/wshbj/examinationPackage/list','','gift','1','wshbj:examinationPackage:view','1','2018-03-12 15:16:10','1','2018-04-16 10:49:57','','0'),('ca6f2c5432294cb28b8c9fd8d26558c5','da445992999a4a13b749a7cc00ed4b7d','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,','检查项目','4','/wshbj/examinationItem/list','','','1','wshbj:examinationItem:view','1','2018-03-10 20:55:35','1','2018-03-10 20:56:46','','0'),('cb9663b6a7d846f7916943ec12170444','7c2a5804ccc448b88fd589f1249c52ca','0,1,1efc52de37db406ba9be7dd3f06859b7,7c2a5804ccc448b88fd589f1249c52ca,','样本编号库','70','/wshbj/sampleCodesPack/list','','barcode','1','wshbj:sampleCodes:view,wshbj:sampleCodes:edit','1','2018-04-20 17:13:26','1','2018-04-20 17:13:26','','0'),('d15ec45a4c5449c3bbd7a61d5f9dd1d2','b1f6d1b86ba24365bae7fd86c5082317','0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,','编辑','60','','','','0','test:testDataMain:edit','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('d799ec8d21fd491e8c07df78005c4f27','da445992999a4a13b749a7cc00ed4b7d','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,','检查小类','2','/wshbj/examinationItemCategory/list','','','1','wshbj:examinationItemCategory:view','1','2018-03-10 20:53:13','1','2018-03-11 00:29:54','','0'),('d9017557f5204f1b89c477cc1ac86214','5bf62f84f476436bb901a6aa5f5a717b','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,5bf62f84f476436bb901a6aa5f5a717b,','查看','1','','','','0','wshbj:examinationItem:viewByCenter','1','2018-03-10 11:06:58','1','2018-03-10 11:06:58','','0'),('da445992999a4a13b749a7cc00ed4b7d','19b0ae33a47e437196b41b664c95a34d','0,1,19b0ae33a47e437196b41b664c95a34d,','基础支撑','1','','','','1','','1','2018-03-07 16:57:35','1','2018-03-10 11:29:32','','0'),('dc717662e50c48479f8f8bb1a4650f07','57e4a401ceca4b7a923494ac93d0c558','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,57e4a401ceca4b7a923494ac93d0c558,','查看','1','','','','0','wshbj:examinationItemCategory:viewByCenter','1','2018-03-10 11:12:29','1','2018-03-10 11:12:29','','0'),('deedabfad028491db224ac83cbeffa66','f1ef203de0b54cf3a7f3637f5eaf482c','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,f1ef203de0b54cf3a7f3637f5eaf482c,','编辑','2','','','','0','wshbj:examinationResultDict:edit','1','2018-03-11 00:19:56','1','2018-03-11 00:19:56','','0'),('df5844e85fb64ba3b16851fe062b443b','9032a8d00f7d42b197f5a7a47b6830dd','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,','项目结果','5','/wshbj/examinationResultDict/listByCenter','','','1','wshbj:examinationResultDict:viewByCenter','1','2018-03-10 11:08:56','1','2018-03-10 11:08:56','','0'),('df794afd30504b97bcaaff5e5fb27adb','a922363504e84b1783a4dbedd5ee4885','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,a922363504e84b1783a4dbedd5ee4885,','编辑','2','','','','0','wshbj:jobPost:edit','1','2018-03-11 00:27:00','1','2018-03-11 00:27:00','','0'),('df7ce823c5b24ff9bada43d992f373e2','ba8092291b40482db8fe7fc006ea3d76','0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,','查看','30','','','','0','test:testData:view','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('e18d31899efa41059d5b15e34b2a2cd0','da445992999a4a13b749a7cc00ed4b7d','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,','行业管理','7','/wshbj/industry/list','','','1','wshbj:industry:view','1','2018-03-11 00:23:34','1','2018-03-11 00:23:34','','0'),('e1f432af20e3476696937361afcd540e','d799ec8d21fd491e8c07df78005c4f27','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,d799ec8d21fd491e8c07df78005c4f27,','编辑','2','','','','0','wshbj:examinationItemCategory:edit','1','2018-03-10 20:54:47','1','2018-03-11 12:01:23','','0'),('e5bcc15b76f8477195762c7248cc04aa','053d3ddee6f048f69a3e8b73b41787a5','0,1,1efc52de37db406ba9be7dd3f06859b7,053d3ddee6f048f69a3e8b73b41787a5,','体检记录','70','/wshbj/examinationRecord/list','','','0','wshbj:examinationRecord:view','1','2018-03-12 12:02:09','1','2018-04-23 02:37:44','','0'),('eaf34e221ac44d6f87dda25f5d2976d1','9032a8d00f7d42b197f5a7a47b6830dd','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,','岗位管理','8','/wshbj/jobPost/listByCenter','','','1','wshbj:jobPost:viewByCenter','1','2018-03-10 11:22:47','1','2018-03-10 11:22:58','','0'),('ed70f9bf857444ffaa24346217ac761f','d799ec8d21fd491e8c07df78005c4f27','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,d799ec8d21fd491e8c07df78005c4f27,','查看','1','','','','0','wshbj:examinationItemCategory:view','1','2018-03-10 20:54:11','1','2018-03-10 20:54:25','','0'),('f1ef203de0b54cf3a7f3637f5eaf482c','da445992999a4a13b749a7cc00ed4b7d','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,','项目结果','5','/wshbj/examinationResultDict/list','','','1','wshbj:examinationResultDict:view','1','2018-03-10 20:59:32','1','2018-03-10 20:59:32','','0'),('f35b9e880fad4aafb907fcf9948a334c','72ad2c4c721849119353081b73e2700c','0,1,1efc52de37db406ba9be7dd3f06859b7,72ad2c4c721849119353081b73e2700c,','体检导航','5','/wshbj/home/index','','sitemap','1','','1','2018-04-16 09:07:48','1','2018-04-16 10:13:13','','0'),('f3ee9c9fe5b948f0be57ceb0ffbd3082','da445992999a4a13b749a7cc00ed4b7d','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,','检查部门','9','/wshbj/examinationDept/list','','','1','wshbj:examinationDept:view','1','2018-03-11 15:58:06','1','2018-03-11 15:58:06','','0'),('f4780696ac6f4ac48122dec79e9ce519','9032a8d00f7d42b197f5a7a47b6830dd','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,','项目类型','3','/wshbj/examinationItemType/listByCenter','','','1','wshbj:examinationItemType:viewByCenter','1','2018-03-10 10:59:54','1','2018-03-11 15:11:18','','0'),('f483df5f2eb649e1a355d8b99d38bfdb','3c92c17886944d0687e73e286cada573','0,1,79,3c92c17886944d0687e73e286cada573,','测试1','80','/test1/test1','','','1','test1:test1:view,test1:test1:edit','1','2018-03-03 00:51:50','1','2018-03-03 01:33:34','','1'),('f9219c50dd1c40d2a50f47cd7274dfb2','f3ee9c9fe5b948f0be57ceb0ffbd3082','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,f3ee9c9fe5b948f0be57ceb0ffbd3082,','查看','1','','','','0','wshbj:examinationDept:view','1','2018-03-11 15:58:23','1','2018-03-11 15:58:23','','0'),('fa8240e7b03b4f0993ab73c048e2cfbe','da445992999a4a13b749a7cc00ed4b7d','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,','项目分配','10','/wshbj/examinationItem/assigning','','','1','wshbj:examinationItem:assigning','1','2018-03-20 19:26:51','1','2018-03-20 19:26:51','','0');

/*Table structure for table `sys_office` */

DROP TABLE IF EXISTS `sys_office`;

CREATE TABLE `sys_office` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `area_id` varchar(64) NOT NULL COMMENT '归属区域',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `type` char(1) NOT NULL COMMENT '机构类型',
  `grade` char(1) NOT NULL COMMENT '机构等级',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `zip_code` varchar(100) DEFAULT NULL COMMENT '邮政编码',
  `master` varchar(100) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `fax` varchar(200) DEFAULT NULL COMMENT '传真',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `USEABLE` varchar(64) DEFAULT NULL COMMENT '是否启用',
  `PRIMARY_PERSON` varchar(64) DEFAULT NULL COMMENT '主负责人',
  `DEPUTY_PERSON` varchar(64) DEFAULT NULL COMMENT '副负责人',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `default_record` char(1) NOT NULL DEFAULT '0' COMMENT '是否缺省记录',
  PRIMARY KEY (`id`),
  KEY `sys_office_parent_id` (`parent_id`),
  KEY `sys_office_del_flag` (`del_flag`),
  KEY `sys_office_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构表';

/*Data for the table `sys_office` */

insert  into `sys_office`(`id`,`parent_id`,`parent_ids`,`name`,`sort`,`area_id`,`code`,`type`,`grade`,`address`,`zip_code`,`master`,`phone`,`fax`,`email`,`USEABLE`,`PRIMARY_PERSON`,`DEPUTY_PERSON`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`,`default_record`) values ('22cdf43b3cf64706923b2bdc7bdd32ba','2fc3fe35040548bfa17281fe0e504fe7','0,2fc3fe35040548bfa17281fe0e504fe7,','体检中心','30','ff194b1d2f404810a45001f836a6348d','002','1','2','','','','','','','1','','','1','2018-03-07 17:12:07','1','2018-03-07 17:15:20','','0','1'),('2fc3fe35040548bfa17281fe0e504fe7','0','0,','卫生保健管理系统','30','8cc21c3cd6564faca50bafb92424926b','','1','1','','','','','','','1','','','1','2018-03-07 17:09:51','1','2018-03-07 17:13:56','','0','1'),('3df93034ae954ec8b0df054c33a1c561','f2d694c5e8544169a129a5354c8d4a7a','0,2fc3fe35040548bfa17281fe0e504fe7,22cdf43b3cf64706923b2bdc7bdd32ba,f2d694c5e8544169a129a5354c8d4a7a,','体检部','30','ff194b1d2f404810a45001f836a6348d','002001001','2','2','','','','','','','1','','','1','2018-03-07 17:20:09','1','2018-03-07 17:20:09','','0','0'),('f2d694c5e8544169a129a5354c8d4a7a','22cdf43b3cf64706923b2bdc7bdd32ba','0,2fc3fe35040548bfa17281fe0e504fe7,22cdf43b3cf64706923b2bdc7bdd32ba,','长城体检中心','30','ff194b1d2f404810a45001f836a6348d','002001','1','3','','','','','','','1','','','1','2018-03-07 17:13:02','1','2018-03-07 17:13:02','','0','0');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属机构',
  `name` varchar(100) NOT NULL COMMENT '角色名称',
  `enname` varchar(255) DEFAULT NULL COMMENT '英文名称',
  `role_type` varchar(255) DEFAULT NULL COMMENT '角色类型',
  `data_scope` char(1) DEFAULT NULL COMMENT '数据范围',
  `is_sys` varchar(64) DEFAULT NULL COMMENT '是否系统数据',
  `useable` varchar(64) DEFAULT NULL COMMENT '是否可用',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_role_del_flag` (`del_flag`),
  KEY `sys_role_enname` (`enname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`office_id`,`name`,`enname`,`role_type`,`data_scope`,`is_sys`,`useable`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('7cb57c34857a4b79a632bcb986af9c43','f2d694c5e8544169a129a5354c8d4a7a','护士','nurse','user','8','0','1','1','2018-03-22 18:42:25','1','2018-03-22 19:54:04','','0'),('911ede1fedd74dcaada1dc9b0ceef051','f2d694c5e8544169a129a5354c8d4a7a','运营管理员','yyadmin','assignment','8','1','1','1','2018-03-07 17:23:54','1','2018-04-18 12:28:03','','0'),('f624ff7878b34fbe8645afdaf9cb8133','f2d694c5e8544169a129a5354c8d4a7a','体检中心人员','tjzxry','assignment','8','1','1','1','2018-03-07 17:25:26','1','2018-04-01 10:21:28','','0');

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `menu_id` varchar(64) NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-菜单';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`role_id`,`menu_id`) values ('1','1'),('1','10'),('1','11'),('1','12'),('1','13'),('1','14'),('1','15'),('1','16'),('1','17'),('1','18'),('1','19'),('1','2'),('1','20'),('1','21'),('1','22'),('1','23'),('1','24'),('1','27'),('1','28'),('1','29'),('1','3'),('1','30'),('1','31'),('1','32'),('1','33'),('1','34'),('1','35'),('1','36'),('1','37'),('1','38'),('1','39'),('1','4'),('1','40'),('1','41'),('1','42'),('1','43'),('1','44'),('1','45'),('1','46'),('1','47'),('1','48'),('1','49'),('1','5'),('1','50'),('1','51'),('1','52'),('1','53'),('1','54'),('1','55'),('1','56'),('1','57'),('1','58'),('1','59'),('1','6'),('1','60'),('1','61'),('1','62'),('1','63'),('1','64'),('1','65'),('1','66'),('1','67'),('1','68'),('1','69'),('1','7'),('1','70'),('1','71'),('1','72'),('1','73'),('1','74'),('1','79'),('1','8'),('1','80'),('1','81'),('1','82'),('1','84'),('1','85'),('1','88'),('1','89'),('1','9'),('1','90'),('2','1'),('2','10'),('2','11'),('2','12'),('2','13'),('2','14'),('2','15'),('2','16'),('2','17'),('2','18'),('2','19'),('2','2'),('2','20'),('2','21'),('2','22'),('2','23'),('2','24'),('2','25'),('2','26'),('2','27'),('2','28'),('2','29'),('2','3'),('2','30'),('2','31'),('2','32'),('2','33'),('2','34'),('2','35'),('2','36'),('2','37'),('2','38'),('2','39'),('2','4'),('2','40'),('2','41'),('2','42'),('2','43'),('2','44'),('2','45'),('2','46'),('2','47'),('2','48'),('2','49'),('2','5'),('2','50'),('2','51'),('2','52'),('2','53'),('2','54'),('2','55'),('2','56'),('2','57'),('2','58'),('2','59'),('2','6'),('2','60'),('2','61'),('2','62'),('2','63'),('2','64'),('2','65'),('2','66'),('2','67'),('2','68'),('2','69'),('2','7'),('2','70'),('2','71'),('2','72'),('2','73'),('2','74'),('2','75'),('2','76'),('2','77'),('2','78'),('2','79'),('2','8'),('2','80'),('2','81'),('2','82'),('2','83'),('2','84'),('2','85'),('2','86'),('2','87'),('2','88'),('2','89'),('2','9'),('2','90'),('3','1'),('3','10'),('3','11'),('3','12'),('3','13'),('3','14'),('3','15'),('3','16'),('3','17'),('3','18'),('3','19'),('3','2'),('3','20'),('3','21'),('3','22'),('3','23'),('3','24'),('3','25'),('3','26'),('3','27'),('3','28'),('3','29'),('3','3'),('3','30'),('3','31'),('3','32'),('3','33'),('3','34'),('3','35'),('3','36'),('3','37'),('3','38'),('3','39'),('3','4'),('3','40'),('3','41'),('3','42'),('3','43'),('3','44'),('3','45'),('3','46'),('3','47'),('3','48'),('3','49'),('3','5'),('3','50'),('3','51'),('3','52'),('3','53'),('3','54'),('3','55'),('3','56'),('3','57'),('3','58'),('3','59'),('3','6'),('3','60'),('3','61'),('3','62'),('3','63'),('3','64'),('3','65'),('3','66'),('3','67'),('3','68'),('3','69'),('3','7'),('3','70'),('3','71'),('3','72'),('3','73'),('3','74'),('3','75'),('3','76'),('3','77'),('3','78'),('3','79'),('3','8'),('3','80'),('3','81'),('3','82'),('3','83'),('3','84'),('3','85'),('3','86'),('3','87'),('3','88'),('3','89'),('3','9'),('3','90'),('7cb57c34857a4b79a632bcb986af9c43','053d3ddee6f048f69a3e8b73b41787a5'),('7cb57c34857a4b79a632bcb986af9c43','1'),('7cb57c34857a4b79a632bcb986af9c43','19b0ae33a47e437196b41b664c95a34d'),('7cb57c34857a4b79a632bcb986af9c43','1efc52de37db406ba9be7dd3f06859b7'),('7cb57c34857a4b79a632bcb986af9c43','264ea3ea128d4be294c44b94a98a41b9'),('7cb57c34857a4b79a632bcb986af9c43','27'),('7cb57c34857a4b79a632bcb986af9c43','28'),('7cb57c34857a4b79a632bcb986af9c43','29'),('7cb57c34857a4b79a632bcb986af9c43','29d5c1f1f6904bdb9ee44a3c439a13f5'),('7cb57c34857a4b79a632bcb986af9c43','2c12a52a000841968083929aead0fe50'),('7cb57c34857a4b79a632bcb986af9c43','30'),('7cb57c34857a4b79a632bcb986af9c43','30919dfb6532461d9e982662bdb9fabc'),('7cb57c34857a4b79a632bcb986af9c43','3b49c381c07641f7a249a5d31bca19b8'),('7cb57c34857a4b79a632bcb986af9c43','429e899b63fa4a9896544a3b3e5a7c43'),('7cb57c34857a4b79a632bcb986af9c43','52127cbc635144d393530ea86e0d9b3b'),('7cb57c34857a4b79a632bcb986af9c43','55fc8176b2f74ee1a9bd8112ea93ba75'),('7cb57c34857a4b79a632bcb986af9c43','574a258f0ffc435faaaa557bcb421490'),('7cb57c34857a4b79a632bcb986af9c43','586f7fa09f424462b65c02274fabef53'),('7cb57c34857a4b79a632bcb986af9c43','639f401e930a4cdfa4d863818297e817'),('7cb57c34857a4b79a632bcb986af9c43','72e0fea5017a409d80094df9e82c66a2'),('7cb57c34857a4b79a632bcb986af9c43','7b4af83064964e2e9bf6f4f1232b6d04'),('7cb57c34857a4b79a632bcb986af9c43','7f002e5edc524aa19a3bb3cabf0c1a17'),('7cb57c34857a4b79a632bcb986af9c43','83ca127bffa14dd09b72fd0428cfe748'),('7cb57c34857a4b79a632bcb986af9c43','860c8008a2ac44b990f8695278537a35'),('7cb57c34857a4b79a632bcb986af9c43','8b1e81ede9744ca29271e21bc7b9a300'),('7cb57c34857a4b79a632bcb986af9c43','9301ade5de3143d798a0bc77f4e731c5'),('7cb57c34857a4b79a632bcb986af9c43','94a46fdc598a48f78f726bcb5a55ab90'),('7cb57c34857a4b79a632bcb986af9c43','9ab09ab112b642bdaf68996b366449e0'),('7cb57c34857a4b79a632bcb986af9c43','a1ad8e2c138a45679274b0983de5f8b5'),('7cb57c34857a4b79a632bcb986af9c43','a1e776ccaa8445b4bc488d5f07fa7f89'),('7cb57c34857a4b79a632bcb986af9c43','a707f252e00749f7ae613e0eef24a6dd'),('7cb57c34857a4b79a632bcb986af9c43','a922363504e84b1783a4dbedd5ee4885'),('7cb57c34857a4b79a632bcb986af9c43','b25a79da91ab4698a92a94920abbb06b'),('7cb57c34857a4b79a632bcb986af9c43','ba15c2232943412dae72e1758a78c68b'),('7cb57c34857a4b79a632bcb986af9c43','bc3665202c5140f7a5703b1272b4c5cd'),('7cb57c34857a4b79a632bcb986af9c43','c2c2be8854454a52892ea2315ce6146c'),('7cb57c34857a4b79a632bcb986af9c43','c2fd2e0661e94db8b3713f1eb445d71f'),('7cb57c34857a4b79a632bcb986af9c43','c9f1ca975a0e46e4ab2b9b6f007199e9'),('7cb57c34857a4b79a632bcb986af9c43','ca6f2c5432294cb28b8c9fd8d26558c5'),('7cb57c34857a4b79a632bcb986af9c43','d799ec8d21fd491e8c07df78005c4f27'),('7cb57c34857a4b79a632bcb986af9c43','da445992999a4a13b749a7cc00ed4b7d'),('7cb57c34857a4b79a632bcb986af9c43','deedabfad028491db224ac83cbeffa66'),('7cb57c34857a4b79a632bcb986af9c43','df794afd30504b97bcaaff5e5fb27adb'),('7cb57c34857a4b79a632bcb986af9c43','e18d31899efa41059d5b15e34b2a2cd0'),('7cb57c34857a4b79a632bcb986af9c43','e1f432af20e3476696937361afcd540e'),('7cb57c34857a4b79a632bcb986af9c43','e5bcc15b76f8477195762c7248cc04aa'),('7cb57c34857a4b79a632bcb986af9c43','ed70f9bf857444ffaa24346217ac761f'),('7cb57c34857a4b79a632bcb986af9c43','f1ef203de0b54cf3a7f3637f5eaf482c'),('7cb57c34857a4b79a632bcb986af9c43','f3ee9c9fe5b948f0be57ceb0ffbd3082'),('7cb57c34857a4b79a632bcb986af9c43','f9219c50dd1c40d2a50f47cd7274dfb2'),('7cb57c34857a4b79a632bcb986af9c43','fa8240e7b03b4f0993ab73c048e2cfbe'),('911ede1fedd74dcaada1dc9b0ceef051','1'),('911ede1fedd74dcaada1dc9b0ceef051','13'),('911ede1fedd74dcaada1dc9b0ceef051','13549f076c454f92baaeac590b118990'),('911ede1fedd74dcaada1dc9b0ceef051','14'),('911ede1fedd74dcaada1dc9b0ceef051','15'),('911ede1fedd74dcaada1dc9b0ceef051','16'),('911ede1fedd74dcaada1dc9b0ceef051','17'),('911ede1fedd74dcaada1dc9b0ceef051','18'),('911ede1fedd74dcaada1dc9b0ceef051','19'),('911ede1fedd74dcaada1dc9b0ceef051','2'),('911ede1fedd74dcaada1dc9b0ceef051','20'),('911ede1fedd74dcaada1dc9b0ceef051','21'),('911ede1fedd74dcaada1dc9b0ceef051','2115345503a44f02b2e6a4032faa910e'),('911ede1fedd74dcaada1dc9b0ceef051','22'),('911ede1fedd74dcaada1dc9b0ceef051','2497901541794f699d496773d8397d1a'),('911ede1fedd74dcaada1dc9b0ceef051','27'),('911ede1fedd74dcaada1dc9b0ceef051','28'),('911ede1fedd74dcaada1dc9b0ceef051','29'),('911ede1fedd74dcaada1dc9b0ceef051','29c75b07c3454e489be6a62a76ec1094'),('911ede1fedd74dcaada1dc9b0ceef051','2b1c4c7103204d57bc540f0a1e9ba0f5'),('911ede1fedd74dcaada1dc9b0ceef051','30'),('911ede1fedd74dcaada1dc9b0ceef051','31'),('911ede1fedd74dcaada1dc9b0ceef051','32'),('911ede1fedd74dcaada1dc9b0ceef051','33'),('911ede1fedd74dcaada1dc9b0ceef051','34'),('911ede1fedd74dcaada1dc9b0ceef051','35'),('911ede1fedd74dcaada1dc9b0ceef051','36'),('911ede1fedd74dcaada1dc9b0ceef051','37'),('911ede1fedd74dcaada1dc9b0ceef051','38'),('911ede1fedd74dcaada1dc9b0ceef051','39'),('911ede1fedd74dcaada1dc9b0ceef051','40'),('911ede1fedd74dcaada1dc9b0ceef051','41'),('911ede1fedd74dcaada1dc9b0ceef051','42'),('911ede1fedd74dcaada1dc9b0ceef051','43'),('911ede1fedd74dcaada1dc9b0ceef051','44'),('911ede1fedd74dcaada1dc9b0ceef051','45'),('911ede1fedd74dcaada1dc9b0ceef051','46'),('911ede1fedd74dcaada1dc9b0ceef051','46205ec931f44dbb8dda804b05284e3d'),('911ede1fedd74dcaada1dc9b0ceef051','47'),('911ede1fedd74dcaada1dc9b0ceef051','48'),('911ede1fedd74dcaada1dc9b0ceef051','49'),('911ede1fedd74dcaada1dc9b0ceef051','50'),('911ede1fedd74dcaada1dc9b0ceef051','51'),('911ede1fedd74dcaada1dc9b0ceef051','52'),('911ede1fedd74dcaada1dc9b0ceef051','53'),('911ede1fedd74dcaada1dc9b0ceef051','54'),('911ede1fedd74dcaada1dc9b0ceef051','55'),('911ede1fedd74dcaada1dc9b0ceef051','56'),('911ede1fedd74dcaada1dc9b0ceef051','57'),('911ede1fedd74dcaada1dc9b0ceef051','57e4a401ceca4b7a923494ac93d0c558'),('911ede1fedd74dcaada1dc9b0ceef051','58'),('911ede1fedd74dcaada1dc9b0ceef051','59'),('911ede1fedd74dcaada1dc9b0ceef051','5bf62f84f476436bb901a6aa5f5a717b'),('911ede1fedd74dcaada1dc9b0ceef051','5c79380c225b41368264552635e3cbcb'),('911ede1fedd74dcaada1dc9b0ceef051','60'),('911ede1fedd74dcaada1dc9b0ceef051','61'),('911ede1fedd74dcaada1dc9b0ceef051','62'),('911ede1fedd74dcaada1dc9b0ceef051','63'),('911ede1fedd74dcaada1dc9b0ceef051','64'),('911ede1fedd74dcaada1dc9b0ceef051','65'),('911ede1fedd74dcaada1dc9b0ceef051','65db10286d984e22828e0e2d09f25e8d'),('911ede1fedd74dcaada1dc9b0ceef051','66'),('911ede1fedd74dcaada1dc9b0ceef051','69'),('911ede1fedd74dcaada1dc9b0ceef051','70'),('911ede1fedd74dcaada1dc9b0ceef051','71'),('911ede1fedd74dcaada1dc9b0ceef051','72'),('911ede1fedd74dcaada1dc9b0ceef051','73'),('911ede1fedd74dcaada1dc9b0ceef051','74'),('911ede1fedd74dcaada1dc9b0ceef051','7e6aa5d1f2db491085183115922e67ee'),('911ede1fedd74dcaada1dc9b0ceef051','7fa72032991e45bab16053c5f6bf15b1'),('911ede1fedd74dcaada1dc9b0ceef051','800fd80a27aa4505ba8df8951aa7866b'),('911ede1fedd74dcaada1dc9b0ceef051','88'),('911ede1fedd74dcaada1dc9b0ceef051','89'),('911ede1fedd74dcaada1dc9b0ceef051','8d29454fbb4f4c04b8ae00b052d8a2e3'),('911ede1fedd74dcaada1dc9b0ceef051','90'),('911ede1fedd74dcaada1dc9b0ceef051','9032a8d00f7d42b197f5a7a47b6830dd'),('911ede1fedd74dcaada1dc9b0ceef051','927d6756e2974c58ade07742b74b05a1'),('911ede1fedd74dcaada1dc9b0ceef051','96c3d73e685b483fa82b11ca0cfffc22'),('911ede1fedd74dcaada1dc9b0ceef051','98c867d6168948be877d1694836f15e5'),('911ede1fedd74dcaada1dc9b0ceef051','a08a70b711d84470bde6b408af118467'),('911ede1fedd74dcaada1dc9b0ceef051','a299f4c8d9b24b2d9e37819d08be8492'),('911ede1fedd74dcaada1dc9b0ceef051','a2cae1b7dbfa4336af96ec6409d02b12'),('911ede1fedd74dcaada1dc9b0ceef051','abc0a0f01041452f9c233b5fd3d835dd'),('911ede1fedd74dcaada1dc9b0ceef051','af9ad6cfe1e741e3a68632cc2e8c359b'),('911ede1fedd74dcaada1dc9b0ceef051','bc017b79d82c40bebaa825bd486a0143'),('911ede1fedd74dcaada1dc9b0ceef051','c6f7ff36458f417f855ed1f523f84c83'),('911ede1fedd74dcaada1dc9b0ceef051','d9017557f5204f1b89c477cc1ac86214'),('911ede1fedd74dcaada1dc9b0ceef051','dc717662e50c48479f8f8bb1a4650f07'),('911ede1fedd74dcaada1dc9b0ceef051','df5844e85fb64ba3b16851fe062b443b'),('911ede1fedd74dcaada1dc9b0ceef051','eaf34e221ac44d6f87dda25f5d2976d1'),('911ede1fedd74dcaada1dc9b0ceef051','f4780696ac6f4ac48122dec79e9ce519'),('f624ff7878b34fbe8645afdaf9cb8133','053d3ddee6f048f69a3e8b73b41787a5'),('f624ff7878b34fbe8645afdaf9cb8133','0c59995d6e91463db215118bca49a1c9'),('f624ff7878b34fbe8645afdaf9cb8133','1'),('f624ff7878b34fbe8645afdaf9cb8133','1603769af8384a84897a412a529d7934'),('f624ff7878b34fbe8645afdaf9cb8133','19b0ae33a47e437196b41b664c95a34d'),('f624ff7878b34fbe8645afdaf9cb8133','1efc52de37db406ba9be7dd3f06859b7'),('f624ff7878b34fbe8645afdaf9cb8133','264ea3ea128d4be294c44b94a98a41b9'),('f624ff7878b34fbe8645afdaf9cb8133','27'),('f624ff7878b34fbe8645afdaf9cb8133','28'),('f624ff7878b34fbe8645afdaf9cb8133','29'),('f624ff7878b34fbe8645afdaf9cb8133','29d5c1f1f6904bdb9ee44a3c439a13f5'),('f624ff7878b34fbe8645afdaf9cb8133','2c12a52a000841968083929aead0fe50'),('f624ff7878b34fbe8645afdaf9cb8133','2d890d8458e24bb9a753da8c36c42c08'),('f624ff7878b34fbe8645afdaf9cb8133','30'),('f624ff7878b34fbe8645afdaf9cb8133','30919dfb6532461d9e982662bdb9fabc'),('f624ff7878b34fbe8645afdaf9cb8133','31'),('f624ff7878b34fbe8645afdaf9cb8133','3b49c381c07641f7a249a5d31bca19b8'),('f624ff7878b34fbe8645afdaf9cb8133','40'),('f624ff7878b34fbe8645afdaf9cb8133','41'),('f624ff7878b34fbe8645afdaf9cb8133','42'),('f624ff7878b34fbe8645afdaf9cb8133','429e899b63fa4a9896544a3b3e5a7c43'),('f624ff7878b34fbe8645afdaf9cb8133','43'),('f624ff7878b34fbe8645afdaf9cb8133','48b5f7ff7ce44a519d2185fb8b1a92b1'),('f624ff7878b34fbe8645afdaf9cb8133','4c454c20042542cebe3cee0a6279c4b8'),('f624ff7878b34fbe8645afdaf9cb8133','50'),('f624ff7878b34fbe8645afdaf9cb8133','51'),('f624ff7878b34fbe8645afdaf9cb8133','52127cbc635144d393530ea86e0d9b3b'),('f624ff7878b34fbe8645afdaf9cb8133','53'),('f624ff7878b34fbe8645afdaf9cb8133','54'),('f624ff7878b34fbe8645afdaf9cb8133','55fc8176b2f74ee1a9bd8112ea93ba75'),('f624ff7878b34fbe8645afdaf9cb8133','56'),('f624ff7878b34fbe8645afdaf9cb8133','57'),('f624ff7878b34fbe8645afdaf9cb8133','574a258f0ffc435faaaa557bcb421490'),('f624ff7878b34fbe8645afdaf9cb8133','58'),('f624ff7878b34fbe8645afdaf9cb8133','586f7fa09f424462b65c02274fabef53'),('f624ff7878b34fbe8645afdaf9cb8133','59'),('f624ff7878b34fbe8645afdaf9cb8133','62'),('f624ff7878b34fbe8645afdaf9cb8133','63'),('f624ff7878b34fbe8645afdaf9cb8133','639f401e930a4cdfa4d863818297e817'),('f624ff7878b34fbe8645afdaf9cb8133','64'),('f624ff7878b34fbe8645afdaf9cb8133','65'),('f624ff7878b34fbe8645afdaf9cb8133','66'),('f624ff7878b34fbe8645afdaf9cb8133','71'),('f624ff7878b34fbe8645afdaf9cb8133','72e0fea5017a409d80094df9e82c66a2'),('f624ff7878b34fbe8645afdaf9cb8133','73'),('f624ff7878b34fbe8645afdaf9cb8133','7b4af83064964e2e9bf6f4f1232b6d04'),('f624ff7878b34fbe8645afdaf9cb8133','7f002e5edc524aa19a3bb3cabf0c1a17'),('f624ff7878b34fbe8645afdaf9cb8133','83ca127bffa14dd09b72fd0428cfe748'),('f624ff7878b34fbe8645afdaf9cb8133','860c8008a2ac44b990f8695278537a35'),('f624ff7878b34fbe8645afdaf9cb8133','88'),('f624ff7878b34fbe8645afdaf9cb8133','89'),('f624ff7878b34fbe8645afdaf9cb8133','8b1e81ede9744ca29271e21bc7b9a300'),('f624ff7878b34fbe8645afdaf9cb8133','9301ade5de3143d798a0bc77f4e731c5'),('f624ff7878b34fbe8645afdaf9cb8133','94a46fdc598a48f78f726bcb5a55ab90'),('f624ff7878b34fbe8645afdaf9cb8133','9ab09ab112b642bdaf68996b366449e0'),('f624ff7878b34fbe8645afdaf9cb8133','a1ad8e2c138a45679274b0983de5f8b5'),('f624ff7878b34fbe8645afdaf9cb8133','a1e776ccaa8445b4bc488d5f07fa7f89'),('f624ff7878b34fbe8645afdaf9cb8133','a707f252e00749f7ae613e0eef24a6dd'),('f624ff7878b34fbe8645afdaf9cb8133','a922363504e84b1783a4dbedd5ee4885'),('f624ff7878b34fbe8645afdaf9cb8133','b25a79da91ab4698a92a94920abbb06b'),('f624ff7878b34fbe8645afdaf9cb8133','b90dae451d4341f09e6e5493a8df017c'),('f624ff7878b34fbe8645afdaf9cb8133','ba15c2232943412dae72e1758a78c68b'),('f624ff7878b34fbe8645afdaf9cb8133','bc3665202c5140f7a5703b1272b4c5cd'),('f624ff7878b34fbe8645afdaf9cb8133','c2c2be8854454a52892ea2315ce6146c'),('f624ff7878b34fbe8645afdaf9cb8133','c2fd2e0661e94db8b3713f1eb445d71f'),('f624ff7878b34fbe8645afdaf9cb8133','c9f1ca975a0e46e4ab2b9b6f007199e9'),('f624ff7878b34fbe8645afdaf9cb8133','ca6f2c5432294cb28b8c9fd8d26558c5'),('f624ff7878b34fbe8645afdaf9cb8133','d799ec8d21fd491e8c07df78005c4f27'),('f624ff7878b34fbe8645afdaf9cb8133','da445992999a4a13b749a7cc00ed4b7d'),('f624ff7878b34fbe8645afdaf9cb8133','deedabfad028491db224ac83cbeffa66'),('f624ff7878b34fbe8645afdaf9cb8133','df794afd30504b97bcaaff5e5fb27adb'),('f624ff7878b34fbe8645afdaf9cb8133','e18d31899efa41059d5b15e34b2a2cd0'),('f624ff7878b34fbe8645afdaf9cb8133','e1f432af20e3476696937361afcd540e'),('f624ff7878b34fbe8645afdaf9cb8133','e5bcc15b76f8477195762c7248cc04aa'),('f624ff7878b34fbe8645afdaf9cb8133','ed70f9bf857444ffaa24346217ac761f'),('f624ff7878b34fbe8645afdaf9cb8133','f1ef203de0b54cf3a7f3637f5eaf482c'),('f624ff7878b34fbe8645afdaf9cb8133','f3ee9c9fe5b948f0be57ceb0ffbd3082'),('f624ff7878b34fbe8645afdaf9cb8133','f9219c50dd1c40d2a50f47cd7274dfb2'),('f624ff7878b34fbe8645afdaf9cb8133','fa8240e7b03b4f0993ab73c048e2cfbe');

/*Table structure for table `sys_role_office` */

DROP TABLE IF EXISTS `sys_role_office`;

CREATE TABLE `sys_role_office` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `office_id` varchar(64) NOT NULL COMMENT '机构编号',
  PRIMARY KEY (`role_id`,`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-机构';

/*Data for the table `sys_role_office` */

insert  into `sys_role_office`(`role_id`,`office_id`) values ('7','10'),('7','11'),('7','12'),('7','13'),('7','14'),('7','15'),('7','16'),('7','17'),('7','18'),('7','19'),('7','20'),('7','21'),('7','22'),('7','23'),('7','24'),('7','25'),('7','26'),('7','7'),('7','8'),('7','9');

/*Table structure for table `sys_sequence` */

DROP TABLE IF EXISTS `sys_sequence`;

CREATE TABLE `sys_sequence` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `express` varchar(64) NOT NULL COMMENT '表达式字符串',
  `seq_temp` varchar(64) NOT NULL COMMENT '表达式模板,只替换模板中的{d6}中的文字',
  `seq_val` varchar(64) NOT NULL DEFAULT '1' COMMENT '顺序号',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_sequence_seq_temp` (`seq_temp`),
  KEY `sys_sequence_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='序列表';

/*Data for the table `sys_sequence` */

insert  into `sys_sequence`(`id`,`express`,`seq_temp`,`seq_val`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('1d25739bbe834f8fbbfb79a8ecf17636','GW{yyyy}[3]','GW2018[3]','3','1','2018-04-23 01:19:57','1','2018-04-23 01:20:12',NULL,'0'),('331bbc857d7c4dacaae779893b3140e0','TJJL{yyyyMMmm}[5]','TJJL20180402[5]','2','1','2018-04-18 18:02:52','1','2018-04-18 18:02:52',NULL,'0'),('333fccd02c67402ba6b570d892272384','BBLX{yyyy}[3]','BBLX2018[3]','2','1','2018-04-23 01:20:43','1','2018-04-23 01:20:43',NULL,'0'),('33ec133874c2469ead1dae2b46d19562','XMFL{YYYY}[3]','XMFL[3]','2','1','2018-04-23 00:49:18','1','2018-04-23 00:49:18',NULL,'0'),('4ac0ad5b668f48fa8091ed44f0ddf13d','JCXM{yyyy}[4]','JCXM2018[4]','2','1','2018-04-23 01:00:35','1','2018-04-23 01:00:35',NULL,'0'),('54c1d3d4e6694002b2b26547a121ff0a','EU{yyMMdd}[4]','EU180422[4]','8','1','2018-04-22 18:25:35','1','2018-04-22 22:28:53',NULL,'0'),('5c11f3875d564a6698ec176e76ed103e','YB{yyyyMMdd}[4]','YB20180424[4]','101','1','2018-04-24 16:08:23','1','2018-04-24 16:08:24',NULL,'0'),('6b91c5c7d9ac49f6a0768f4a254fba5c','TJJL{yyyyMMmm}[5]','TJJL20180443[5]','3','1','2018-04-18 16:43:38','1','2018-04-18 16:43:48',NULL,'0'),('6c261cf0837240aa8a92f59dae274e55','10{yyyyMMdd}[4]','1020180419[4]','2','1','2018-04-19 18:18:49','1','2018-04-19 18:18:49',NULL,'0'),('7eccb8e3ffca4b48a984dadfd7219eb9','TJJL{yyyyMMmm}[5]','TJJL20180458[5]','2','1','2018-04-18 17:58:30','1','2018-04-18 17:58:30',NULL,'0'),('8fdc5faf75c5494ab171f23adde58857','21{yyyy}[4]','212018[4]','6','1','2018-04-23 00:38:15','1','2018-04-23 00:39:24',NULL,'0'),('931c7e5018c8455ab968e4c152f2bbaf','JCLB{yyyy}[3]','JCLB2018[3]','2','1','2018-04-23 00:49:04','1','2018-04-23 00:49:04',NULL,'0'),('93c74922dd5640a286bf6b9469908ada','10{yyyyMMdd}[4]','1020180428[4]','2','1','2018-04-28 08:59:59','1','2018-04-28 08:59:59',NULL,'0'),('a629355657ce469eb9a9beea3c9002f7','10{yyyyMMdd}[4]','1020180424[4]','2','1','2018-04-24 16:11:50','1','2018-04-24 16:11:50',NULL,'0'),('b9c78180969d4bd0a73419de7d11aa77','YB{yyyyMMdd}[4]','YB20180423[4]','101','1','2018-04-23 16:11:26','1','2018-04-23 16:11:26',NULL,'0'),('baa9c288baf940a1bf2d060058b2823b','EC{yyyy}[4]','EC2018[4]','8','1','2018-04-14 14:35:59','1','2018-04-18 16:33:29',NULL,'0'),('cd7d87089fd44c15ac8dff3c48ebed34','HY{yyyy}[3]','HY2018[3]','2','1','2018-04-23 01:19:42','1','2018-04-23 01:19:42',NULL,'0'),('d0146745d7b3443c9dd8e13fa3f23fe7','{yyyyMMdd}[4]','20180420[4]','131','1','2018-04-20 18:35:01','1','2018-04-20 19:21:52',NULL,'0'),('ec320071b3264c559e4a4fc938b6bb85','10{yyyyMMdd}[4]','1020180422[4]','11','1','2018-04-22 11:44:31','1','2018-04-22 23:21:58',NULL,'0'),('f94b9f2820d44175b6f51c2abdb09ff2','10{yyyyMMdd}[4]','1020180421[4]','3','1','2018-04-21 11:25:59','1','2018-04-21 21:05:07',NULL,'0'),('fb57b209dc2049ac8c9ca0c397015392','XMLX{yyyy}[3]','XMLX2018[3]','2','1','2018-04-23 00:47:47','1','2018-04-23 00:47:47',NULL,'0'),('fd86f1f5f5ab494fad1cd2ee08129a1b','TJJL{yyyyMMmm}[5]','TJJL20180411[5]','2','1','2018-04-18 18:11:24','1','2018-04-18 18:11:24',NULL,'0');

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `company_id` varchar(64) NOT NULL COMMENT '归属公司',
  `office_id` varchar(64) NOT NULL COMMENT '归属部门',
  `login_name` varchar(100) NOT NULL COMMENT '登录名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `no` varchar(100) DEFAULT NULL COMMENT '工号',
  `name` varchar(100) NOT NULL COMMENT '姓名',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(200) DEFAULT NULL COMMENT '手机',
  `user_type` char(1) DEFAULT NULL COMMENT '用户类型',
  `photo` varchar(1000) DEFAULT NULL COMMENT '用户头像',
  `login_ip` varchar(100) DEFAULT NULL COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `login_flag` varchar(64) DEFAULT NULL COMMENT '是否可登录',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `default_record` char(1) NOT NULL DEFAULT '0' COMMENT '默认记录，不允许删除',
  PRIMARY KEY (`id`),
  KEY `sys_user_office_id` (`office_id`),
  KEY `sys_user_login_name` (`login_name`),
  KEY `sys_user_company_id` (`company_id`),
  KEY `sys_user_update_date` (`update_date`),
  KEY `sys_user_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`company_id`,`office_id`,`login_name`,`password`,`no`,`name`,`email`,`phone`,`mobile`,`user_type`,`photo`,`login_ip`,`login_date`,`login_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`,`default_record`) values ('1','f2d694c5e8544169a129a5354c8d4a7a','3df93034ae954ec8b0df054c33a1c561','thinkgem','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0001','系统管理员','thinkgem@163.com','8675','8675','','/jeesite/userfiles/1/images/photo/2018/03/_DSC0026.JPG','27.184.64.37','2018-04-28 08:52:39','1','1','2013-05-27 08:00:00','1','2018-04-18 11:58:34','最高管理员','0','1'),('92e9531b7c5d4fa2b13997b98d601000','f2d694c5e8544169a129a5354c8d4a7a','3df93034ae954ec8b0df054c33a1c561','yyadmin','8540c6f1e3859161e5e849704228cd6e6d9a0f40d93086512291d2dc','0001','运营管理员','','','','','','0:0:0:0:0:0:0:1','2018-04-14 17:56:25','1','1','2018-03-07 17:22:17','1','2018-04-18 11:58:13','老钱','0','0'),('dbd1c02859f8434aad548bbd09cd74b5','f2d694c5e8544169a129a5354c8d4a7a','3df93034ae954ec8b0df054c33a1c561','tjy1','c3d7d6d82d83a3037df6c38474ed4145c45913120db5150d9e4b167f','0001','体检员1','','','','','','0:0:0:0:0:0:0:1','2018-04-21 10:03:00','1','1','2018-03-07 17:26:51','1','2018-03-07 17:26:51','孙子','0','0');

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` varchar(64) NOT NULL COMMENT '用户编号',
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-角色';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`user_id`,`role_id`) values ('1','911ede1fedd74dcaada1dc9b0ceef051'),('10','2'),('11','3'),('12','4'),('13','5'),('14','6'),('2','1'),('3','2'),('4','3'),('5','4'),('6','5'),('7','2'),('7','7'),('8','2'),('9','1'),('92e9531b7c5d4fa2b13997b98d601000','911ede1fedd74dcaada1dc9b0ceef051'),('dbd1c02859f8434aad548bbd09cd74b5','f624ff7878b34fbe8645afdaf9cb8133');

/*Table structure for table `test1` */

DROP TABLE IF EXISTS `test1`;

CREATE TABLE `test1` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `title` varchar(128) DEFAULT NULL COMMENT '标题',
  `content` varchar(20000) DEFAULT NULL COMMENT '内容',
  `auth_id` varchar(64) NOT NULL,
  `auth_name` varchar(64) DEFAULT NULL COMMENT '作者',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_data_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='测试表1';

/*Data for the table `test1` */

insert  into `test1`(`id`,`title`,`content`,`auth_id`,`auth_name`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('0ef88801e7e34328b06554d26e9ffeb5','标题1 标题2','&lt;p&gt;\r\n	Swagger 是一系列对 RESTful 接口进行规范描述和页面展示的工具. 通过 springfox-swagger 将 Swagger 与 Spring-MVC 整合, 可从代码中的注解获取信息, 并生成相应的文档. 效果如下所示.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&amp;nbsp;&lt;img alt=&quot;&quot; src=&quot;/jeesite/userfiles/1/images/test1/2018/03/_DSC0008.JPG&quot; style=&quot;width: 1024px; height: 683px;&quot; /&gt;&lt;br /&gt;\r\n	目前 Swagger 的 api 版本规范已经更新到 2.0 版本, 中文网络上基本上都是 1.0 的 api 版本规范的教程. 捣鼓了一天终于搞定了, 这两者区别还是有的.&lt;/p&gt;\r\n&lt;p&gt;\r\n	注: 本文的代码见&amp;nbsp;&lt;a href=&quot;https://github.com/Frank-Hust/SpringAndStagger&quot; target=&quot;_blank&quot;&gt;https://github.com/Frank-Hust/SpringAndStagger&lt;/a&gt;, 直接 gitclone 下来或者下载在 IDEA 中就能运行了.&lt;/p&gt;\r\n&lt;h2 id=&quot;先添加依赖&quot;&gt;\r\n	先添加依赖&lt;/h2&gt;','','崔鹏','1','2018-03-03 01:36:08','1','2018-03-03 02:37:45','深刻的积分 \r\n卡上的纠纷 了发暗杀的\r\n阿士大夫撒','1'),('65d2d7e3f5ac43939666bddff54fcf09','sdf阿斯蒂芬','&lt;p&gt;\r\n	Swagger 是一系列对 RESTful 接口进行规范描述和页面展示的工具. 通过 springfox-swagger 将 Swagger 与 Spring-MVC 整合, 可从代码中的注解获取信息, 并生成相应的文档. 效果如下所示.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img alt=&quot;这里写图片描述&quot; src=&quot;http://img.blog.csdn.net/20160929165251897&quot; title=&quot;&quot; /&gt;&amp;nbsp;&lt;br /&gt;\r\n	目前 Swagger 的 api 版本规范已经更新到 2.0 版本, 中文网络上基本上都是 1.0 的 api 版本规范的教程. 捣鼓了一天终于搞定了, 这两者区别还是有的.&lt;/p&gt;\r\n&lt;p&gt;\r\n	注: 本文的代码见&amp;nbsp;&lt;a href=&quot;https://github.com/Frank-Hust/SpringAndStagger&quot; target=&quot;_blank&quot;&gt;https://github.com/Frank-Hust/SpringAndStagger&lt;/a&gt;, 直接 gitclone 下来或者下载在 IDEA 中就能运行了.&lt;/p&gt;\r\n&lt;h2 id=&quot;先添加依赖&quot;&gt;\r\n	&lt;a name=&quot;t0&quot; style=&quot;box-sizing: border-box; color: rgb(12, 137, 207);&quot; target=&quot;_blank&quot;&gt;&lt;/a&gt;先添加依赖&lt;/h2&gt;','','阿萨德','1','2018-03-03 02:09:35','1','2018-03-03 02:10:21','胜多负少','0');

/*Table structure for table `test_data` */

DROP TABLE IF EXISTS `test_data`;

CREATE TABLE `test_data` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `user_id` varchar(64) DEFAULT NULL COMMENT '归属用户',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属部门',
  `area_id` varchar(64) DEFAULT NULL COMMENT '归属区域',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `sex` char(1) DEFAULT NULL COMMENT '性别',
  `in_date` date DEFAULT NULL COMMENT '加入日期',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_data_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务数据表';

/*Data for the table `test_data` */

insert  into `test_data`(`id`,`user_id`,`office_id`,`area_id`,`name`,`sex`,`in_date`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('67af42ec8f024999bce2fc62b9825d55','3','3','5','tstest测试一下','1','2018-01-30','1','2018-03-03 01:02:53','1','2018-03-07 11:05:08','执行一下，看看','0');

/*Table structure for table `test_data_child` */

DROP TABLE IF EXISTS `test_data_child`;

CREATE TABLE `test_data_child` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `test_data_main_id` varchar(64) DEFAULT NULL COMMENT '业务主表ID',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_data_child_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务数据子表';

/*Data for the table `test_data_child` */

insert  into `test_data_child`(`id`,`test_data_main_id`,`name`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('8bfc4d20bdd04c0ba1f7acff89de2d65','ddd601f39f004a2e8b6bb672bc6af17b','222','1','2018-03-12 14:17:33','1','2018-03-12 14:17:33','222','0'),('d99738b79c7e4f98ac7dbafefd368b0c','ddd601f39f004a2e8b6bb672bc6af17b','11','1','2018-03-12 14:17:33','1','2018-03-12 14:17:33','111','0');

/*Table structure for table `test_data_main` */

DROP TABLE IF EXISTS `test_data_main`;

CREATE TABLE `test_data_main` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `user_id` varchar(64) DEFAULT NULL COMMENT '归属用户',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属部门',
  `area_id` varchar(64) DEFAULT NULL COMMENT '归属区域',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `sex` char(1) DEFAULT NULL COMMENT '性别',
  `in_date` date DEFAULT NULL COMMENT '加入日期',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_data_main_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务数据表';

/*Data for the table `test_data_main` */

insert  into `test_data_main`(`id`,`user_id`,`office_id`,`area_id`,`name`,`sex`,`in_date`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('ddd601f39f004a2e8b6bb672bc6af17b','','','','test','',NULL,'1','2018-03-12 14:17:32','1','2018-03-12 14:17:32','','0');

/*Table structure for table `test_tree` */

DROP TABLE IF EXISTS `test_tree`;

CREATE TABLE `test_tree` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_tree_del_flag` (`del_flag`),
  KEY `test_data_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='树结构表';

/*Data for the table `test_tree` */

/* Function  structure for function  `gen_seq_number` */

/*!50003 DROP FUNCTION IF EXISTS `gen_seq_number` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`cuipy`@`%` FUNCTION `gen_seq_number`(keyCode varchar(32),addCount int) RETURNS int(11)
BEGIN
  declare val int;
  declare rowCount int;
  
  
  if keyCode is null or length(keyCode)>32 then
    SIGNAL SQLSTATE 'HY611' SET MESSAGE_TEXT = 'keyCode不能为空，且最大为32位字符串';
  end if;
  
  select count(*) into rowCount from gen_seq_number where key_code=keyCode;
  
  if rowCount=0 then
    insert into gen_seq_number (noid,key_code,curr_val)
    values(replace(uuid(),'-',''),keyCode,0);
  end if;
  
  if addCount>0 then
	update gen_seq_number set curr_val=curr_val+addCount where key_code=keyCode ;
  end if;
  
  select curr_val into val from gen_seq_number where key_code=keyCode limit 1;
  
  return val;

end */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
