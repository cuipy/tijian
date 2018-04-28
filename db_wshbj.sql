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

insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('13531562715648eb95ded20283949233',1,'source',NULL,'{\"id\":\"canvas\",\"resourceId\":\"canvas\",\"properties\":{\"process_author\":\"jeesite\"},\"stencilset\":{\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\"}}',NULL),('56ffeda858254176979f10adf9416e65',1,'test_audit.png','bcd1a51bb11b4c4ca58480103ab969f7','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0Ü\0\0|\0\0\0=Ó³Ú\0\0SâIDATxÚíİ|TõÿÿS Š·¿h©Ë²ülêeÕ®Z1†‹4–X â­K]Š¬RVV©\"ÔZ/À\"\Z1…c\nÄ€‘†šD.IácŒ1f¥˜EÄÒcã÷>ß9ç03™I2I˜ÌL^ÏÇãóÈ\\Î\\2çû>s>sÎœ1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€î§/\0\0\0\0\0+Á,eı\0\0\0\0\0 Ş¬/ÌJ²şá%\0\0\0\0 sšm»É–-ÜŸÑt\0\0\0\0ĞyÍvk—\0\0\0\0€V$´ÒTÛ×ón\0\0\0\0\0‚l¶[k¦ÙÒ\r\0\0\0\0@ÅÁm¹vz\0\0\0\0\0ºm³=¦·«£é\0\0\0\0 óšíÎº=\0\0\0\0\0Q§µ¤…ú~\0\0\0\0\0ˆšf»³vgK7\0\0\0\0 Ûó=àÙ÷ÌºÓúßÛq 5\0\0\0\0@·o¶Çx4ÍËÌRÖß¶6İnGÓ\r\0\0\0\0èöÍ¶¸ÓjšUM·g³m×DëùN7\0\0\0\0 ÛÔûk[jºıMŸêgz¾Ó\r\0\0\0\0è6ÍvBM´¿¦»­Í¶oÓÍîå\0\0\0\0€¨ÓÖ¦·µ¦;ØfÛóñ?3ØÒ\r\0\0\0\0ˆÂf»­Ín ¦»G;›mßé\0\0\0\0tÛf»¥¦»ªÍvGŸ\0\0\0\0\0a££[”ı5İi¶}›n¾Ó\r\0\0\0\0],Î¬ÇÍÊ6k§Õ¬)ªM•ÔÁ×^v#÷İ²]e]ŞIÌŠ¢(Š¢(*ÊªÎ¬j³rÍzÆpohêE;‡pÔ×\Z¤ŸšUdÖ³Æ™u±Y}xyÚ¤µ£’·¦¥-Ümùî@ØÂ\r\0\0€h$}Ê Ã½‡©ô2[Í:h¸76õãåA¸˜l5Ú‹Íº€—£C¤¹­3NÌw¸ÛÓtón\0\0\0t\'ÌJ¶Ögòr +Éîo˜•o¸·d£óšî`¶(úé/G)¦éæ(å\0\0\0è®dËw¹áşšìé¼è\nÒlg|ÏáD6İ­5»­ıÎvk¿ÓÈƒßá\0\0@÷ÖÇêw²éyj²y>ï„jmskÍ¶ÑÎ¦ÛŞ­}³\0\0\0\04İzK÷#¼9@š|g›İÈO¼@[ºÛÚlÛtÛG³\r\0\0\0¸Éîå²÷\'RCHÈü’yB&Áh¾{÷Fğ¿³í¯éèó8|g\0\0\0hNúŸ$^„‚lİæhä¡oº=¤æÙ<·¥Ù6Z¹?ı\0\0\0&G/—Ÿã+µ8¡â÷ïl#ô|w/—fy¢üO}ùŞ®£¿ÿ\r\0\0\0t[YgÆ‰ö”YsxÂ¦éî(»«\0\0\0hNú gxp\"É!ñ9 Vt4İİ¼\0\0\0ÑLÖ›syp\"í48:y8èènàìF\0\0\0GV^ÍË€Iš´>¼aÕt»…š¤\0\0\0Á“>¨—\'’â%+ÁîÎnä\0\0\0\0ı`èä&zˆáşDïà\0\0\0ôC`€¡¬f:¡…ë?£Ù\0\0\0è‡À\0Cğméf7r\0\0\0€~0trÓM³\r\0\0\0Ğ†Nnº“h¶\0\0\0ú!0ÀĞ¹¦YóŠŸş\0\0\0è‡À\0C\'Ê²æU/^\n\0\0\0€~0t8³\\[¸\0\0\0ú!0ÀĞ©2­ù$µ“—\0\0\0 7Ä8¾uÛ.š\0\0\0Ğ†Êòi¶í­Ü|—\0\0\0 íäoë¶]ãxy\0\0\0\0ú!0ÀĞ>Ùšm©\"^\0\0\0€~0¯¥­Û|—\0\0\0 í”ÕJ³ÍË\0\0\0ú!0ÀÀ¼\0\0\0XÇÌ+\0\0\0€ul€Æ¼\0\0\0À:6``^\0\0\0¬cƒæ\0\0\0À:6À\0c^\0\0\0`00¯\0\0\0\0Ö±Á\0ó\n\0\0\0``€1¯\0\0\0\0°\r˜W\0\0\0\0ëØ`€y\0\0\0°\r0À˜W\0\0\0\0XÇÌ+\0\0\0€ul0ÀÀ¼\0\0\0XÇ`Ì+\0\0\0\0¬cƒæ\0\0\0À:6``^\0\0\0¬c0æ\0\0\0\0Ö±Á\0ó\n\0\0\0`00¯\0\0\0\0Ö±ó\n\0\0\0\0ëØ`€y\0\0\0°\r˜W\0\0\0\0ëØ\0Œy\0\0\0°\r0À˜W¼\0\0\0\0ëØ`€y\0\0\0°\r˜W\0\0\0\0ëØ\0Œy\0\0\0€ul0ÀÀ¼\0\0\0XÇÌ+\0\0\0€ul€Æ¼\0\0\0À:6``^\0\0\0¬cƒæ\0\0\0À:6À\0c^\0\0\0`00¯\0\0\0\0Ö±Á\0ó\n\0\0\0``€1¯\0\0\0\0°\r˜W\0\0\0\0ëØ`€y\0\0\0°\r0À˜W\0\0\0\0XÇ,¤ÿ°R½SRRfNœ8qolllCïŞ½•õ:PP={öüîüóÏÿløğáÍ¿#‰\0\0\0è‡À\0ë–-[vÏÈ‘#ëcbbÔœ9³U~~jhøÊìÁ¿£:©äõ,**T‰‰Ï©6öïß¯ùÒ_LÔ\0\0\0@?X”JM}e}¿~ıTRÒÊåj4›Ã&*•œ¼HõéÓç«SO=õ&â\0\0\0ú!0À¢°Ù¾à‚TQÑv³	ü–\nq•——©¾}ûşÃœcˆ\0\0\0è‡À\0‹Ë–-½G¶lm3›?—W-]ú’\Z3&A\Zu½ºşúkÔ\rñ#Uò¢¤fÓQ¯òò½ê”SNùÂ`÷r\0\0\0ĞÿœR½G¼¦>)éyóä7^µbùR5úç£Ô­·ŒÕ5vÌ*>şZ5tèj‘nº¿¡:¹çŞ«W¯<b\0\0\0ú!0À\"\\JÊÂ™11?R.W½Ùğ5zUÂ¨xİhßpÃH§~ö³ëÔğaWšMwl³é©Î©³Ï>ûSsÖÄ=\0\0\0ĞÁ&Nœ°wÎœ\'ÍFïëf5bxœzaÁ|•õV†Jy1IoÙ¾jÄP}¹œv¹¾ô{;ªc5mÚ½;ÍY“Hô\0\0\0@?X‹ÒŸŸc6z\rÍêî»\'ªƒıTmİòÊşÓµêÕTµ>sú¸úCõ?S\'«o¿ıÒïí¨Õ»ïæ0gÍN¢\0\0\0ú!0À\"XïŞ½UCÃçf£Wß¬›õ*.Ú¢voU»w•è’Ó;vlW=ößÛP/™æ¬q=\0\0\0ĞáÿŸR_6+—ëïjÖ¬™jÊo&©’’BUşŞ]»víPÓîûo5ãÁûÔ×_î÷¶TÇ‹\0\0\0è‡À\0‹Š†»Î«\Z?WëÖ½¦bcªª?ªTN¿Ï«JK‹ÕË/U¯¯NU\r\rŸ5»=ÕñbÁ\0\0\0ú!0À¢¢áş‡Sß}wL½µ!]\r\Z«jª«Ô{e»Uîæ*óÍ?ª´×WªÔW^2›ñ4½{ù•W^®ÒÓW¨o¿ıÂë>¨6\0\0\0Ğ\r÷1§¶nÙ¤k[šì¼¼ÍêÍŒtİh¯X¾D½¼x‘JzáYõÌ¼§õÔ¿´P]{Íµñí5^÷Au¼X°\0\0€~°¨h¸ÿîÔc³~§D.õ²ÔÅº–¼œ¬’-PÏ\'ÎSÿ;÷IõÄïQ3güV=ùÄ£f³©~7ó~¯û :^,Ø\0\0\0@?XT4Ü_8%\r·üØí·İ¬ŞH{U7ÚÒ|?;š;ç	õÜ³suÓ-Mø˜Ñ	jsÎÛVÃıÕ‰Å‚\r\0\0\0ôC`€EEÃ}Ô©½{·©G™¡~yû8İPË®äş*.nˆúõ„ñzkwié»^÷Au¼X°\0\0€~°¨h¸?÷*×7S_~ù©J|îi•0ê:5bø•jèĞ+TÜ•CÔP³Ñ¾æêáêûïQÇıEOë{{ªãÅ‚\r\0\0\0ôC`€EEÃ}„\n³bÁ\0\0\0ú!0À¢¢áşŒ\n³bÁ\0\0\0ú!0À¢¢á>L…Y±`\0\0\0ı`QÑpÿ\n³bÁ\0\0\0ú!0À¢¢á>D…Y±`\0\0\0ı`QÑp¤Â¬X°\0\0€~°¨h¸PaVmwO˜Õ@<\0\0@?XX7Ü¥Â¬ZwÒhm]ÏÂ\0\0\0ôC`€…wÃ]ë·äº…g«ÄÄÇuíÛW¬/+)Ùğ6Á–Ü_ffªs:\'çu}ººz[ÀÛ”—¿£öìÉñz¾ÏKÎÏš5­ÙcÍŸ?KŸ>th×uUU[ôõG”7{¼ÚÚÒf—UVèékj\nõù\r–«3Î8½İÿ»¿ëZi´i¸\0\0@?Xø7ÜŸú­ã\r¡÷eYY+¼.»ùæ5yò¯Ì†¼H—œ¾÷Ş;ór›¹sr¦ïÙ³§JNã\\çnæİ§ËËÿl6Îo«3Ï<CO[]½U?İ`nÜøª\Z?şjÂ„[ôi¹¬¶v§ş+Óz>Ï•+_pNïß¿Cÿ­¬ÌWkõiyLÏégÏ©}_ÿÏr~Ê”ÿtÃ¾/Ïéü·^ç/¿ü\'zúÑ£¯×ÏÏ¾îÆGªéÓ£ïÜsÿEÍ˜1ÅlğßÕ·©¨ÈøÚ[ógáŞu\\(\0\0\0€~°ğm¸÷û-»©LL|L—İoÙ².àm¤.¼ğÇ*6öÒ§±ï_šÏÃ‡÷èó”ê¿yyéúºúú*}^[ÎŸrJoİ|o6Ãw˜ÍíJ}ù±cX[¸³Ô¡C»Ë—,™¯ŸKFÆµ`Áïõeuu•úoAÁ\ZçyH.—55íÓ«ªÜ[¯åù¬Y³XmØ°ÌëyÛÓeg¯R¥¥Unnš~Îr^şû±ııÏò?ÈëwÎ9?PÃ†]®Ÿ«ı|÷ï/özmÿ[´i¸\0\0@?Xä4ÜiVee›Ô=Ùª±ñc¯ª­İ¡D·±ëxÃíÿú‚‚?ªk¯S99¯©””9ê´ÓN5›æ\nuòÉ\'©;î¸Élbß6›ÚOœéíæR¦­«û@¥§¿¨<O-\\ø”¾\\¦w7ÓxİF¦—Ó.W*/ß¬/KM}N?VEÅŸõu‡íÒ—§¥-Rƒ_ ›yûööıÊë §íû^µ*ÉÚú¿Tİ|ó(çqìç“›ûzÀÿ]¶ÜËõ2¼ÆöcÉ}yN×†F›¢(Š¢(wÕ™µÇ¬l³1+Ş¬^¬ÂôC`€…IÃ½¯Y-Y2O]tÑ¿ª-[Ö¨Õ«ÿ ®»n˜š=ûA}^nSXø¦ßÛI¹îK^/eè-Éî-Ëóæ=¤Ùcí^¬¯—óÓ&%=¡øg³©®PÉÉOëË¦N`}Wû^½›º=}ccµó&\\]] ²²–©Wx•\\·mÛ:=}vö«ª¦f‹×ãz+øõmûö=[o–Ë-SkÖ¤è†úô»U|ü}ÙO~2H}¾oy.òá\\nß—L\'×ÅÄP—\\2ØlºW{=–\\çûúXóç³¾5Âsw³™5Æ¬ÇÍÊ5ë YIfõcÑ#i¶’#€÷#€~°¨j¸?iVrù]wıRŸNK[¨·B{^—™¹Äïí¤.¼0Æj¸›_W_ÿõ]çåú~d‹¶œ.+Ëvî÷¬³ÎÔ»\\ïß_è<4©éºÙ–¦UšÛU«^°¾‹½Íù+Ó§¦Î·¶Lo´\Zëµ~ÿ?û8zt¯õ}êÍú|mm‘óÜìiW¯NÒ§Şå\\&Íø7^«O.[¸ğIİh74|¨ÿOÏÇÊÈXìœ—\rššjœıİõœfÏÏg>½\Z ñ7¬¦AVtîañ´;GÉf}aÖL^€÷#€~°ˆn¸ÿ¯Y¹îÛÓÓ§ßåu]fæË~o\'u¼áö}qñ›úöv#+»rWW»·v»\\ÕÍî_Î/^,»“¿¯(Véé‹Ì¦ıbUSãnV*±¾Ã½Şld?V))³­¤åêÛoØ°T7õ“&İ¦Ënöåú††J§y•é\n×©‹.ºP7éî&<Çjæ·6{}Æ½^İzk‚Ù,oÒÿó‘#»Tvö\nëhë¯zMën¸½_‡ÄÄGõYY©~_ÿ\0óËw‹w¸’-\r²…a­Y§³Ú£rÃ½›,9x?è‡À\0‹Ì†»¦Yú\'ÁPõõï[JK7›Ğ5fC[m6¬ËüŞÆ®ã\r·ÿëkkÕòåÏZ?ÓõÙlç©óÎûjîÜÇv7ÜÇŸKrò“º¡İ·o‹n¸å²ÆÆ­­ÄyÖ.àif½ÙlÚ?²šù>ÏÇ8v¬Ìy^rÿ†>`Z‘ÙHg[ßÚïí¥á¶ÿOy\\ù~öwüBßV®_°`–3­\\ôènuÙeÿ¦fÏ®/—×ÔĞßù^å÷ş[™oöïp&ßŸË²Vr\0´O+GÙßIx?è‡À\0‹Ä†ûc¿uäH©õ³]èó›œ­Á\r\rú²Ã‡KÔM7Åëš2e¼Ù<¾ª·Ú{n}Z*--É:Ùz}CWz»Õ,¿£ZC%ü#çúÌÌÅÎóóÃ†ıÔlôSUFFŠJM}F?†}Ü‡¡wñ^êu›òò?©ÂÂµº	–š4éV]r?î&8Çl‚İMë×ï‡ª¬Ì}´¼¼ÕÎó[¼x¶µõ{‰×kcè°=c6ı•ú¹İ{ïuèP±š7o¦úş÷{éûòœVjÕªçÿQCS^û1}ï?ŠVrdË»ókºeK÷#¼\0ïG\0ı`×pW{UNÎ\nİ¼öïÙtïlv½ÜfÚ´‰Îù††÷›M¨\Z?ĞÓËıËı>¼Ãj8_óºwó|ü|II†>ír}há;KŸojªr¦)(xİë6<ª§÷÷<äúââuúô¾}ú¯|w¼¦&OßÏàÁç;ÓÊc¹?0Èôºı…úºmÛÒÕèÑ×ª[oå÷ñä¹Û—WTd««¯¾B7ò¾÷¿zõ¯û¢1&»ó}jpà\Z £9úŒ¼ôC`€E\\ÃıQDUSÓ‡2M¨K{¦Âq\'®IbqtH29x?è‡À\0‹¸†»Š\n³ŠÂq\'G‹•#ÅòT€ä ºSÃı!f¥ãN¾;—À\"è­äàı ,¢\ZîJ*Ì*JÇİã†{W>\0í7‡¼ôC`€ETÃıf¥ãnŒáşi#\0ËQ./Àû@?XÄ4ÜT˜U”;9:ì)@‡sTÍË\0ğ~Ğ1\r÷ûT˜U”;ù-á:)\09È@?t£†»œ\n³ŠâqÇ G\09ÈĞ\Zî÷¨0+\Zn\0ä G\0y,*\Zî2*ÌŠ†\09È@^À\0‹Š†{/fEÃ\r€ä /`€EEÃ½‡\n³¢á@\0r0À¢¢áŞM…YÑp G\09È`îä“Oú®¡¡ÈlòvQaR_}U¸Ïœ5.ò€ä /`€E°Áƒ|(?‰Ùè•RaRë×?ÿ¶9kv’\'\0ä G\0y,‚]uÕeëæÌ™J£F5vìUiæ¬I$O\0È@\0òX0à±œóËµƒf7<ê“=zT˜³&< G\09È`®ÿ–&%=H³5fÌUKÍY’K\0#€ä°è0èÌ3O«/*ZAÓÛ…•Ÿ¿t½9/šu1y@\0r0À¢Gü9çœıwšî®k¶{ôèQcÎ‡1ä	\09È@^À\0‹Â¦û¤“¾lŞ¼û>ç;İ¡ûÎ¶µùÁnĞl³ÀÈ@\0òtë6¨gÏïåœ~ú©‡§L¹e÷¦M/lh(¤1îÄúê«íûä§¿ähäÖÒä;Û“\'\0ä G\0y¬{¸Ô¬9fm5«Áz¨Î)—áşmùé¯8ò€ä /`€!œeYóª/yÈ\0r0ÀĞ9d+±ËšW	¼ä	 G\0È@^À\0CçÈ4ï®½“—ƒ<ä\09È`è¸!Æñ­Ûváe!O\09@\0ò:&Ëh~P2ÙÊÍw¹É@\0#€¼€†vò·uÛ®q¼<ä	 G\0È@^À\0Cûdz«ˆ—‡<ä\09È`^K[·ù.7yÈ\0r0ÀĞNY­4Û±œ<ä\09È``^1\0#€ä00¯À<È@\0ò0À˜W`ä\09È``^1\0#€ä00¯À<È@\0ò0À˜W`ä\09È``^1\0#€ä00¯À<È@\0ò0À˜W`ä G\0È``^1\0#€ä00¯À<È@\0ò0À˜W`ä G\0È``^1\0#€ä00¯À<È@\0ò0À˜W`ä G\0È``^1\0r€ä00¯À<È@\0ò0À˜W`ä G\0ÈNˆ,k@µT;y™X€y#€äÎ³\\­4Ücx™X€y#€ä^vÍv‘Y½x‰X€y#€äŞ\Zîq¼<,À<È@\0ò´Ÿ¿ïrËw·ÙºÍÂ\0Ì#€ä /@øû.7ßİfa\0æ@\0r d\Zlİfa\0æ@\0r ÓÅy4Ü	¼,À<È@\0òtû»Ülİfa\0æ@\0r \ra€±0\0ó G\09È\"g)Õ;%%eæÄ‰÷ÆÆÆ6ôîİ;ĞÏpQ-TÏ=¿;ÿüó?>|øFóïHFæ@\0#€¼tcË–-»gäÈ‘õ111jÎœÙ*??O54|eöàßQA–¼nEE…*1ñ95pàÀÆşıûï5_â‹Y€y#\0ä /İLjê+ëûõë§’’^P.W£Ù46QXÉÉ‹TŸ>}¾:õÔSoba\0æ@\0#€¼t£fû‚.PEEÛÍæğ[êUyy™êÛ·ï?Œîù»á,˜G\09@\0òÒ½,[¶ôÙ²]T´Íl\n]^µtéKjÌ˜5jÔõêúë¯Q7ÄTÉ‹’šMGµ½ÊË÷ªSN9å£ûí^ÎÂ€y#\0ä /İhî(Õ{äÈkê“’7O~ãU+–/U£>JİzËX]cÇÜ¨âã¯UC‡^¡é¦ûª•˜8ÿó^½zå±0\0ó G\0È@^¢TJÊÂ™11?R.W½Ù6zUÂ¨xİhßpÃH§~ö³ëÔğaWšMwl³é©àêì³ÏşÔœq,À<È\0r—(4qâ„½sæ<i6€_7«ÃãÔæ«¬·2TÊ‹IzËöU#†êËå´Ëõ¥ßÛQm«iÓîİiÎ‚D`ä\09ÈKŠÒŸŸc6€\rÍêî»\'ªƒıTmİòÊşÓµêÕTµ>sú¸úCõ?S\'«o¿ıÒïí¨¶Õ»ïæ0gÁN`ä\09ÈKêİ»·jhøÜl\0ë›Õc³RÅE[Ôâ­j÷®]rzÇíê±Çò{ªí%¯»9\\İd¨%XƒRÇ G\0È@^ºÍRêËfårı]Íš5SMùÍ$URR¨ÊßÛ£k×®jÚ}ÿ­f<xŸúúëÏıŞ–j{u“€Ä›%GeO²ş!v,°r€ä¥›4Üu^ÕØø¹Z·î5ûSUıQ¥zpú}^UZZ¬†\\~©z}uªjhø¬Ùí©¶W7H¼O“-[¸?£éf\r#\0ä /İ¤áş‡Sß}wL½µ!]\r\Z«jª«Ô{e»Uîæ*óÍ?ª´×WªÔW^2›ñ4½{ù•W^®ÒÓW¨o¿ıÂë>¨¶W”Ä·Ùnír°ÀÈ\0r—hk¸9µuË&ı[ÛÒdçåmVof¤ëF{Åò%êåÅ‹TÒÏªgæ=­ ¶ø¥…êÚkF¨o¯ñºªíÅIh¥©¶¯ç;İ,°r€Qš—fİgÖZ³ªÍª³pƒYŸ˜•iÖLkº(n¸ÿîÔc³~§D.õ²ÔÅº–¼œ¬’-PÏ\'ÎSÿ;÷IõÄïQ3güV=ùÄ£f³©~7ó~¯û Ú^Qú†ÒÖfš-İ,°r€Q˜—qfåZMö+fİfÖ ³N·®—¿1V#dM—oÖ„èl¸¿pJ\Znù	°Ûo»Y½‘öªn´¥ù~vş5wÎê¹gçê¦[šğ1£Ôæœ·­†ûª…o(ñFp[®ƒ¬à\0ä G\0Â4/ÒDg›Un5Ó½‚¸­4ò›É[Íº º\Zî£Níİ»M=úÈõËÛÇé†Zv%÷WqqCÔ¯\'Œ×[»KKßõºªíeo(íİb-·«£éf\r#\0äˆÜ¼Œ7ë áŞE¼Wîç>ë~¢ek·Ùø}îU®oş¦¾üòS•øÜÓ*aÔujÄğ+ÕĞ¡W¨¸+‡¨¡f£}ÍÕÃÕ÷ß£û‹Ö÷öTÛ+ŠŞP:º{8»—³ÀÈ\0rDh^d%^¾“×I÷w©u“££á>BuQEÉJkHõı€€ä /!2Şjc:ù~c¬ûô-İfã÷ÕEo(}´q¶t³‚#\0äˆ¼HS,»Ç û¿ÔºÿA‘İp¦º¨\"ü\rÅ÷€gß3ëNëo0|oÇÔXÁÈ@\0D@^äHä3OğcÈwº·FvÃı7ª‹*‚ßP|·DK³¼Ìú–ÑtºM7+8\09È€0Î‹üô—¼wk¹»–›ß!ª‹*BßPüíö}§õ¿¨ šnÏfÛ®‰×ónVp\0r#\0aš—Ü®¨K©[¹ÍÆï ÕEo(š`ÍsKM·¿éSıLÏwºYÁÈ@\0„Y^îšõ\nácV`¶~à0¢m\r÷ª‹ª‹ÒÖ±¨ÙN¢‰ö×t·µÙömºÙ½œ€ä@äE¾W½8Ä™hœøï‹ûÂ+«¹Šk¹áşk‡Jî#3s™s:\'\'MŸ®®Şğ6ååï¨={6«’’^÷ãyŞ®}ûv¨“O>©MÏcüø›š]¶fÍ¿Ógg¯VgyF»ÿç””yòÚ…ñØhOÓÛZÓl³íùøŸléf G\09ĞåyYkÖm!~Li²Â°á¶+Ûğ¿UÓlüjƒ®={ªää9f3\\¬ï?1ñqç´4ÓÒ8»›ÙZ³ñŞ¦²²V:ÏeãÆUº10á}Z.«­-ÕeZ\'×rJï€ÏçĞ¡=zšşYßgÿşÿ¤ÒÒ^4›âÿU]ô¯Îã;VÙì~+*òTMM¡æÖ[®&Oş•3}qq–®°pƒ¾lÒ¤_ê¿ò8qq?Õ§¥6lX®Î;ïÜ _Ç.n¸[¾Ív[›İ@Mwv6Û6¾ÓÍ\n@\0r ò\"»w_âÇŒ1ëÓ0n¸=·jğn¸?mwÉígÌ˜¢Ş«Ï8°KÿÍËû£¾®¾ş#}^\Zr»iÎÊZ¡Æ½AM™òŸf³úªÓz÷Ûzúòò?ëæWJ¦‘æ¹_¿êÇ²o3qâmzZ—ëİğÊii´×«k¯ªæÍ{ØyÒxÛÏùÈ‘÷Ô°aCôıØÏË~Ş†ŞZŸêœÎÈXêœ^³f±s²Å]nkŸÿş÷{©Çÿm»^¿0íi¶[jº«:Ğlwôù€€ä /¤Î¬ÓCü˜òx\rĞp{nÕŒs7Üûƒ®‚‚5º©ÍÉYm6³sÕi§j6ÍèFô;Æ©ÒÒª©iŸ3½ı¸2m]]¥JOOQ¯.|Z_.ÓË_¹Îßã]xáUlì¥Ÿ<îèÑ×©I“n7é•jñâyz´4èöerÿiiÉÎmäùÉe••ùª¬,ÇlÜÿOŸÏÎ^å<gyrº¡¡Z•—çšÍz™.¹nåÊôéššmºÑoÏëf\r·ïØèèeMwGšmß¦›ït³‚#€ä¥…TEb)õ—v•Ü¶ª*_ÿ7ï!³ùÜkí¾C_/ç=§MJzBïŠ]W÷JN­/›:õ×úï¬Y÷éİÔ=Öñ†»ùuöãîß_¤ÿï4ÙYYËõ‡ûöªŠŠ?{İî‰\'î×[Üo¿}´Ú²e­ª®~WßşĞ¡]ÎsÎÈXâõ?¤¥-R[[Â—êÓÙÙ¯êÇhïkæ•ÔÁLÈnä¾[¶«¬Ë;\"Éº¯>,cYÁÈ@\0òZláÜ@í4Ü[,í#¸›ß¾ ª¾¾R]~ùOÌ†v…¾Ï;î¸IŸ.+Ûä4¢gu¦:çœè&Xn#—_rÉ`UPğG³Ù~ZÅÄĞ[¤W­zA_·oßvç¯ı8Û¶­S“\'W¹¹«õîäRò8Ë—\'êi]®›=7ûñíóÕú2¹ßé**r×åèÑ2³¡¿DÅÇğš&#ãe¯ó#F\\áüßòÜä´lİ¾ùæQA¿ö}†ñØhí¨ä­iiw[~§;¶p³‚#€èÂ¼ğîÖ›)ãxÃıIĞU\\œi6¶Kô}¯^¤¾@UW8°»ñ]âL/ç/–İÉ+Ô;Tzz²nÚkjì­Ê;­ïpopnÓØø‘súÂctCÜÚó’ûé&MºÍl†—«¬¬eêŒ3Nóšfß¾mú¾¥}TõU*//Íjø·9mèİËWzİ·ı?úàoËõiiæİˆşu“†;ĞØ°›Û:ãÄ|‡»=M7ßáf G\09ĞÅyá(åÇ›š\"³Æ“Ülüş/èª­-TË—?§cşü‡Ìf;_¥{îÜúzwsú²3½œON~J9²Ëlj·š\r÷\"}Ycc•utr÷®éoø}¼ã\rwËÏKîãá‡ïÑa—»q^ÑlZû±kj\nÔáÃ¥ÎóëªªŞq®ó¼ïøøáºÑ6ôîÿĞ§ûö=KÍ˜1¹]¯c7Ü­\rß&·­[”ıô—¿£”Óts”rVp\0r#\0a~‡»å­–>\rwMĞeèïjZMjJIqü¬©©Ú¹ŞİpŸ~Ø0ù­e*#ã%•šúŒŞåÜ¾NîCşfe½â÷ñ7Üîó.×GÖ®à»›=/ÏÇµ/ów¿õõï[[µ·Xßß¦Ÿ‡\\.»¼Ëóméÿ—ÿ¥=¯ïı„ñØğ×t·Öì¶ö;Û­ıNw C~‡›€ä@Xäe€YŸÙPt”ìÆ‰3H©ƒªÆÆJÕĞPa6±KuÃtøp‰ş›—·Ú™Æİä.õ:_Rò¦>ír¹·,—•½­Ï75}äLSPf6¼åêæ›¦æÎ}P%&>b6Äïª©SÿSM›6QŸ–*,\\«N;íuìØ^¯çf8»”ßªkãÆT«¡§ÙÿQW÷uà¶ÿÔÏÉ~.òa€ïÿã[†Şj¾<è×ÎßıDĞXimskÍ¶ÑÎ¦ÛŞ­}ËSVp\0r#\0á‘—\\#t[Ã¤!Ø\Z©3H©êWSSUDİï‰zœ|C	´¥»­Ív°M·ıx4Û¬à\0ä G\0Â(/²‚^n„f+·ì¢;!rî¨.ª}C‘-İ¾»wßiÿ;Ûşšî‰>Ãw¶YÁÈ@\0„i^òÿ½jù¾øV#´»¯wrÃ]EuQEğŠïO†y6Ïmi¶VnÇO±‚#€ó¼Ä˜uĞ¬¸tÿ—Z÷?(’gRR]Tş†â»{¹4ËàêË÷vııo°‚#€ä%DÆî¨Åœ€f^îwB¤Ï ¥*©.ª(xCéìßÅö·»:XÁÈ@\0„q^&YÍqgmé¾Ôº¿G¢a)õÕE%o(ÕtwvóVp\0r#€¼„ˆlé–-gòî|ßZ¾³}Ğjâ£b)UAuQEÑJGwg7rØ\09@€ÏKŒáş¹°òv¬ØËÖ·\"Ã}€´AÑ4ƒ”zŸê¢Š²7”öUœ¤±ÀÈ\0rDQ^n³\ZoÙ-|±áş	±Ì:İºşt«9— Ñ¬j«ÑdDîÑÈ[h¸Ë©.ª(|C	v·pv#g\r#\0äˆÒ¼0ë³ÖZÍwƒõ„åï§feî]Ğc¢y)õÕE¥o(mm¢‡˜Ug}àØ\09@\0ò\rwÕEÅI°šé„®ÿŒf›6@\0#€¼DyÃ½—ê¢Šò€ÚÒÍnä,°r€ä¥»4Ü{¨.ªnßæšf›6@\0#€¼t\'Ÿ|Òw\r\rÅfó·›\nq}õUá>s¸ºÁ0³›ì$šmØ\09@\0òÒmüãCùùKÍpâZ¿ş…·ÍY°³›µkaÀO±ÀÈ\0r—îáª«.[7gÎT³,¥B\\cÇ^•f¸v…˜G\09@\0òmøAì€ç|ãrí 	m}Ò£G\nsÄ±0\0ó G\0È@^¢Tÿş?,MJz&8„5fÌUKÍ—>—…˜G\09@\0òİyæiõEE+h†CPùùK×›¯ùA³.fa\0æ@\0#€¼D¿øsÎ9ûï4İ\'¾ÙîÑ£GÑ=ÔÍÂ€y#\0ä /İ·é>é¤ï›7ï¾ÏùNwçgÛÚü Ñ}‹…ó G\0È@^ºµA={~/çôÓO=<eÊ-»7mzñ`CC!\rs;ê«¯¶ï[¿şù·åhäÖÒä;Û³0\0ó G\0È@^º·KÍšcÖV³\Z¬IW.Ãı;ÛòÓ_q)Ì#€ G\0yÀÂ€y€ä /\0X€y#€ä\00\0r€ä\0æ\0r#€¼\0`a\0æ@\0r\0,À<È\0r\0,˜G\0È@\0ò€…˜G\09È@^\0°0\0ó G\0È@^\0°0` G\09È\0`ä G\0yÀÂ\0Ì#€ G\0yÀÂ€y€ä /\0X€y#€ä\00\0r#\0ä\0æ\0r#€¼\0`a\0æ@\0r\0,À<È@\0\0,˜G\0È@\0ò€…˜G\09È@^\0°0\0ó G\09@^\0°0`ä\09È\0`ä G\0yÀÂ\0Ì#€ä\0yÀÂ€y#\0ä /\0X0x	\0r#€¼\0`a\0æ@\0r\0`aÀ<È\0r\0,˜G\0È@\0ò€…˜G\09È@^\0°0\0ó G\0È@^\0´[–ş–j\'/l€ G\0yœ!f¹Zi¸Çğ2±ÀÈ\0r\0ÁËn¡Ù.2«/l€ G\0y¼!-4ÜãxyX`ä\09È€öó÷]nùî6[·Y`ä\09È€ğ÷]n¾»Í G\0È@^\0t‚Lƒ­Û,°r€ä@§‹óh¸x9X`ä\09È€Îc—›­Û,°r€ä@\'\ZÂÂ€6@\0#€¼\0áŸ*¥z§¤¤Ìœ8qâŞØØØ†Ş½{úù-*ˆêÙ³çwçŸşgÃ‡ßhşÉ›Qäˆ‘#rDÈ9\"/@7²lÙ²{FY£æÌ™­òóóTCÃWæ²ú;ªƒ%¯cQQ¡JL|N\r8°±ÿş{Í—übVpÈEÈ9\"Gäˆ‘#òD¹ÔÔWÖ÷ë×O%%½ \\®FsaÒDÀJN^¤úôéóÕ©§z+8äˆ\"Gäˆ‘#rDÈy¢x¡|Á¨¢¢íæBã[*DU^^¦úöíû£{ü~¸\"G9\"Gäˆ‘#rDÈĞ­,[¶ôù´¨h›¹°pyÕÒ¥/©1cÔ¨Q×«ë¯¿Fİ?R%/Jj6Õş*/ß«N9å”/ŒèßO‘#rDÈ9\"Gäˆ‘#òtr ‘#¯©OJzŞ<ùW­X¾Tşù(uë-cus£Š¿V\rz…Z¤ÎßPT‰‰ó?ïÕ«W+8äˆ\"Gäˆ‘#rDÈy¢DJÊÂ™11?R.W½¹€hôª„Qñz|Ã\r#úÙÏ®SÃ‡]i.œc›MOu¬Î>ûìOÍYÇ\n9¢È9\"Gäˆ‘#rD^€(0qâ„½sæ<i.¾nV#†Ç©ÌWYoe¨”“ô\' Wª/—Ó.×—~oGµ¯¦M»w§9KYÁ!G9\"Gäˆ‘#rDÈbc‡4äçç˜††fu÷İÕÁ¿~ª¶nyGeÿiƒZõjªZŸ¹F}\\ı¡úŸ©“Õ·ß~é÷vTûêİws˜³d\'+8äˆ\"Gäˆ‘#rDÈy¢@ïŞ½UCÃçæ‚¡¾Y=6ë!U\\´Eí(Şªvï*Ñ%§wìØ®{ì!¿·¡Ú_2ÌYâb‡Qäˆ‘#rDÈ9\"/@”¼é(õe³r¹ş®fÍš©¦üf’*))TåïíÑµk×5í¾ÿV3¼O}ıõç~oKµ¿¢|¡¦È9\"Gäˆ‘#rDÈyºYÃ]çUŸ«uë^S±±?UÕUª§ßçU¥¥ÅjÈå—ª×W§ª††Ïšİj±‚C(rDÈ9\"Gäˆ‘ ªÌÿpê»ï©·6¤«aCcUMu•z¯l·Êİ¼Qe¾ùG•öúJ•úÊKæB;Mï†tå•—«ôôêÛo¿ğºªıÅ\n9¢È9\"Gäˆ‘#rD^€¨Z0sjë–Mú7eaœ—·Y½™‘®È+–/Q//^¤’^xV=3ïi} Å/-T×^3Bm|{×}Pí/VpÈEÈ9\"Gäˆ‘#òDÕ‚ùïN=6ëwúˆ•²\0^–ºX×’—“Uò¢êùÄyêç>©øı#jæŒßª\'ŸxÔ\\(gªßÍ¼ßë>¨ö+8äˆ\"Gäˆ‘#rDÈy¢jÁü…S²`–ŸŠ¸ı¶›Õi¯ê²,¤Ÿ?GÍó„zîÙ¹zá,ë1£Ôæœ·­óT\'+8äˆ\"Gäˆ‘#rDÈy¢jÁ|Ô©½{·©G™¡~yû8½à•]üU\\Üõë	ãõ§¢¥¥ïzİÕşb‡Qäˆ‘#rDÈ9ê\"YÖsn©v\Z\0‚]0îU®oş¦¾üòS•øÜÓ*aÔujÄğ+ÕĞ¡W¨¸+‡¨¡æùš«‡«î¿G;ö=­ïí©ö+8äˆ\"Gäˆ‘#rDÈQb¸;¼¥†{íô‚ù&Å\n9¢È9¢È9\"Gä¨e·Ğl™Õ‹ö	zÁü&Å\n9¢È9¢È9\"Gä¨\ri¡áGë´kÁ|˜\n“Šâ•€ëK G9\"Gäˆ‘#rDÂš¿ïrËw·Ùº\r´oÁü7*L*JWpâÍúÂ¬$ëïrD‘#rDÈ9\"Gä(lùû.7ßİÚ¿`>D…IEá\nN¼ÏJlQø,\nÚŒ_rDÈ9\"GäˆŠ¦e\Zlİ:kÁ|\n“Š²œø\0[â£pËã—‘#rDÈ9¢¢)Gq\rw´~Õ‚ù\0&E+8	­¬ÄØ×\'#Š‘#rDÈ9\"GaÉş.7[·-˜ÿJ…IEÉ\nN[W^¢iËã—‘#rDÈ9¢\"=GÌºÏ¬µfU›Uoı\rf}b¸w3ŸiM íæZ*L*\nVpâƒÜRìôäˆ\"Gäˆ\"Gäˆ‘£Î%?÷•k5Öª•oÖZ) MæO©0©_Áiï¹]]„¯ä0~É9\"Gäˆ‘#*ÒrcVvM¶¿ÚjÖ´T@‹æıT˜T¯àttw¼HßñKÈ9\"GäˆQ‘”£ñ†ûHıÍ³ËjÀ\'›u±Y}­iû˜5Èºìnî»%\\>¨bk7xÁü*L*BWpZ; M¨ï‡‘#rD(rD(rØÃûw¶åt¢áŞâİı¬é}«{2­àwÁ¼\n“ŠÀœÎ>ºk¤nY`ü’#rDÈ9\"GT$äh¼O£\\i¸·f·‡Ü®Ü§éfK7Ğ|ÁüI›K¦ß¶m­ª¬ü³>}àÀ¿Óåå¥©#†¨É“ÿCMšt›WmÜ¸\\ee-S-=¶\\7mÚm~^«W\'©óÎ;7àõ55ïêû¬¯ÿ@×†\r¯¨Ïs®ß·o›×ô%%TYY¶>-?jVréÍ÷òåÏ9çëê*‚~}#hìø`æ{fİiı\r†ïí\"ñÀ5äˆ‘£çˆ:±EÈ•9Š1¼w#—ï_÷íà}Êîæ¹†÷îåƒh±\0¯óÿµ©JKßÒAºùæQze_Nß{ï¯õé3Ï<C-\\ø„3­œ—é<oß¿ÿ?©k¯Ó§«TK-×İtÓ\rm~nıúıP]}ul‹ÓHc ÓTWçëûn6,©Îÿâ^Á÷~oè¿\'Ş¢¶lù£FÎ?õÔıê;~¡rs_ÓÓ–”¬××/Xğ˜¾^.ÏÈX¬.ºèB}›}û¶êË/ÓâsŒ ßOşeåd™õü—±’èv‘¶’CÈ9\na¨_äˆQQ™#ÏÆ¸²šmÏ¦»Ü§‘p|Á\\Ój;V¦tùå;—ÉùÌÌ—õé={²¼¦w7\n?óº,=}‘¹R¾Ì\\iŞb6\nª–[®“Æ\"ĞõMMÕú>ì:ãŒÓÔèÑ#óGîV……ëœéKJ2u3Q\\œ¡.»ìßôí{öì©WäåùÔ×¿ïLër}¤ÿÊe2½<—Ã‡wªÔÔgÔi§ªÿ‡5k’ULÌ\0ç6r½¼öãËmöïß¦ÿÊôöëçû:ùû¿#påÆ°¶xîNÔ–•Ï•»&z\\Iß¡#Gäˆ…(GThŠ‘#*êr4ÎğşÎöÅ|ÿŞ»ª³k9p|Áüq‹UW÷\Z0 ŸÊÊZªN9¥·züñ{Unî«:L“&İªOŸ{n¯Ûôí{–ÊÎ^®FºJM™2Ş\\YNÕÓŸvÚ)fÃ°PUW¿£=vS“{7Si6ZzN²«íØ±×9ÏeÂ„›ôi©yófzİiézkå}«>Ÿ“³RŸ·#GJi+*6éËjk·«¼¼ÕÎõîÆh±FÃ÷ùÉõwİu»ª¬ÌÑ§+õß}ûÜ»áÊshíµ€œ@+şVVZZÉñ7}ªŸé#å;täˆ‘£äˆ\n]‘#rDE]<·n\' ÇxÆ`+7àoÁ\\İbÕÕ•é¿7¾¢‚œœæÊoSaá\ZU^¾QwŞÿóºÍñ-sîóyy¯Y»·Æëó¨@½gÏ[Ö–¹sÌ¦¡ªÕç\'%Ó§§ÿÁ9¿aÃË*&æ_œó)jàÀ«ªªÍê’K©Ù³p®+.^§o/[ì<ïïw¿›l64¶š÷V¶Y³¦êÿ=--É¹y}bcÿ]M›6Ñl2õãÈ4©©óÔYgi6;õmí×±µÿ#DÜX¹Ib¥ÅßJN[Wn|Wrºbw¾¶¾Väˆ‘£äˆ\n]‘#rDEUÇ·>»¬ó\'‚½Üó\'Ãbhµ\0½`ş¨M•™ù’:ùä“tÃ°jÕszWÒ‡¢Ïÿû½ô_{Zw£pƒ>½o_¾Ó$ØÓ46V¨@-—}­¹¿VŸnjú°Åçeßeå&ç2Ù’8bÄå^Óee-Ñ»ÌNŸş_jÒ¤[tÉó‘Ûfd¼è÷y:TèÜ·ü•†@n#MŒıÿI¹\\•êÀíÎùÒÒ7õó¶ïûÈ‘ëàXÛ[ü_B´`¶GĞqm¼M[W2Z[É	våÆóñ?ë‚-m}­È9\"G!Ìuâ‹‘#*ªrtŸÇtY\'øù¬õx¬™´Z€^0WµXlS¹¹+Ôµ×Æªo¼ZŸ;÷¤yóTS¦ü‡¾LÎ—”¬Ó·±…ÊÊlke¿RoÉ’ûëßWş[¦“ËÓÒèórzÁ‚GZ|~2Íüù3›]vûí	^—mÜ¸T×Ô¾şê«¯pNoØ°Ø™nÿş=­\\ŞĞğş[U•£òòV9Ï;1ñ!³‰ØîÜ¦¾~¯¾Ü~}ìÛÈßììTçq23SZı_B¸`¶+»•OFƒİ.ĞJNv®ÜønÑåJN[_+rDÈQrä9·m{ÃÉ†äËßt2ŞäC£É“ow> :şAÑR••õ²ßÕÖnÑ·õ|<É©¿Ç(/[_ïr} êêö8U]½YhÔÒÿ!ãy^2PSóçÿï””\'[}m~ø7ÎiÏììÙ³>¨×˜EwÚ2ìå­œÎÉY¦OËØtÉƒŒ3û}Ì¾­ïùY³î	øäù¾ e¿9²£ÕÙ%ÏÕóyÊíåëS·¼O=ºS¦«-[^WÓ¦ıZÿ•=ÏZËq„äÈ³	t‚ŸÏø6÷@¤4Ü¶XMM˜+ÎyYé-t7İt½µğm~i\n.ºè½°;z´Ä\\`¿hí^z·¾¾±±\\ù{l¹lêÔ_9ç«ª6y4ÍGv;•Çñw?«V=ëu™¬Xıä\'ÿÚìz÷\nÉ+Ín?lØeæB6C_·¾µòï~>ıúõÕ×ÙÓÛÿOnîrçö••Ò·lY­/—Óyy¯¶øZwÑ‚Ùó“Ñ\\¹ii%§ª+7}>\'úµ\"Gäˆ… GR2f}¤ÿÌ¦y‰u¤ÿÿÔ§İGúÌ™öø^\"Ço/{V¸?´\nœ!{ÉcÕÕí¶šÕÌ€Ó=şøT}º¤d­:v¬Ô¹Íøñ£é)Véé/èLH—/Ÿ§§±›ş)S~édÜ^VÈÊ¿ü_“&İ¬ÿÊ^\'qq—èÓR6¼d}Åûù¬\\9ß9½fÍšnK‘£èÎQ ’½®’“¯öíËs>µO——gé1î>öÆ‡ú½É¿†>¸å=æ\'Lø…“ÍÚZ÷ñ7ÜÍ¯ÿ1j¿7Èò¾ à5ë¸y^ÓÏı[¯÷AÉ‹ıö}Ê°ÜÎı!]š×õ’Ó²²\rúº\'¸Wÿo†şšWº^6ØËÉm{_Ï0ÊQµÇåŸàç3Èã±>¥Õô‚¹²MU]íş„±¢âm½“İBí…¤¬45U8ÓºWrâó‡m³Öoéóï)ßÇ6ô›~Ñìq7lH±ì|‘ª¯ßã\\.Ïá¬³ş?çü‘#Eæ‚±¹°^e­”¯ôºy.×ûæ\nG’ntÊÊÖëï¡}ª©ÙÜì¹¤¥=¯ZuìØNëËÛõãËi™^ş&%=ª§ohØkmíâñ&S`½i¼c¾<c6U©­¾Æ]¼`öüd4®>Á÷·’Ó‘•ß•œ„0z­È9\"G!È‘=d{ÎoY	—Óî¦¸2`†¤dåYÆ—Œ)’1½zõsz\\ËtrBù{î¹ÿ¬æÍ›î5­dÑ¾½¡·>?¡OŸsÎ¬¯cøŸröiYÈ_yÌ¶X[òŠœë%köm%s‰‰¿sÎË×PÜÍ~¥^Ø¹¹îº8•‘±Èjtrœûª¬Ü¨ÿ¿¶,«ÈQô¿µ6ÿgÌø/½Ì–ó26å¯¼\'ÈuöûˆŒG9/•÷±cGz5ÃvfKJÖè÷ûò%KV^ø#=N,xØ:FÇ.ë§$W9ÏCÆ¬¡÷ğª°>°µ÷jÙ¢³!ïm¾Ï]Ş[är¹ûƒÚìì¥:Ër{ÿ«½±sb¿ïØ·íÈë&cã+ó}OğóéãñX\r´Z€^0ĞbÕÖæë–©SÇ;—mÜø²¹22Ğ9/+\nö\nƒ}^Vˆ¦O¿S7%·µWşeÚÃ‡·é•†ÂÂ´€ÏA®s¯|ç›ùİzËßSOİÛlºÒÒµÎ\'Ÿ———oPÛ¶­Ö[æ,xÈëº={ŞtŞX<§—µººRsee“¾ìÀw­ïĞ^§ÏÛ—K54Ø\rD>Ÿ›»Lÿ5ôwO¶ú\ZÛÕ†…f¨+©ƒã«‡Ÿ-	UÖå‘n¯9\"GäèÄæHÆÑ€ÿd®Ô¿déÿ=Fì«ä´4Å·qé©\Z5j„Õ¼ìq¤ÿzüù>®ÜdÉ÷ñ7ïîóû÷ç9\r±ì!?T_––¨OË_yœC‡¶6Ÿò<\ZË¬­g<¶p\'ë-ğ™9R¨Ë½5o>-9ñœÖóşe\Zû´| f/+ì×Ëİ¤£îú~ÔR¼ª÷\0ÉÉyE¥¤ü^ácÇJô‡=wÜ1F¿?45½ßlœÈ´’QÏ²×ÔÂ…³¬-Ìk­fºÔë62½œv¹Êõ—ËRSçèÇª¨ÈÒ×IvÜÜ&ªÁƒÏÓÍ¼}{û~å½GN{şò~èŞRÖlLËóó7Ö/~Òy²—ò<‚}ÿ‰€…ê¨é¡~< ÜîŠ «©©¼]·£Z®.ş$t§µõ —5]kGíÈ…¶ü.j8oQğ}­È9\"G\'8Guu;õßëÆZ\Z‚}ûr­ë×Í•öõê¼óxİæx“ì>Ÿ—·ÂãŸ\n³éİ«|777Õj¸+Z¼¯\nôtösØ¿ÿk—öGiÊÊ2­-v+õcefº·:/_>×l8·\Z‘Vãş‚ÙHo·4¸Åk<KÃa?W¹9íŞúîoüKÃc?vié\ZçòË.Lx?jÓ¼¯ªÚh»àg\\ÖÖæéëå¼ç´IIëÃd,\'\'?f}­i¼õ]í)z7u{z{»ÛlıšdÚ³½û÷j=½ŒsùpÉóñíLÉmåCµaÃ.õzşöóµïÃó¹º›çãË”ôôçõå·Şzƒ^†¸·»÷¬²3äy›~?ªc7Ğ¥\r÷ûT˜T-˜}ß¬}W&êŒó¹ö¬ätõwæ½VŒ_rDB”£ÌÌ…Ö‘ş_R«V=c®Ì÷P?|·>ï>ÒÿKÎ´gyºÙ$_¯OïÛ·Ùi¶íi\Z÷(ßÇÍÍ}ÅÚ\nœ¬î¸c´ºë®›õô†>Ùİ^Ó=Zhí6[l®äË×-Êô}Ú•“³Ô\\yÏo6>íÇw7Ğ­­ôãôémÛ^k6ıˆ?uÃäÉ·êÓî£ü_ïLW\\œ¦&Lã4#÷oŸÎÈø9\"G«¾¾T]~ù¿9cMÆ¿œ.+{ÓK²ÇÄ9çœ­öïÿ³3NdO-sÉÉ³ôS£G_­³ièİ²7;eúÔÔÙÖ–éuVSüšß±g[;côyiºíçfO»zõ|¯Û×Ô¸·PË‡\0Ë—ÏÑ_SZ²äIçq[z<CïRåÜ¯¡¿Æ•\rïG|‡èÚ†»<äåş„s¾®nG«Ó¯Y³À9ßØ¸Û:Ò«­Ş.%å±V§‘*ßûÎÉYÒ%¯KÌEf°bÓ‘OğıÔŠ¿£Â³’Ó•G…míµêÔ1½XgBN=º=àtãÇßØbN<ëÀ<çşÊÊ2ôJÔ†\r‹ô§úöÊUFF’3ıµ×^¡n¼q„¹’”£gè’Ó¾Ù\rÇÜ‘£èÌ‘Œai†í±)§çÎfm…»_M™r›Ó,—”¼¡oc7Ü••oYß-3‚şú><ÇçãÔÖ¾£W°÷ïÏÕÍ¼3ÉÎáÃ[œéä¾ä¶Òü§§\'š+ùÙjÖ¬ß8%+ëGl5›˜ÍÆ§Ü·ü?rÙ=v¬H_î;½»(÷hÖËõÿ*ÿŸ=Ëµ×YnØËßÛÊs³“ñ~ä¯Š‹_w>’1,»rWWo´æ·×kLÙãdñâßë±\'cW² M»äÁĞ{k8™”±\'ï\röX”ÛËûŒéI“nÒe¿Éõ\r\r¥Îü‘é\nWë¯olÛ¶ÊjÂ×[Í|×ÿ`çÎĞ[Ñ7êïrÇÇÇ9c_î×w¬ËãÉs–½Fä¹ÎŸ?İÚÍıéhy?â(å@×6Üï…¬JJÒÌ&y¥Z°`¦õ}²¥æJşæô|s%~¶¹ĞÜd-¼÷º\\–œü¨>ír¹·HÈ›€ïı¾f.¬S¬…vŠşt3.îßõi)Y`»w9ô¾oYñ¯«+ÖÏMÊĞ»CıÒ9-×…âõ	Ñ‚¹¥-ı$¿µß5míwQbtÍï¶õµê”ù_U•e5/;ã¡´4½Ùt‡å;ŸŞË¸îßÿ‡*-íY½\"#Y’ËÜ[İ\nÛ$&>¨?»¦æOÎe2)Üßs‘-²‚âoŒ¦§?Ö¹#GÑ™£¦¦½zùoŸŸ7ï·Ö‘şG:™ñ-i®%ÕÕo›\ró6³Qøƒu¤ÿIúúÆÆ]Êóq÷ìY£?ğ’†A¦‘Çt7\rùfş¦¹ş€~L{zÏŒUTdêéí1(ïm¾ÏGòlè­ì#õs’Ç²ó*ù‘¬HÃã;%‹öt“\'ß¢O÷íÛGÍ˜q§ßñ¿rå\\ç´üOòŞkè]eß±vÎ\"G¼ù­ÚÚ?ëõ1CÿL×zœÊò[>Ü²Ç…äÈwıìÈ‘-zNŞä2;[r{Cïu±Ülj78ëp«W?ÓâØ³ÃÎ˜</{QÆ±äñø‡»ïGóø‡lÇß³ìõIÉ ûì¯üÚ™±SşFøû¿Ã\rtmÃ]²:|¸@¿ù76–êrÒŸc}jÿ¢^°Ú+·³~G¼kıLÅƒ~ïßıÉ~¢sŞ}D×ãÓºè:EŸnh(QYYÉú6sçŞg­à™ñçñìçÙÔ´\'$¯Ş—híıÖVnŒv®äØ»‹ö¹·ÔıÖ9/[¯¤õœÆåÚm®”/Ô§¥Ñ.,\\e®Hqnç^™åu›úú^+™™Iú;°\'Õ—Ù—KÃ`ßFVšd×Ai:oyxÑZÊ²l¹#GÑ#öx•1{±ó>\"ãÔsÜ¸·p_çœ?tÈşy£}Ş~’ÓGnuŞäÃ©ÛoÿY³qe?¶œ¯­uw[²$yq7Ç§u7ÜeÖÑùœÇŞ²eE‹ï]öôÆ¶üÏş®“Ç·jÉ¸¼†s­2çÿ6ô®ñw‘#ŞÎw{lËx—÷Cï²Ç¹^Æ—çôòj—2æSSŸÒØúfF–û·‘±(ï_wÜñs]¾ï3••ëLÊÃeek­_ÎHuŸlœ1ôÖï…~ÿ;ÃÆ¨Ë.äuİüù÷{ıŸr¹™»î\ZçL\'ÏÃĞ»¾¿\ZéïGÌrYÏÇe?úîïmÛÿ{­ Ì{CZöÂ¬²2Óút§Õd[[ôÒüŞfõêyÖbßwCÃs!¾N7ævs¾rå}º¦æmİ ø»ï±c¯ñ:/÷!oîŸü¾6a>^mYhëÊM°+9öã‹öú;i7ú½|ÄˆË¼.“†vôè«Ì•“_è•“Å‹Ó[”gÌ˜è\\fè-=ãÜGYÙ\ZsEåsf‹ÙüşÆúY—b=Îíi²²9![4|Wª©i·“-¹¯pÌ9ŠÎÕÖnÖÍ³ûC(÷e2Ö/¹ä_óò>a¿_Øçekõôét6<Kn»aÃ”¿Ç•÷£iÓ~¥)w~ƒßçdŸ–ÇqïÙá¾_ù+uõÕ—7{_“ìH 9–i$ûò¾(§‡\r»Dåæ.	8¶³³S¾Frçû¨»9?~İ¨QÃôc¶%_ä¨û½Éú˜,Ïå½À^»›ÜW¼Æ…ç{…ûƒÒ×õi—k—ó~c¿_ØÓ,óºÍ‚3ôôÆ^qñkNå¯|È+ï\'r?ƒÿØ™VËór’i°=s\"ÿÇÃÿ—Ş+Dê©§îqŞ¿ìª¨xÓyÏç±páCÎß(x?Êõã‰\'è1ñxŒ­´Y€³`Ş’ª«Û®·DL›6^/e¸oßŸTjê“z!wäHµµk»^Îßzëõz\ZCïfû’^IZ²äq•˜8]_—·ÔZñ×y»Ñhl,±>‰}AŸ–…¯»a?şœ\\®ãß’ÛÈŠ•l-,.^e½©,Ùëc?÷3²eÁwwº;à×ÔßJÎÄ ¶`DMrs_6WÊªÇÛªUsu³;cÆ¯Í•e÷–`iì±lçdÿşl§iu7Éúö2Æ%ú¾eºr½²aŸ¶?ô*/_Ûl¼WU­wš}YI—œÆÅıDÿ•Ú½`OXæuŸ55í\né2º«+”ÿ/9êïG¡£á˜ÛõœÂ,Gã<Æ·låîìƒ§]lßŠ.56pÌ»CV.×Nså³s¾´ôus!Wjí~÷¼ÙLä[ßÏÙìu;÷\'¨¯™ÄFkW¥Àánd÷¦EÖ÷İnÖ§¥I¸ùæ‘^Ó®^=×úäõ³1xQß¿}{ö¼á±Õ14¯9¿Wèû-++mY¹1Z¹](j¥KsTW·M{ûü†\rIÎ·³QU•i6¯;ü—ÌÌÎy™ÆĞÇFXì5]mí&³_§ª«7èû–ñîŞzñÕx¿éÑè¶<>§L¹EßnË–ea›;rÔırDñ~DÈ9j“|†¸Òè¼Ÿ“Ÿ+7¼·n÷2\0Øæ]!«úz÷o#Şxãp³)xÉj&Ş´v“KÖÓo\"ßÎĞåxÈ9=uêmÃóö†ş¾Û\"}ZÏ}D×ãÓ._ş¤Ş}oŞ¼ûôù††\"ëû<ëÍæãÖÁrrCöúDĞ\nçJÈ••‰Fğ?­â{»şŞjDçÈĞßmş}º®n«Õ@¿pÚØØ‹Ô¤Icõ8—1{Æ§¼ï¦&ûëo[ß]ëŒwCN¶J«Ë/¬ï¯_¿¨ûïÿ•sÿ2ÍèÑ#t¾~ò“Â6wäˆQ¼‘#Šùc¸÷\nñlŒ;ÚtK³í¹»ºç`-àµ`.\rY56y4¥ÖÖµuÖd^qšğ¼¼—½nw¼á.UGº<sÊ)\'›\rÉ–faè#ºÆš+ü­-mãôi÷]\'8ÓÕÖşI¹\\;ôÏ¾È455¬£Ï–êÆÃĞß!ZÒ×\'ÂVpü­ätÆ–Š®8úkXäèÈ‘wœ,ÈùmÛ–YÍçæ€ãåá‡ï4è,§Ü^-jv¿«VÍV+W>¥êë·éË\n\n–š\ròóºA—LUWg6»yoè²=ğ¹„KîÈQ÷ÎÅû9bü’£ÉÏvyîú-[ºÛ»{¹ÜÎsË6»’]½`nhp…\\¾¯j¯˜Ë\n¸{«[–nrr^ô»À’ïÊÁqìf$#ã9\'Ül\n¸ “Çima8aÂÏç\'GT¾ıöxç:÷î°¬à„`%§³W–\"*Gv6ÒÓç©¦¦}™Û`Ø°oq¼HÓì{YVVR³iÎõØz^ª›h;;’;CïÎæ÷1,˜®uCÿ&éïÛ4»2wä¨ûæˆâıˆ‘#rÔ&“|šn9-Rë×ÆÛËtÏøÜ‡Ô#´V@˜4Ü²UKÎ{né–Úßm¤ùë§Mû¿×ûÛÊí¹ óİÚço\Zy²Åï¼óşEo}óİ\"ª-İº‚co	èÈnw‘¸Û^§å¨´ô5ıİj{ìÉßY³îr>ˆji¼Ø»”»wû^híšéwzù°JKşø#¯ë$2şå6)éAë\0klÓ8îÊÜ‘£î™#Š÷#rDÈQPÆ[c]ù4ŞYVC.[¯íİÍe·ñAÖmŞ0Ü»{Ş®Îº\r€î¶`¶·vt\ZÌA­¤»E ÒH69\n§±N¹#Gäˆ\"Gäˆ\"Gmcxÿº=µÕà;Û\0fÌ!ìnx‘¼Û9\"Gäˆ‘#rD¨hÈÑmVãí\n²Ñdp4r€3æ°]Éb¸wA\ZG(rDÈ9\"Gäˆu¹f=`ÖZ³>1«Áúäï§†{wó™†{Ë8\0Ì,˜»P‚µò’ĞÂõŸEÉÊ\r9\"Gäˆ‘#rD¨hÎ\0Ì,˜#hËB´ì¶GÈ9\"Gäˆ‘#Š†\0fÌa³’+7äˆ‘#rDÈ9¢h¸°`fÁÜ¥+9IQºrCÈ9\"Gäˆ‘#Š†\0fÌ]&ÁúßÈEÈ9\"Gäˆ‘#\04ÜæÎÕ‡Qäˆ‘#rDÈ9@ÃM±`9\"G Gääˆ\"G\0X0³`9¢È9¢ÈÈ9À‚™bÁL(rrD@È\0Ìf#rrD@(r€3f#rDÈEÈE\0°`¦X0“#Š‘##r€3Å‚äˆ‘##Š`ÁÌ‚äˆQäˆQä\0fŠ39¢È¿ääˆˆ.\'Ÿ|Òw\r\r…,Ã ¾újû>s–¸•äˆ\"Gäˆ\"G Gä@<øÇ‡òó—°`ƒZ¿şù·ÍY²“QI(rD(rrD\0D«®ºlİœ9SY0†A{Uš9K•äˆ\"Gäˆ\"G Gä@0à±œóËµƒ…c×Ö\'=zô¨0gI£’Qäˆ1ÉÈ9%ú÷ÿaiRÒƒ,»°ÆŒ¹j©9+räˆ\"Gäˆ‘##r º:óÌÓê‹ŠV°ì‚ÊÏ_ºŞœÍº˜¡H(rDÈ99\"G\0¢Oü9çœıwÎ¡_(÷èÑ£Æ|ıÇ0ÉE@ÈÈ9Åç“Núş±yóîûœïşœøïöX»d¡L(rrD@È€îaPÏßË9ıôSO™rËîM›^<Èï9vŞï1ÊODÈQ+­iÈw{ØİˆQääˆ‘#\0İÌ¥fÍ1k«Y\rf)ªÃå2Ü¿Ç(?ÁQ+ÉE@ÈÈ9\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¢ßÿğ9‹­æ6BX\0\0\0\0IEND®B`‚',0),('b6aaa130369a459bbf93a17749146147',1,'test_audit.bpmn20.xml','bcd1a51bb11b4c4ca58480103ab969f7','<?xml version=\'1.0\' encoding=\'UTF-8\'?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\r\n  <process id=\"test_audit\" name=\"æµç¨‹å®¡æ‰¹æµ‹è¯•æµç¨‹\" isExecutable=\"true\">\r\n    <startEvent id=\"start\" name=\"å¯åŠ¨å®¡æ‰¹\" activiti:initiator=\"apply\" activiti:formKey=\"/oa/testAudit/form\"/>\r\n    <endEvent id=\"end\" name=\"ç»“æŸå®¡æ‰¹\"/>\r\n    <userTask id=\"modify\" name=\"å‘˜å·¥è–ªé…¬æ¡£çº§ä¿®æ”¹\" activiti:assignee=\"${apply}\"/>\r\n    <userTask id=\"audit\" name=\"è–ªé…¬ä¸»ç®¡åˆå®¡\" activiti:assignee=\"thinkgem\"/>\r\n    <exclusiveGateway id=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\"/>\r\n    <userTask id=\"audit2\" name=\"é›†å›¢äººåŠ›èµ„æºéƒ¨éƒ¨é•¿å®¡æ ¸\" activiti:assignee=\"thinkgem\"/>\r\n    <exclusiveGateway id=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\"/>\r\n    <sequenceFlow id=\"sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\" sourceRef=\"audit2\" targetRef=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\"/>\r\n    <userTask id=\"audit3\" name=\"é›†å›¢äººåŠ›èµ„æºéƒ¨åˆ†ç®¡é¢†å¯¼å®¡æ ¸\" activiti:assignee=\"thinkgem\"/>\r\n    <exclusiveGateway id=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\"/>\r\n    <sequenceFlow id=\"sid-3DBCD661-5720-4480-8156-748BE0275FEF\" sourceRef=\"audit3\" targetRef=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\"/>\r\n    <userTask id=\"audit4\" name=\"é›†å›¢æ€»ç»ç†å®¡æ‰¹\" activiti:assignee=\"thinkgem\"/>\r\n    <exclusiveGateway id=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\"/>\r\n    <userTask id=\"apply_end\" name=\"è–ªé…¬æ¡£çº§å…‘ç°\" activiti:assignee=\"thinkgem\"/>\r\n    <sequenceFlow id=\"sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\" sourceRef=\"audit4\" targetRef=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\"/>\r\n    <sequenceFlow id=\"sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\" sourceRef=\"audit\" targetRef=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\"/>\r\n    <sequenceFlow id=\"sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\" sourceRef=\"start\" targetRef=\"audit\"/>\r\n    <sequenceFlow id=\"sid-7D723190-1432-411D-A4A4-774225E54CD9\" name=\"æ˜¯\" sourceRef=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\" targetRef=\"apply_end\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-D44CAD43-0271-4920-A524-9B8533E52550\" name=\"æ˜¯\" sourceRef=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\" targetRef=\"audit4\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\" name=\"å¦\" sourceRef=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\" targetRef=\"modify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <exclusiveGateway id=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\"/>\r\n    <sequenceFlow id=\"sid-163DBC60-DBC9-438B-971A-67738FB7715A\" sourceRef=\"modify\" targetRef=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\"/>\r\n    <sequenceFlow id=\"sid-72258A41-203E-428C-B71D-CA3506252D73\" name=\"æ˜¯\" sourceRef=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\" targetRef=\"audit2\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\" name=\"é‡æ–°ç”³è¯·\" sourceRef=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\" targetRef=\"audit\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-A7589084-4623-4FEA-A774-00A70DDC1D20\" name=\"æ˜¯\" sourceRef=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\" targetRef=\"audit3\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-FA618636-3708-4D0C-8514-29A4BB8BC926\" name=\"å¦\" sourceRef=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\" targetRef=\"modify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\" name=\"å¦\" sourceRef=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\" targetRef=\"modify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-35CC8C6C-1067-4398-991C-CCF955115965\" name=\"å¦\" sourceRef=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\" targetRef=\"modify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\" sourceRef=\"apply_end\" targetRef=\"end\"/>\r\n    <sequenceFlow id=\"sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\" name=\"é”€æ¯\" sourceRef=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\" targetRef=\"end\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n  </process>\r\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_test_audit\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"test_audit\" id=\"BPMNPlane_test_audit\">\r\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"BPMNShape_start\">\r\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"30.0\" y=\"245.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"BPMNShape_end\">\r\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"975.0\" y=\"356.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"modify\" id=\"BPMNShape_modify\">\r\n        <omgdc:Bounds height=\"58.0\" width=\"102.0\" x=\"209.0\" y=\"135.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"audit\" id=\"BPMNShape_audit\">\r\n        <omgdc:Bounds height=\"57.0\" width=\"96.0\" x=\"105.0\" y=\"231.5\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\" id=\"BPMNShape_sid-C28BB5F6-013D-4570-B432-61B380C1F46F\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"240.0\" y=\"240.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"audit2\" id=\"BPMNShape_audit2\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"210.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\" id=\"BPMNShape_sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"345.0\" y=\"350.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"audit3\" id=\"BPMNShape_audit3\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"420.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\" id=\"BPMNShape_sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"555.0\" y=\"350.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"audit4\" id=\"BPMNShape_audit4\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"630.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\" id=\"BPMNShape_sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"765.0\" y=\"350.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"apply_end\" id=\"BPMNShape_apply_end\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"840.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\" id=\"BPMNShape_sid-5FED02D6-C388-48C6-870E-097DB2131EA0\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"240.0\" y=\"45.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-3DBCD661-5720-4480-8156-748BE0275FEF\" id=\"BPMNEdge_sid-3DBCD661-5720-4480-8156-748BE0275FEF\">\r\n        <omgdi:waypoint x=\"520.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"555.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\" id=\"BPMNEdge_sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\">\r\n        <omgdi:waypoint x=\"280.0\" y=\"65.0\"/>\r\n        <omgdi:waypoint x=\"989.0\" y=\"65.0\"/>\r\n        <omgdi:waypoint x=\"989.0\" y=\"356.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\" id=\"BPMNEdge_sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\">\r\n        <omgdi:waypoint x=\"240.0\" y=\"65.0\"/>\r\n        <omgdi:waypoint x=\"153.0\" y=\"65.0\"/>\r\n        <omgdi:waypoint x=\"153.0\" y=\"231.5\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-A7589084-4623-4FEA-A774-00A70DDC1D20\" id=\"BPMNEdge_sid-A7589084-4623-4FEA-A774-00A70DDC1D20\">\r\n        <omgdi:waypoint x=\"385.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"420.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-35CC8C6C-1067-4398-991C-CCF955115965\" id=\"BPMNEdge_sid-35CC8C6C-1067-4398-991C-CCF955115965\">\r\n        <omgdi:waypoint x=\"785.0\" y=\"350.0\"/>\r\n        <omgdi:waypoint x=\"785.0\" y=\"164.0\"/>\r\n        <omgdi:waypoint x=\"311.0\" y=\"164.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\" id=\"BPMNEdge_sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\">\r\n        <omgdi:waypoint x=\"310.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"345.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-7D723190-1432-411D-A4A4-774225E54CD9\" id=\"BPMNEdge_sid-7D723190-1432-411D-A4A4-774225E54CD9\">\r\n        <omgdi:waypoint x=\"805.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"840.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\" id=\"BPMNEdge_sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\">\r\n        <omgdi:waypoint x=\"201.0\" y=\"260.0\"/>\r\n        <omgdi:waypoint x=\"240.0\" y=\"260.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D44CAD43-0271-4920-A524-9B8533E52550\" id=\"BPMNEdge_sid-D44CAD43-0271-4920-A524-9B8533E52550\">\r\n        <omgdi:waypoint x=\"595.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"630.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FA618636-3708-4D0C-8514-29A4BB8BC926\" id=\"BPMNEdge_sid-FA618636-3708-4D0C-8514-29A4BB8BC926\">\r\n        <omgdi:waypoint x=\"365.0\" y=\"350.0\"/>\r\n        <omgdi:waypoint x=\"365.0\" y=\"164.0\"/>\r\n        <omgdi:waypoint x=\"311.0\" y=\"164.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\" id=\"BPMNEdge_sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\">\r\n        <omgdi:waypoint x=\"730.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"765.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\" id=\"BPMNEdge_sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\">\r\n        <omgdi:waypoint x=\"60.0\" y=\"260.0\"/>\r\n        <omgdi:waypoint x=\"105.0\" y=\"260.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\" id=\"BPMNEdge_sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\">\r\n        <omgdi:waypoint x=\"260.0\" y=\"240.0\"/>\r\n        <omgdi:waypoint x=\"260.0\" y=\"193.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-163DBC60-DBC9-438B-971A-67738FB7715A\" id=\"BPMNEdge_sid-163DBC60-DBC9-438B-971A-67738FB7715A\">\r\n        <omgdi:waypoint x=\"260.0\" y=\"135.0\"/>\r\n        <omgdi:waypoint x=\"260.0\" y=\"85.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\" id=\"BPMNEdge_sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\">\r\n        <omgdi:waypoint x=\"940.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"975.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\" id=\"BPMNEdge_sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\">\r\n        <omgdi:waypoint x=\"575.0\" y=\"350.0\"/>\r\n        <omgdi:waypoint x=\"575.0\" y=\"164.0\"/>\r\n        <omgdi:waypoint x=\"311.0\" y=\"164.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-72258A41-203E-428C-B71D-CA3506252D73\" id=\"BPMNEdge_sid-72258A41-203E-428C-B71D-CA3506252D73\">\r\n        <omgdi:waypoint x=\"260.0\" y=\"280.0\"/>\r\n        <omgdi:waypoint x=\"260.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>',0);

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

insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`) values ('test_audit:1:562884f91151466991065216cd18a795',1,'http://www.activiti.org/test','æµç¨‹å®¡æ‰¹æµ‹è¯•æµç¨‹','test_audit',1,'bcd1a51bb11b4c4ca58480103ab969f7','test_audit.bpmn20.xml','test_audit.png',NULL,1,1,1,'');

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
  `code` varchar(50) DEFAULT NULL COMMENT 'å¡å·',
  `examination_code` varchar(50) NOT NULL COMMENT 'ä½“æ£€ç¼–å·',
  `user_id` varchar(64) NOT NULL COMMENT 'ä½“æ£€ç”¨æˆ·',
  `id_number` varchar(20) DEFAULT NULL COMMENT 'èº«ä»½è¯å·',
  `user_name` varchar(50) NOT NULL COMMENT 'å§“å',
  `phone_number` varchar(45) NOT NULL COMMENT 'è”ç³»ç”µè¯',
  `sex` varchar(64) DEFAULT NULL COMMENT 'æ€§åˆ«',
  `industry_id` varchar(64) DEFAULT NULL COMMENT 'è¡Œä¸š',
  `post_id` varchar(64) DEFAULT NULL COMMENT 'å²—ä½',
  `birthday` varchar(10) DEFAULT NULL COMMENT 'å‡ºç”Ÿæ—¥æœŸ',
  `organ_id` varchar(64) DEFAULT NULL COMMENT 'å•ä½',
  `record_date` datetime NOT NULL COMMENT 'ä½“æ£€ç™»è®°æ—¥æœŸ',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `owner` varchar(64) DEFAULT NULL COMMENT 'æ‰€å±ä½“æ£€ä¸­å¿ƒ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='åˆ¶å¡è®°å½•';

/*Data for the table `bj_cert_record` */

/*Table structure for table `bj_examination_category` */

DROP TABLE IF EXISTS `bj_examination_category`;

CREATE TABLE `bj_examination_category` (
  `id` varchar(64) NOT NULL,
  `code` varchar(45) NOT NULL COMMENT 'ç¼–å·',
  `name` varchar(50) NOT NULL COMMENT 'åç§°',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `reference_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'å‚è€ƒæ ‡è¯†ï¼š0-å¦ï¼Œ1-æ˜¯',
  `owner` varchar(64) DEFAULT NULL COMMENT 'æ‰€å±ä½“æ£€ä¸­å¿ƒ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ£€æŸ¥ç±»åˆ«';

/*Data for the table `bj_examination_category` */

insert  into `bj_examination_category`(`id`,`code`,`name`,`del_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`reference_flag`,`owner`) values ('04022523d45b4fc0b41a52209fa2d1d2','001','å¥åº·è¯','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-17 16:01:25','dbd1c02859f8434aad548bbd09cd74b5','2018-03-17 16:01:25','','0','f2d694c5e8544169a129a5354c8d4a7a'),('408f8563e4a642a89b55f233a65a27d7','EC20180005','æ™®é€šå¥åº·è¯','0','1','2018-04-16 11:06:28','1','2018-04-16 11:06:28','','0','22cdf43b3cf64706923b2bdc7bdd32ba'),('53c68dc2d6a742fba86bd2ab8842da9b','1001-JCLB2018002','é¥²å…»è¯','0','1','2018-04-23 00:49:05','1','2018-04-23 00:49:05','','0','f2d694c5e8544169a129a5354c8d4a7a'),('7b9ee47219e3414e8f8568dd718f0927','001','åŒ»ç–—è¯','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-15 11:55:01','1','2018-04-23 00:42:39','','0','f2d694c5e8544169a129a5354c8d4a7a'),('b2609b1bc8be4edda437d70d7c5fd475','001','å¥åº·è¯','0','92e9531b7c5d4fa2b13997b98d601000','2018-03-07 17:33:13','92e9531b7c5d4fa2b13997b98d601000','2018-03-07 17:33:13','','1',NULL);

/*Table structure for table `bj_examination_dept` */

DROP TABLE IF EXISTS `bj_examination_dept`;

CREATE TABLE `bj_examination_dept` (
  `id` varchar(64) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT 'åç§°',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `reference_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'å‚è€ƒæ ‡è¯†ï¼š0-å¦ï¼Œ1-æ˜¯',
  `owner` varchar(64) DEFAULT NULL COMMENT 'æ‰€å±ä½“æ£€ä¸­å¿ƒ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ£€æŸ¥éƒ¨é—¨';

/*Data for the table `bj_examination_dept` */

insert  into `bj_examination_dept`(`id`,`name`,`del_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`reference_flag`,`owner`) values ('1312dd4d7b4b4713a694e43dfa615073','çœ¼ç§‘','0','92e9531b7c5d4fa2b13997b98d601000','2018-03-11 16:12:14','92e9531b7c5d4fa2b13997b98d601000','2018-03-11 16:12:27','yanke','1',NULL),('3c80c31993bb40a697eb0d625f1af319','å†…ç§‘','0','92e9531b7c5d4fa2b13997b98d601000','2018-03-11 16:12:46','92e9531b7c5d4fa2b13997b98d601000','2018-03-11 16:12:46','neike','1',NULL),('4d20d8a6c8364976a2c751f9ff40e819','å†…ç§‘','0','1','2018-04-16 11:03:34','1','2018-04-16 11:03:34','','0','22cdf43b3cf64706923b2bdc7bdd32ba'),('5f5b12990a64439f8b4581a057ba5f85','çœ¼ç§‘','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-11 16:32:35','dbd1c02859f8434aad548bbd09cd74b5','2018-03-11 16:32:35','yanke','0','f2d694c5e8544169a129a5354c8d4a7a'),('73fceece37114701a3bb1715a75f4bf1','å†…ç§‘','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-11 16:32:35','dbd1c02859f8434aad548bbd09cd74b5','2018-03-11 16:32:35','neike','0','f2d694c5e8544169a129a5354c8d4a7a'),('88ba6755ac1a470ba5e15e59c330480c','çœ¼ç§‘','0','1','2018-04-16 11:03:29','1','2018-04-16 11:03:29','','0','22cdf43b3cf64706923b2bdc7bdd32ba'),('b2634f264e7145cda725913180a754a2','å‰å°','0','1','2018-04-16 11:03:23','1','2018-04-16 11:03:23','','0','22cdf43b3cf64706923b2bdc7bdd32ba');

/*Table structure for table `bj_examination_form` */

DROP TABLE IF EXISTS `bj_examination_form`;

CREATE TABLE `bj_examination_form` (
  `id` varchar(64) NOT NULL,
  `code` varchar(45) NOT NULL COMMENT 'ç¼–å·',
  `name` varchar(50) NOT NULL COMMENT 'åç§°',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `reference_flag` char(1) DEFAULT '0' COMMENT 'å‚è€ƒæ ‡è¯†ï¼š0-å¦ï¼Œ1-æ˜¯',
  `owner` varchar(64) DEFAULT NULL COMMENT 'æ‰€å±ä½“æ£€ä¸­å¿ƒ',
  `template_path` varchar(64) DEFAULT NULL COMMENT 'æ¨¡æ¿è·¯å¾„',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä½“æ£€æµç¨‹è¡¨æ¨¡æ¿';

/*Data for the table `bj_examination_form` */

/*Table structure for table `bj_examination_item` */

DROP TABLE IF EXISTS `bj_examination_item`;

CREATE TABLE `bj_examination_item` (
  `id` varchar(64) NOT NULL,
  `code` varchar(45) NOT NULL COMMENT 'ç¼–å·',
  `name` varchar(50) NOT NULL COMMENT 'åç§°',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `reference_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'å‚è€ƒæ ‡è¯†ï¼š0-å¦ï¼Œ1-æ˜¯',
  `owner` varchar(64) DEFAULT NULL COMMENT 'æ‰€å±ä½“æ£€ä¸­å¿ƒ',
  `type_id` varchar(64) DEFAULT NULL COMMENT 'æ£€æŸ¥é¡¹ç›®ç±»å‹',
  `unit` varchar(64) DEFAULT NULL COMMENT 'å•ä½',
  `price` varchar(45) DEFAULT NULL COMMENT 'ä»·æ ¼',
  `range_max` varchar(45) DEFAULT NULL COMMENT 'å‚è€ƒèŒƒå›´æœ€å¤§å€¼',
  `range_min` varchar(45) DEFAULT NULL COMMENT 'å‚è€ƒèŒƒå›´æœ€å°å€¼',
  `specimen_id` varchar(64) DEFAULT NULL COMMENT 'æ‰€éœ€æ ‡æœ¬',
  `permission` varchar(100) DEFAULT NULL,
  `need_samples` char(1) DEFAULT '0' COMMENT 'æ˜¯å¦éœ€è¦æ ·æœ¬ï¼š0-å¦ï¼Œ1-æ˜¯',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ£€æŸ¥é¡¹ç›®';

/*Data for the table `bj_examination_item` */

/*Table structure for table `bj_examination_item_category` */

DROP TABLE IF EXISTS `bj_examination_item_category`;

CREATE TABLE `bj_examination_item_category` (
  `id` varchar(64) NOT NULL,
  `code` varchar(45) NOT NULL COMMENT 'ç¼–å·',
  `name` varchar(50) NOT NULL COMMENT 'åç§°',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `reference_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'å‚è€ƒæ ‡è¯†ï¼š0-å¦ï¼Œ1-æ˜¯',
  `owner` varchar(64) DEFAULT NULL COMMENT 'æ‰€å±ä½“æ£€ä¸­å¿ƒ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ£€æŸ¥é¡¹ç›®åˆ†ç±»';

/*Data for the table `bj_examination_item_category` */

insert  into `bj_examination_item_category`(`id`,`code`,`name`,`del_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`reference_flag`,`owner`) values ('071ca7e1ad3541ab928b111010005cda','1','æŠ½è¡€åŠå…¶ä»–æ£€éªŒé¡¹ç›®','0','92e9531b7c5d4fa2b13997b98d601000','2018-03-15 12:26:28','92e9531b7c5d4fa2b13997b98d601000','2018-03-15 12:26:28','','1',NULL),('269f2c9365094aa18baf8dbcd893b9ca','1001-XMFL002','è…¿è„šæ£€æŸ¥','0','1','2018-04-23 00:49:18','1','2018-04-23 00:49:18','','0','f2d694c5e8544169a129a5354c8d4a7a'),('a378d0c832474bcba967471e28925dc2','1','æŠ½è¡€åŠå…¶ä»–æ£€éªŒé¡¹ç›®','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-15 12:33:38','dbd1c02859f8434aad548bbd09cd74b5','2018-03-15 12:33:38','','0','f2d694c5e8544169a129a5354c8d4a7a');

/*Table structure for table `bj_examination_item_type` */

DROP TABLE IF EXISTS `bj_examination_item_type`;

CREATE TABLE `bj_examination_item_type` (
  `id` varchar(64) NOT NULL,
  `code` varchar(45) NOT NULL COMMENT 'ç¼–å·',
  `name` varchar(50) NOT NULL COMMENT 'åç§°',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `reference_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'å‚è€ƒæ ‡è¯†ï¼š0-å¦ï¼Œ1-æ˜¯',
  `owner` varchar(64) DEFAULT NULL COMMENT 'æ‰€å±ä½“æ£€ä¸­å¿ƒ',
  `item_category_id` varchar(64) DEFAULT NULL COMMENT 'æ£€æŸ¥é¡¹ç›®åˆ†ç±»',
  `examination_dept_id` varchar(64) DEFAULT NULL COMMENT 'æ£€æŸ¥éƒ¨é—¨',
  `tips` varchar(100) DEFAULT NULL COMMENT 'æç¤ºä¿¡æ¯',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ£€æŸ¥é¡¹ç›®ç±»å‹';

/*Data for the table `bj_examination_item_type` */

insert  into `bj_examination_item_type`(`id`,`code`,`name`,`del_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`reference_flag`,`owner`,`item_category_id`,`examination_dept_id`,`tips`) values ('16242556fd2b4ff1aa10ec6cd4af0f2b','11','éªŒè¡€1','0','92e9531b7c5d4fa2b13997b98d601000','2018-03-11 16:22:30','92e9531b7c5d4fa2b13997b98d601000','2018-03-11 16:24:32','wss1','1',NULL,NULL,NULL,'ç©ºè…¹1'),('6599c832a9f74fb78cbe15c8f7c65172','1001-XMLX2018002','è…¿è„šæ£€æŸ¥','0','1','2018-04-23 00:47:47','1','2018-04-23 00:47:47','','0','f2d694c5e8544169a129a5354c8d4a7a','a378d0c832474bcba967471e28925dc2','5f5b12990a64439f8b4581a057ba5f85',''),('8d64431dc112421087cb26639898501c','1001','å¤–ç§‘','0','1','2018-04-16 11:07:11','1','2018-04-16 11:07:11','','0','22cdf43b3cf64706923b2bdc7bdd32ba','','b2634f264e7145cda725913180a754a2',''),('b840dd0f0387463abdc0be0a7868139e','2','éªŒå°¿','0','92e9531b7c5d4fa2b13997b98d601000','2018-03-11 16:38:32','92e9531b7c5d4fa2b13997b98d601000','2018-03-11 16:38:32','yn','1',NULL,NULL,NULL,'ç©ºè…¹å“¦'),('d25fe3e680514624b82ab5b6daf69965','11','è„¾è‚ºè„','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-11 16:47:07','1','2018-04-23 00:47:23','wss1','0','f2d694c5e8544169a129a5354c8d4a7a','a378d0c832474bcba967471e28925dc2','73fceece37114701a3bb1715a75f4bf1',''),('d3b4d6e92c414f6e9ef315a2b9c5172f','11','äº”å®˜æ£€æŸ¥','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-17 13:11:38','1','2018-04-23 00:46:44','é˜¿æ–¯è’‚èŠ¬','0','f2d694c5e8544169a129a5354c8d4a7a','a378d0c832474bcba967471e28925dc2','5f5b12990a64439f8b4581a057ba5f85',''),('d7138446a1e444db94dc601041c3c7ba','2','éªŒå°¿','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 09:35:34','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 09:35:34','yn','0','f2d694c5e8544169a129a5354c8d4a7a',NULL,NULL,NULL),('e3367d0e2cd44f328597871bf2db25e7','1002','å¿ƒè‚ºåŠŸèƒ½','0','1','2018-04-16 11:09:46','1','2018-04-16 11:09:46','','0','22cdf43b3cf64706923b2bdc7bdd32ba','','4d20d8a6c8364976a2c751f9ff40e819','');

/*Table structure for table `bj_examination_package` */

DROP TABLE IF EXISTS `bj_examination_package`;

CREATE TABLE `bj_examination_package` (
  `id` varchar(64) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT 'åç§°',
  `price` varchar(100) DEFAULT NULL COMMENT 'ä»·æ ¼',
  `category_id` varchar(64) NOT NULL COMMENT 'æ£€æŸ¥ç±»åˆ«',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `reference_flag` char(1) DEFAULT '0' COMMENT 'å‚è€ƒæ ‡è¯†ï¼š0-å¦ï¼Œ1-æ˜¯',
  `owner` varchar(64) DEFAULT NULL COMMENT 'æ‰€å±ä½“æ£€ä¸­å¿ƒ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä½“æ£€å¥—é¤';

/*Data for the table `bj_examination_package` */

insert  into `bj_examination_package`(`id`,`name`,`price`,`category_id`,`del_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`reference_flag`,`owner`) values ('a33e22f7d5a74b488852ae379ca2ea12','åŒ»ç”Ÿå¥åº·è¯','30','53c68dc2d6a742fba86bd2ab8842da9b','0','1','2018-04-18 17:03:07','1','2018-04-23 02:37:48','',NULL,NULL),('c0f1d0e745a84c7c872b261eff1d6593','ä¼ä¸šå¥åº·è¯ä½“æ£€','100','04022523d45b4fc0b41a52209fa2d1d2','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-15 16:19:44','1','2018-04-23 02:37:33','',NULL,NULL);

/*Table structure for table `bj_examination_record` */

DROP TABLE IF EXISTS `bj_examination_record`;

CREATE TABLE `bj_examination_record` (
  `id` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL COMMENT 'ä½“æ£€ç”¨æˆ·',
  `code` varchar(50) DEFAULT NULL COMMENT 'ç¼–å·',
  `name` varchar(50) NOT NULL COMMENT 'å§“å',
  `phone_number` varchar(45) NOT NULL COMMENT 'è”ç³»ç”µè¯',
  `sex` varchar(64) NOT NULL COMMENT 'æ€§åˆ«',
  `industry_id` varchar(64) DEFAULT NULL COMMENT 'è¡Œä¸š',
  `post_id` varchar(64) DEFAULT NULL COMMENT 'å²—ä½',
  `birthday` varchar(10) NOT NULL COMMENT 'å‡ºç”Ÿæ—¥æœŸ',
  `organ_id` varchar(64) DEFAULT NULL COMMENT 'å•ä½',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `owner` varchar(64) DEFAULT NULL COMMENT 'æ‰€å±ä½“æ£€ä¸­å¿ƒ',
  `package_id` varchar(64) DEFAULT NULL COMMENT 'ä½“æ£€å¥—é¤',
  `package_price` varchar(64) DEFAULT NULL COMMENT 'å¥—é¤ä»·æ ¼',
  `id_number` varchar(20) DEFAULT NULL COMMENT 'èº«ä»½è¯å·',
  `status` varchar(64) DEFAULT NULL COMMENT 'ä½“æ£€çŠ¶æ€ï¼Œå¯¹åº”examination_record_statuså­—å…¸',
  `item_type` char(1) DEFAULT '1' COMMENT 'ä½“æ£€é¡¹ç›®æ–¹å¼:1-ä½“æ£€å¥—é¤ï¼Œ2-è‡ªç”±é€‰æ‹©',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä½“æ£€è®°å½•';

/*Data for the table `bj_examination_record` */

/*Table structure for table `bj_examination_record_item` */

DROP TABLE IF EXISTS `bj_examination_record_item`;

CREATE TABLE `bj_examination_record_item` (
  `id` varchar(64) NOT NULL,
  `record_id` varchar(64) NOT NULL COMMENT 'æ£€æŸ¥è®°å½•',
  `item_id` varchar(64) NOT NULL COMMENT 'æ£€æŸ¥é¡¹ç›®',
  `item_name` varchar(50) DEFAULT NULL,
  `need_samples` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦éœ€è¦æ ·æœ¬ï¼š0-å¦ï¼Œ1-æ˜¯',
  `specimen_id` varchar(64) DEFAULT NULL COMMENT 'æ ·æœ¬ç±»å‹id',
  `sample_code` varchar(50) DEFAULT NULL COMMENT 'æ ·æœ¬ç¼–å·',
  `result_dict_id` varchar(64) DEFAULT NULL COMMENT 'ä½“æ£€ç»“æœ',
  `result_dict_name` varchar(255) DEFAULT NULL COMMENT 'ä½“æ£€ç»“æœ',
  `result_flag` varchar(1) DEFAULT NULL COMMENT 'æ£€åˆæ ¼æ ‡è¯†ï¼š0-å¦ï¼Œ1-æ˜¯',
  `result_remarks` varchar(255) DEFAULT NULL COMMENT 'ç»“æœå¤‡æ³¨',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `last_flag` varchar(1) DEFAULT '1' COMMENT 'æœ¬æ¬¡æ£€æŸ¥è®°å½•ä¸­åŒé¡¹ç›®æœ€åä¸€æ¬¡æ£€æŸ¥æ ‡è¯†ï¼š0-å¦ï¼Œ1-æ˜¯',
  `examination_flag` varchar(1) DEFAULT '1' COMMENT '1-åˆæ£€ï¼Œ2-å¤æ£€',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ£€æŸ¥è®°å½•é¡¹ç›®';

/*Data for the table `bj_examination_record_item` */

/*Table structure for table `bj_examination_result` */

DROP TABLE IF EXISTS `bj_examination_result`;

CREATE TABLE `bj_examination_result` (
  `id` varchar(64) NOT NULL,
  `examination_code` varchar(50) DEFAULT NULL COMMENT 'ä½“æ£€ç¼–å·',
  `sample_code` varchar(50) DEFAULT NULL COMMENT 'æ ·æœ¬ç¼–å·',
  `item_name` varchar(100) NOT NULL COMMENT 'é¡¹ç›®',
  `item_id` varchar(64) NOT NULL COMMENT 'é¡¹ç›®id',
  `user_id` varchar(64) NOT NULL COMMENT 'ä½“æ£€ç”¨æˆ·',
  `result_flag` varchar(1) NOT NULL COMMENT 'æ£€åˆæ ¼æ ‡è¯†ï¼š0-å¦ï¼Œ1-æ˜¯',
  `result_dict_id` varchar(64) NOT NULL COMMENT 'ä½“æ£€ç»“æœ',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `owner` varchar(64) DEFAULT NULL COMMENT 'æ‰€å±ä½“æ£€ä¸­å¿ƒ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä½“æ£€é¡¹ç›®ç»“æœ';

/*Data for the table `bj_examination_result` */

/*Table structure for table `bj_examination_result_dict` */

DROP TABLE IF EXISTS `bj_examination_result_dict`;

CREATE TABLE `bj_examination_result_dict` (
  `id` varchar(64) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT 'åç§°',
  `item_id` varchar(64) NOT NULL COMMENT 'æ£€æŸ¥é¡¹ç›®',
  `default_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'æ˜¯å¦é»˜è®¤ï¼š0-å¦ï¼Œ1-æ˜¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å…·ä½“æè¿°',
  `flag` varchar(1) DEFAULT NULL COMMENT 'æ˜¯å¦åˆæ ¼ï¼š0-å¦ï¼Œ1-æ˜¯',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä½“æ£€ç»“æœå­—å…¸';

/*Data for the table `bj_examination_result_dict` */

insert  into `bj_examination_result_dict`(`id`,`name`,`item_id`,`default_flag`,`del_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`flag`) values ('660c0f8f68ec416e8134e335acb9038a','ä¸åˆæ ¼','ef0d0138fce440a8950a28744f5f7dc3','0','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-17 14:45:53','dbd1c02859f8434aad548bbd09cd74b5','2018-04-12 10:18:00','1234','0'),('a6b8e7a8a456469c929fa5a7aba2c798','ä¸åˆæ ¼','1f8d8b21a4d844b986c969a935325d4f','0','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-17 14:46:13','dbd1c02859f8434aad548bbd09cd74b5','2018-04-12 10:17:52','ggg','0'),('d341285769ba4abda4906f273ccc3022','ä¸åˆæ ¼','e0835a627f7c4880ac02fbf6c982f8bd','0','0','dbd1c02859f8434aad548bbd09cd74b5','2018-04-01 18:39:47','dbd1c02859f8434aad548bbd09cd74b5','2018-04-12 10:16:37','è¡€å‹ä¸åˆæ ¼','0');

/*Table structure for table `bj_examination_samples` */

DROP TABLE IF EXISTS `bj_examination_samples`;

CREATE TABLE `bj_examination_samples` (
  `id` varchar(64) NOT NULL,
  `record_id` varchar(64) NOT NULL COMMENT 'æ£€æŸ¥è®°å½•',
  `record_item_id` varchar(64) NOT NULL COMMENT 'æ£€æŸ¥è®°å½•é¡¹ç›®id',
  `examination_code` varchar(50) DEFAULT NULL COMMENT 'ä½“æ£€ç¼–å·',
  `code` varchar(50) DEFAULT NULL COMMENT 'ç¼–å·',
  `item_id` varchar(64) NOT NULL COMMENT 'é¡¹ç›®id',
  `result_dict_id` varchar(64) DEFAULT NULL COMMENT 'ä½“æ£€ç»“æœ',
  `result_flag` varchar(1) DEFAULT NULL COMMENT 'æ£€åˆæ ¼æ ‡è¯†ï¼š0-å¦ï¼Œ1-æ˜¯',
  `result_remarks` varchar(255) DEFAULT NULL COMMENT 'ç»“æœå¤‡æ³¨',
  `user_id` varchar(64) NOT NULL COMMENT 'ä½“æ£€ç”¨æˆ·',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `owner` varchar(64) DEFAULT NULL COMMENT 'æ‰€å±ä½“æ£€ä¸­å¿ƒ',
  `examination_flag` varchar(1) DEFAULT '1' COMMENT '1-åˆæ£€ï¼Œ2-å¤æ£€',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä½“æ£€æ ·æœ¬';

/*Data for the table `bj_examination_samples` */

insert  into `bj_examination_samples`(`id`,`record_id`,`record_item_id`,`examination_code`,`code`,`item_id`,`result_dict_id`,`result_flag`,`result_remarks`,`user_id`,`del_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`owner`,`examination_flag`) values ('1925f90230874c0b87f635777077a350','255c8972fae64d60a07954811eee93b3','62807210af764b82850ae01079c5c674','1001-10201804190002','','ef0d0138fce440a8950a28744f5f7dc3',NULL,NULL,NULL,'7b83d5d0d78241aa9519909d957e2af6','0','1','2018-04-21 14:51:50','1','2018-04-21 14:51:50','','f2d694c5e8544169a129a5354c8d4a7a','1'),('1e9c2f5ed3554fdc931903beae9b121c','9f8d6f41a3814970a8454e485946a7ea','e3b70cce3a8d4ce5aeca2a1d6b9919e3','0020011800000252','1234','1f8d8b21a4d844b986c969a935325d4f','e00853ba3cfa4c1b9af147000579a6f6','1','é—®é—®','47dedc506cca4e138eb6f12cfedbbc00','0','dbd1c02859f8434aad548bbd09cd74b5','2018-04-14 21:20:15','dbd1c02859f8434aad548bbd09cd74b5','2018-04-14 21:20:15','','f2d694c5e8544169a129a5354c8d4a7a','1'),('917167e686bf455fac25b6cecd0f7dfd','255c8972fae64d60a07954811eee93b3','eb0565e575d44e57abe9a7e3bd72357e','1001-10201804190002','1001-XY201804200122','1f8d8b21a4d844b986c969a935325d4f',NULL,NULL,NULL,'7b83d5d0d78241aa9519909d957e2af6','0','1','2018-04-21 11:46:11','1','2018-04-21 11:46:11','','f2d694c5e8544169a129a5354c8d4a7a','1'),('c5e0e06173f7440db89869ad83787d0f','9f8d6f41a3814970a8454e485946a7ea','be9fd5b72a0b43a79f181577b4638bb0','0020011800000252','123','ef0d0138fce440a8950a28744f5f7dc3','660c0f8f68ec416e8134e335acb9038a','0','1234','47dedc506cca4e138eb6f12cfedbbc00','0','dbd1c02859f8434aad548bbd09cd74b5','2018-04-14 18:32:36','dbd1c02859f8434aad548bbd09cd74b5','2018-04-14 18:32:36','','f2d694c5e8544169a129a5354c8d4a7a','1');

/*Table structure for table `bj_examination_user` */

DROP TABLE IF EXISTS `bj_examination_user`;

CREATE TABLE `bj_examination_user` (
  `id` varchar(64) NOT NULL,
  `code` varchar(50) DEFAULT NULL COMMENT 'ç¼–å·',
  `name` varchar(50) NOT NULL COMMENT 'å§“å',
  `head_img_path` varchar(128) DEFAULT NULL COMMENT 'çœŸå®ç…§ç‰‡å›¾ç‰‡',
  `phone_number` varchar(45) NOT NULL COMMENT 'è”ç³»ç”µè¯',
  `id_number` varchar(20) NOT NULL COMMENT 'èº«ä»½è¯å·',
  `sex` varchar(64) NOT NULL COMMENT 'æ€§åˆ«',
  `industry_id` varchar(64) DEFAULT NULL COMMENT 'è¡Œä¸š',
  `post_id` varchar(64) DEFAULT NULL COMMENT 'å²—ä½',
  `birthday` varchar(10) NOT NULL COMMENT 'å‡ºç”Ÿæ—¥æœŸ',
  `organ_id` varchar(64) DEFAULT NULL COMMENT 'å•ä½',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `owner` varchar(64) DEFAULT NULL COMMENT 'æ‰€å±ä½“æ£€ä¸­å¿ƒ',
  `default_record` char(1) NOT NULL DEFAULT '0' COMMENT 'é»˜è®¤è®°å½•ï¼Œä¸å…è®¸åˆ é™¤',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä½“æ£€ç”¨æˆ·';

/*Data for the table `bj_examination_user` */

insert  into `bj_examination_user`(`id`,`code`,`name`,`head_img_path`,`phone_number`,`id_number`,`sex`,`industry_id`,`post_id`,`birthday`,`organ_id`,`del_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`owner`,`default_record`) values ('12850e0792ed4f34801588d1483b20ce','1001-EU1804220003','å¼ ä¸‰ä¸°','','13854855484','138325198505081548','1','8c5f1d7ee3c040b3b4743e5e45324612','a77e3b4e4c5d44cca1e317f24c5785e7','1985-05-08','508b1b81505b46e1be929413242cf016','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-13 09:13:41','1','2018-04-22 22:19:32','å‘ååå¤å¤','f2d694c5e8544169a129a5354c8d4a7a','0'),('47dedc506cca4e138eb6f12cfedbbc00','1001-EU1804220006','æå°ç’','/wshbj/userfiles/1/images/2018/04/23/1139107z7e.jpg/','458455','138215198805061584','2','c8b6f329cc024c48abc3548a9bb741de','a77e3b4e4c5d44cca1e317f24c5785e7','1988-05-06','f647e35a8ea440e7813372ae4e932a77','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-16 13:14:26','1','2018-04-23 11:39:14','','f2d694c5e8544169a129a5354c8d4a7a','0'),('7b83d5d0d78241aa9519909d957e2af6','1001-EU1804220008','å¼ æ­¦å¼º','/wshbj/userfiles/1/images/2018/04/23/142655gx8y.jpg/','1382873828','192158197212031543','1','5e24382898c340cfa16417ea5eb3298d','d3fe276675cf4f50a295acf87ea72e63','1972-12-03','f647e35a8ea440e7813372ae4e932a77','0','1','2018-04-16 11:00:41','1','2018-04-23 14:26:58','','f2d694c5e8544169a129a5354c8d4a7a','0'),('a044d543fd674ce298c01c78d4bef859','1001-EU1804220004','å¼ ç¿ å±±','/wshbj/userfiles/1/images/2018/04/23/142629ejtv.jpg/','84885484','158548198912031585','1','5e24382898c340cfa16417ea5eb3298d','a77e3b4e4c5d44cca1e317f24c5785e7','1989-12-03','508b1b81505b46e1be929413242cf016','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 12:51:51','1','2018-04-23 14:26:33','2232','f2d694c5e8544169a129a5354c8d4a7a','0'),('ac19c8d4932c427db0ef8d339f5fc2ab','1001-EU1804220002','å‘¨æ°ä¼¦','/wshbj/userfiles/1/images/2018/04/22/183208k8db.jpg/','1584544545','138542197505111254','1','c8b6f329cc024c48abc3548a9bb741de','d3fe276675cf4f50a295acf87ea72e63','1975-05-11','f647e35a8ea440e7813372ae4e932a77','0','1','2018-04-22 18:25:35','1','2018-04-22 23:20:59','æ‰“å‘æ–¯è’‚èŠ¬','f2d694c5e8544169a129a5354c8d4a7a','0'),('dda5c4367edd404c86ba858b7577f35d','1001-EU1804220002','å¼ å¼º','/wshbj/userfiles/1/images/2018/04/23/1138336gz1.jpg/','23841458','158458196811023541','1','c8b6f329cc024c48abc3548a9bb741de','a77e3b4e4c5d44cca1e317f24c5785e7','1968-11-02','bdb1267f643b48848c801efb35520f9e','0','1','2018-04-20 09:53:19','1','2018-04-23 11:38:39','','f2d694c5e8544169a129a5354c8d4a7a','0'),('e2f56e09c9df4eefa296e3261dd1a7dd','1001-EU1804220007','æå®—ç››','/wshbj/userfiles/1/images/2018/04/23/142708807r.jpg/','12585111','185454196506071548','1','5e24382898c340cfa16417ea5eb3298d','d3fe276675cf4f50a295acf87ea72e63','1965-06-07','f647e35a8ea440e7813372ae4e932a77','0','1','2018-04-22 17:57:03','1','2018-04-23 14:27:11','é˜¿å£«å¤§å¤«æ’’åå¯¹','f2d694c5e8544169a129a5354c8d4a7a','0'),('fef7399cc45049e8aeed5e8b124b3857','1001-EU1804220005','é»„ç»§å…‰','','19754884','584865194905081548','1','c8b6f329cc024c48abc3548a9bb741de','a77e3b4e4c5d44cca1e317f24c5785e7','1949-05-08','f647e35a8ea440e7813372ae4e932a77','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-16 13:17:20','1','2018-04-22 22:20:55','','f2d694c5e8544169a129a5354c8d4a7a','0');

/*Table structure for table `bj_global_set` */

DROP TABLE IF EXISTS `bj_global_set`;

CREATE TABLE `bj_global_set` (
  `id` varchar(64) DEFAULT NULL,
  `owner` varchar(64) NOT NULL COMMENT 'æ‰€å±çš„ä½“æ£€ä¸­å¿ƒ',
  `code_pre` varchar(16) DEFAULT NULL COMMENT 'å½“å‰ä½“æ£€ä¸­å¿ƒç¼–å·å‰ç¼€',
  `center_name` varchar(32) DEFAULT NULL COMMENT 'ä½“æ£€ä¸­å¿ƒåç§°ï¼Œæ·»åŠ åï¼Œè‡ªåŠ¨å¢åŠ åˆ°éƒ¨é—¨çš„ä½“æ£€ä¸­å¿ƒèŠ‚ç‚¹ä¸‹'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä½“æ£€é¡¹ç›®å…¨å±€å‚æ•°é…ç½®';

/*Data for the table `bj_global_set` */

insert  into `bj_global_set`(`id`,`owner`,`code_pre`,`center_name`) values ('628bc8b3eb85439c86878f0f860c71d3','3df93034ae954ec8b0df054c33a1c561','1001-','å¹»çµä½“æ£€');

/*Table structure for table `bj_industry` */

DROP TABLE IF EXISTS `bj_industry`;

CREATE TABLE `bj_industry` (
  `id` varchar(64) NOT NULL,
  `code` varchar(45) NOT NULL COMMENT 'ç¼–å·',
  `name` varchar(50) NOT NULL COMMENT 'åç§°',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `reference_flag` char(1) DEFAULT '0' COMMENT 'å‚è€ƒæ ‡è¯†ï¼š0-å¦ï¼Œ1-æ˜¯',
  `owner` varchar(64) DEFAULT NULL COMMENT 'æ‰€å±ä½“æ£€ä¸­å¿ƒ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è¡Œä¸šæ•°æ®';

/*Data for the table `bj_industry` */

insert  into `bj_industry`(`id`,`code`,`name`,`del_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`reference_flag`,`owner`) values ('0281f1fc66b6411abca99fc1d4afc093','1001','é¤é¥®ä¸š','0','1','2018-04-16 11:02:25','1','2018-04-16 11:02:25','','0','22cdf43b3cf64706923b2bdc7bdd32ba'),('07b7419fa0b2437ca4d6013579e168b4','1','é£Ÿå“','0','1','2018-03-06 13:42:19','1','2018-03-06 13:42:19',NULL,'0',NULL),('417543aceaad49b5954b4177bfd242ab','1','åŒ»ç–—','0','92e9531b7c5d4fa2b13997b98d601000','2018-03-12 09:59:42','92e9531b7c5d4fa2b13997b98d601000','2018-03-12 09:59:42','åŒ»ç–—åŒ»ç–—','1',NULL),('5e24382898c340cfa16417ea5eb3298d','2','äº’è”ç½‘','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 10:00:41','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 10:00:41','äº’è”ç½‘äº’è”ç½‘äº’è”ç½‘','0','f2d694c5e8544169a129a5354c8d4a7a'),('8c5f1d7ee3c040b3b4743e5e45324612','100','åŒ»ç–—','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 10:02:22','1','2018-04-22 22:56:38','åŒ»ç–—åŒ»ç–—','0','f2d694c5e8544169a129a5354c8d4a7a'),('963b434d1dff4e80ba91bdf32c68dd29','2','äº’è”ç½‘','0','92e9531b7c5d4fa2b13997b98d601000','2018-03-12 09:59:58','92e9531b7c5d4fa2b13997b98d601000','2018-03-12 10:00:19','äº’è”ç½‘äº’è”ç½‘äº’è”ç½‘','1',NULL),('b281ca30aa3a40a4b5c9ded0b5a3f53a','1001-HY2018002','å†œç‰§ä¸š','0','1','2018-04-23 01:19:43','1','2018-04-23 01:19:43','','0','f2d694c5e8544169a129a5354c8d4a7a'),('b737a42579cb453ab3ea42d23fe8c03d','1002','æ­¦è£…éƒ¨','0','1','2018-04-16 11:02:39','1','2018-04-16 11:02:39','','0','22cdf43b3cf64706923b2bdc7bdd32ba'),('c8b6f329cc024c48abc3548a9bb741de','1','é£Ÿå“','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 09:58:44','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 09:58:44','é£Ÿå“é£Ÿå“é£Ÿå“','0','f2d694c5e8544169a129a5354c8d4a7a');

/*Table structure for table `bj_job_post` */

DROP TABLE IF EXISTS `bj_job_post`;

CREATE TABLE `bj_job_post` (
  `id` varchar(64) NOT NULL,
  `code` varchar(45) NOT NULL COMMENT 'ç¼–å·',
  `name` varchar(50) NOT NULL COMMENT 'åç§°',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `reference_flag` char(1) DEFAULT '0' COMMENT 'å‚è€ƒæ ‡è¯†ï¼š0-å¦ï¼Œ1-æ˜¯',
  `owner` varchar(64) DEFAULT NULL COMMENT 'æ‰€å±ä½“æ£€ä¸­å¿ƒ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='å·¥ä½œå²—ä½';

/*Data for the table `bj_job_post` */

insert  into `bj_job_post`(`id`,`code`,`name`,`del_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`reference_flag`,`owner`) values ('67d9e8748e2c468f8c6d3d362e6ef125','1002','ç»ç†','0','1','2018-04-16 11:02:48','1','2018-04-16 11:02:48','','0','22cdf43b3cf64706923b2bdc7bdd32ba'),('6b4b79f6026c4993bbc81619baafe259','1','ä¸»ä»»','0','92e9531b7c5d4fa2b13997b98d601000','2018-03-12 10:18:38','92e9531b7c5d4fa2b13997b98d601000','2018-03-12 10:19:02','ä¸»ä»»ä¸»ä»»ä¸»ä»»','1',NULL),('95af9ac87222439389d695f614c9293f','1001-GW2018003','ç§‘å­¦å®¶','0','1','2018-04-23 01:20:12','1','2018-04-23 01:20:12','','0','f2d694c5e8544169a129a5354c8d4a7a'),('a77e3b4e4c5d44cca1e317f24c5785e7','1','ä¸»ä»»','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 10:20:58','1','2018-04-22 23:01:20','ä¸»ä»»ä¸»ä»»','0','f2d694c5e8544169a129a5354c8d4a7a'),('b3d4ec7f484a4a72b271b03ca86bedac','1003','ç«™å²—','0','1','2018-04-16 11:02:59','1','2018-04-16 11:02:59','','0','22cdf43b3cf64706923b2bdc7bdd32ba'),('cec3f54ede5347b49e471bf550f3fb31','1001-GW2018002','ç¨‹åºå‘˜','0','1','2018-04-23 01:19:57','1','2018-04-23 01:19:57','','0','f2d694c5e8544169a129a5354c8d4a7a'),('d3fe276675cf4f50a295acf87ea72e63','2','é™¢é•¿','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 10:20:16','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 10:20:16','22','0','f2d694c5e8544169a129a5354c8d4a7a');

/*Table structure for table `bj_organ` */

DROP TABLE IF EXISTS `bj_organ`;

CREATE TABLE `bj_organ` (
  `id` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL COMMENT 'å•ä½ç¼–å·',
  `name` varchar(50) NOT NULL COMMENT 'åç§°',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `reference_flag` char(1) DEFAULT '0' COMMENT 'å‚è€ƒæ ‡è¯†ï¼š0-å¦ï¼Œ1-æ˜¯',
  `owner` varchar(64) DEFAULT NULL COMMENT 'æ‰€å±ä½“æ£€ä¸­å¿ƒ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä½“æ£€å•ä½';

/*Data for the table `bj_organ` */

insert  into `bj_organ`(`id`,`code`,`name`,`del_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`reference_flag`,`owner`) values ('508b1b81505b46e1be929413242cf016','','ç²®é£Ÿå±€','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 12:33:02','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 12:33:02','ç²®é£Ÿå±€ç²®é£Ÿå±€','0','f2d694c5e8544169a129a5354c8d4a7a'),('97559e87e942489ab6cac544887fec67','','å¾®è½¯å¤§ä¸­ååŒº','0','1','2018-04-16 11:01:38','1','2018-04-16 11:01:38','','0','22cdf43b3cf64706923b2bdc7bdd32ba'),('bdb1267f643b48848c801efb35520f9e','','ä¸­é“åä¸ƒå±€','0','1','2018-04-22 23:05:36','1','2018-04-22 23:05:36','','0','f2d694c5e8544169a129a5354c8d4a7a'),('f647e35a8ea440e7813372ae4e932a77','','å·¥å•†å±€','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-15 14:51:11','dbd1c02859f8434aad548bbd09cd74b5','2018-03-15 14:51:11','','0','f2d694c5e8544169a129a5354c8d4a7a');

/*Table structure for table `bj_package_item` */

DROP TABLE IF EXISTS `bj_package_item`;

CREATE TABLE `bj_package_item` (
  `id` varchar(64) NOT NULL,
  `package_id` varchar(64) NOT NULL COMMENT 'æ£€æŸ¥å¥—é¤',
  `item_id` varchar(64) NOT NULL COMMENT 'æ£€æŸ¥é¡¹ç›®',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='å¥—é¤åŒ…å«æ£€æŸ¥é¡¹ç›®';

/*Data for the table `bj_package_item` */

insert  into `bj_package_item`(`id`,`package_id`,`item_id`,`del_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`) values ('07bfa37183b64efcb260b158e6e56e11','c0f1d0e745a84c7c872b261eff1d6593','1f8d8b21a4d844b986c969a935325d4f','0','1','2018-04-23 02:37:33','1','2018-04-23 02:37:33',NULL),('14c16f1086cb4967869ad117bd48dfbc','a33e22f7d5a74b488852ae379ca2ea12','ef0d0138fce440a8950a28744f5f7dc3','0','1','2018-04-23 02:37:48','1','2018-04-23 02:37:48',NULL),('429dff1c0cc746c0b0b754856b610ccb','a33e22f7d5a74b488852ae379ca2ea12','2b1cfdc1c64943c4b930c2d2ddc05379','0','1','2018-04-23 02:37:48','1','2018-04-23 02:37:48',NULL),('e9dd893d67c1483da86f6744d4340a70','c0f1d0e745a84c7c872b261eff1d6593','e0835a627f7c4880ac02fbf6c982f8bd','0','1','2018-04-23 02:37:33','1','2018-04-23 02:37:33',NULL);

/*Table structure for table `bj_r_category_item` */

DROP TABLE IF EXISTS `bj_r_category_item`;

CREATE TABLE `bj_r_category_item` (
  `category_id` varchar(64) NOT NULL COMMENT 'æ£€æŸ¥ç±»åˆ«',
  `item_id` varchar(64) NOT NULL COMMENT 'æ£€æŸ¥é¡¹ç›®'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ£€æŸ¥ç±»åˆ«é¡¹ç›®';

/*Data for the table `bj_r_category_item` */

/*Table structure for table `bj_role_item` */

DROP TABLE IF EXISTS `bj_role_item`;

CREATE TABLE `bj_role_item` (
  `role_id` varchar(64) NOT NULL COMMENT 'è§’è‰²ç¼–å·',
  `item_id` varchar(64) NOT NULL COMMENT 'ä½“æ£€é¡¹ç›®ID',
  PRIMARY KEY (`role_id`,`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è§’è‰²-é¡¹ç›®';

/*Data for the table `bj_role_item` */

insert  into `bj_role_item`(`role_id`,`item_id`) values ('7cb57c34857a4b79a632bcb986af9c43','1f8d8b21a4d844b986c969a935325d4f'),('f624ff7878b34fbe8645afdaf9cb8133','1f8d8b21a4d844b986c969a935325d4f'),('f624ff7878b34fbe8645afdaf9cb8133','e0835a627f7c4880ac02fbf6c982f8bd'),('f624ff7878b34fbe8645afdaf9cb8133','ef0d0138fce440a8950a28744f5f7dc3');

/*Table structure for table `bj_sample_codes` */

DROP TABLE IF EXISTS `bj_sample_codes`;

CREATE TABLE `bj_sample_codes` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `specimen_id` varchar(128) NOT NULL COMMENT 'æ ·æœ¬ç±»å‹ID',
  `specimen_name` varchar(64) NOT NULL COMMENT 'æ ·æœ¬ç±»å‹åç§°',
  `pack_id` varchar(64) DEFAULT NULL COMMENT 'æ‰¹æ¬¡id',
  `sample_code` varchar(64) NOT NULL COMMENT 'æ ·æœ¬ç¼–å·',
  `auth_id` varchar(64) NOT NULL,
  `auth_name` varchar(64) DEFAULT NULL COMMENT 'ä½œè€…',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `owner` varchar(64) DEFAULT NULL COMMENT 'æ‰€å±å…¬å¸',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sample_codes_code` (`sample_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ ·æœ¬ç¼–å·åº“';

/*Data for the table `bj_sample_codes` */

/*Table structure for table `bj_sample_codes_pack` */

DROP TABLE IF EXISTS `bj_sample_codes_pack`;

CREATE TABLE `bj_sample_codes_pack` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `specimen_id` varchar(64) NOT NULL COMMENT 'æ ·æœ¬ç±»å‹ID',
  `specimen_name` varchar(64) NOT NULL COMMENT 'æ ·æœ¬ç±»å‹åç§°',
  `code_count` int(11) NOT NULL COMMENT 'æ ·æœ¬ç¼–å·æ•°é‡',
  `auth_id` varchar(64) NOT NULL,
  `auth_name` varchar(64) DEFAULT NULL COMMENT 'ä½œè€…',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `owner` varchar(64) DEFAULT NULL COMMENT 'æ‰€å±å…¬å¸',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ ·æœ¬ç¼–å·åŒ…';

/*Data for the table `bj_sample_codes_pack` */

/*Table structure for table `bj_specimen` */

DROP TABLE IF EXISTS `bj_specimen`;

CREATE TABLE `bj_specimen` (
  `id` varchar(64) NOT NULL,
  `code` varchar(45) NOT NULL COMMENT 'ç¼–å·',
  `prefix` varchar(16) NOT NULL COMMENT 'ç¼–å·å‰ç¼€',
  `name` varchar(50) NOT NULL COMMENT 'åç§°',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨',
  `reference_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'å‚è€ƒæ ‡è¯†ï¼š0-å¦ï¼Œ1-æ˜¯',
  `owner` varchar(64) DEFAULT NULL COMMENT 'æ‰€å±ä½“æ£€ä¸­å¿ƒ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ£€æŸ¥æ ‡æœ¬ç±»å‹';

/*Data for the table `bj_specimen` */

insert  into `bj_specimen`(`id`,`code`,`prefix`,`name`,`del_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`reference_flag`,`owner`) values ('243768a6a74142809e631f69aea14bc2','2','NY','å°¿æ¶²','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 09:29:46','1','2018-04-22 23:04:47','å°¿æ¶²å°¿æ¶²å°¿æ¶²','0','f2d694c5e8544169a129a5354c8d4a7a'),('442e8fa28245437b9fab38bccb7c6a32','1','XY','è¡€æ¶²','0','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 09:31:38','dbd1c02859f8434aad548bbd09cd74b5','2018-03-12 09:31:38','è¡€æ¶²è¡€æ¶²è¡€æ¶²è¡€æ¶²','0','f2d694c5e8544169a129a5354c8d4a7a'),('4cedc11a34d54ad4a5618f037589c6a1','1002','NY','å°¿æ ·','0','1','2018-04-16 11:08:46','1','2018-04-16 11:08:46','','0','22cdf43b3cf64706923b2bdc7bdd32ba'),('a3ffddb162514467b91a2092f1c3eb4c','1','XY','è¡€æ¶²','0','92e9531b7c5d4fa2b13997b98d601000','2018-03-12 09:11:00','92e9531b7c5d4fa2b13997b98d601000','2018-03-12 09:11:21','è¡€æ¶²è¡€æ¶²è¡€æ¶²è¡€æ¶²','1',NULL),('ca5b8181f0b745679101438f8443dd85','1001-BBLX2018002','TY','å”¾æ¶²','0','1','2018-04-23 01:20:43','1','2018-04-23 01:20:43','','0','f2d694c5e8544169a129a5354c8d4a7a'),('d7789de4fabf41588a119d2cb8d049c9','1001','XY','è¡€æ ·','0','1','2018-04-16 11:08:37','1','2018-04-16 11:08:37','','0','22cdf43b3cf64706923b2bdc7bdd32ba');

/*Table structure for table `cms_article` */

DROP TABLE IF EXISTS `cms_article`;

CREATE TABLE `cms_article` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `category_id` varchar(64) NOT NULL COMMENT 'æ ç›®ç¼–å·',
  `title` varchar(255) NOT NULL COMMENT 'æ ‡é¢˜',
  `link` varchar(255) DEFAULT NULL COMMENT 'æ–‡ç« é“¾æ¥',
  `color` varchar(50) DEFAULT NULL COMMENT 'æ ‡é¢˜é¢œè‰²',
  `image` varchar(255) DEFAULT NULL COMMENT 'æ–‡ç« å›¾ç‰‡',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'å…³é”®å­—',
  `description` varchar(255) DEFAULT NULL COMMENT 'æè¿°ã€æ‘˜è¦',
  `weight` int(11) DEFAULT '0' COMMENT 'æƒé‡ï¼Œè¶Šå¤§è¶Šé å‰',
  `weight_date` datetime DEFAULT NULL COMMENT 'æƒé‡æœŸé™',
  `hits` int(11) DEFAULT '0' COMMENT 'ç‚¹å‡»æ•°',
  `posid` varchar(10) DEFAULT NULL COMMENT 'æ¨èä½ï¼Œå¤šé€‰',
  `custom_content_view` varchar(255) DEFAULT NULL COMMENT 'è‡ªå®šä¹‰å†…å®¹è§†å›¾',
  `view_config` text COMMENT 'è§†å›¾é…ç½®',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `cms_article_create_by` (`create_by`),
  KEY `cms_article_title` (`title`),
  KEY `cms_article_keywords` (`keywords`),
  KEY `cms_article_del_flag` (`del_flag`),
  KEY `cms_article_weight` (`weight`),
  KEY `cms_article_update_date` (`update_date`),
  KEY `cms_article_category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ–‡ç« è¡¨';

/*Data for the table `cms_article` */

insert  into `cms_article`(`id`,`category_id`,`title`,`link`,`color`,`image`,`keywords`,`description`,`weight`,`weight_date`,`hits`,`posid`,`custom_content_view`,`view_config`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('1','3','æ ‡é¢˜å•¥æ„æ€ï¼Ÿ','','blue','','å…³é”®å­—1,å…³é”®å­—2','',0,NULL,2,',null,','','','1','2013-05-27 08:00:00','1','2018-03-03 01:59:24',NULL,'0'),('10','4','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('11','5','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('12','5','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13','5','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('14','7','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('15','7','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,1,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('16','7','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('17','7','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('18','8','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('19','8','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','3','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,'red',NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,1,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('20','8','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('21','8','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('22','9','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('23','9','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('24','9','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('25','9','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('26','9','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('27','11','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('28','11','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('29','11','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','3','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('30','11','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('31','11','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('32','12','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('33','12','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('34','12','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('35','12','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('36','12','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('37','13','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('38','13','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('39','13','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','3','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,'green',NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('40','13','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('41','14','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('42','14','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('43','14','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('44','14','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('45','14','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('46','15','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('47','15','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('48','15','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('49','16','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5','3','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('50','17','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('51','17','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('52','26','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('53','26','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','3','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('7','4','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('8','4','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,'blue',NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('9','4','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `cms_article_data` */

DROP TABLE IF EXISTS `cms_article_data`;

CREATE TABLE `cms_article_data` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `content` text COMMENT 'æ–‡ç« å†…å®¹',
  `copyfrom` varchar(255) DEFAULT NULL COMMENT 'æ–‡ç« æ¥æº',
  `relation` varchar(255) DEFAULT NULL COMMENT 'ç›¸å…³æ–‡ç« ',
  `allow_comment` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦å…è®¸è¯„è®º',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ–‡ç« è¯¦è¡¨';

/*Data for the table `cms_article_data` */

insert  into `cms_article_data`(`id`,`content`,`copyfrom`,`relation`,`allow_comment`) values ('1','<p style=\"margin: 0px 0px 16px; padding: 0px; box-sizing: border-box; font-size: 16px; color: rgb(79, 79, 79); line-height: 26px; text-align: justify; word-break: normal; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun; white-space: normal;\">\r\n	Swagger æ˜¯ä¸€ç³»åˆ—å¯¹ RESTful æ¥å£è¿›è¡Œè§„èŒƒæè¿°å’Œé¡µé¢å±•ç¤ºçš„å·¥å…·. é€šè¿‡ springfox-swagger å°† Swagger ä¸ Spring-MVC æ•´åˆ, å¯ä»ä»£ç ä¸­çš„æ³¨è§£è·å–ä¿¡æ¯, å¹¶ç”Ÿæˆç›¸åº”çš„æ–‡æ¡£. æ•ˆæœå¦‚ä¸‹æ‰€ç¤º.</p>\r\n<p style=\"margin: 0px 0px 16px; padding: 0px; box-sizing: border-box; font-size: 16px; color: rgb(79, 79, 79); line-height: 26px; text-align: justify; word-break: normal; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun; white-space: normal;\">\r\n	<img alt=\"è¿™é‡Œå†™å›¾ç‰‡æè¿°\" src=\"http://img.blog.csdn.net/20160929165251897\" style=\"border-width: initial; border-style: none; box-sizing: border-box; margin: 24px 0px; max-width: 602px; max-height: 100%;\" title=\"\" />&nbsp;<br style=\"box-sizing: border-box;\" />\r\n	ç›®å‰ Swagger çš„ api ç‰ˆæœ¬è§„èŒƒå·²ç»æ›´æ–°åˆ° 2.0 ç‰ˆæœ¬, ä¸­æ–‡ç½‘ç»œä¸ŠåŸºæœ¬ä¸Šéƒ½æ˜¯ 1.0 çš„ api ç‰ˆæœ¬è§„èŒƒçš„æ•™ç¨‹. æ£é¼“äº†ä¸€å¤©ç»ˆäºæå®šäº†, è¿™ä¸¤è€…åŒºåˆ«è¿˜æ˜¯æœ‰çš„.</p>\r\n<p style=\"margin: 0px 0px 16px; padding: 0px; box-sizing: border-box; font-size: 16px; color: rgb(79, 79, 79); line-height: 26px; text-align: justify; word-break: normal; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun; white-space: normal;\">\r\n	<span style=\"box-sizing: border-box; font-weight: 700;\">æ³¨: æœ¬æ–‡çš„ä»£ç è§&nbsp;<a href=\"https://github.com/Frank-Hust/SpringAndStagger\" style=\"box-sizing: border-box; color: rgb(12, 137, 207);\" target=\"_blank\">https://github.com/Frank-Hust/SpringAndStagger</a>, ç›´æ¥ gitclone ä¸‹æ¥æˆ–è€…ä¸‹è½½åœ¨ IDEA ä¸­å°±èƒ½è¿è¡Œäº†.</span></p>\r\n<h2 id=\"å…ˆæ·»åŠ ä¾èµ–\" style=\"margin: 8px 0px 16px; padding: 0px; box-sizing: border-box; font-family: &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, SimHei, Arial, SimSun; line-height: 32px; color: rgb(79, 79, 79); font-size: 24px; white-space: normal;\">\r\n	<a name=\"t0\" style=\"box-sizing: border-box; color: rgb(12, 137, 207);\" target=\"_blank\"></a>å…ˆæ·»åŠ ä¾èµ–</h2>','æ¥æº','2,3,','1'),('10','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('11','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('12','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('13','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('14','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('15','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('16','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('17','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('18','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('19','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('2','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('20','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('21','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('22','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('23','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('24','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('25','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('26','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('27','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('28','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('29','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('3','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('30','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('31','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('32','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('33','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('34','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('35','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('36','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('37','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('38','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('39','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('4','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('40','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('41','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('42','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('43','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('44','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('45','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('46','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('47','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('48','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('49','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('5','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('50','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('51','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('52','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('53','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('6','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('7','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('8','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('9','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1');

/*Table structure for table `cms_category` */

DROP TABLE IF EXISTS `cms_category`;

CREATE TABLE `cms_category` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `parent_id` varchar(64) NOT NULL COMMENT 'çˆ¶çº§ç¼–å·',
  `parent_ids` varchar(2000) NOT NULL COMMENT 'æ‰€æœ‰çˆ¶çº§ç¼–å·',
  `site_id` varchar(64) DEFAULT '1' COMMENT 'ç«™ç‚¹ç¼–å·',
  `office_id` varchar(64) DEFAULT NULL COMMENT 'å½’å±æœºæ„',
  `module` varchar(20) DEFAULT NULL COMMENT 'æ ç›®æ¨¡å—',
  `name` varchar(100) NOT NULL COMMENT 'æ ç›®åç§°',
  `image` varchar(255) DEFAULT NULL COMMENT 'æ ç›®å›¾ç‰‡',
  `href` varchar(255) DEFAULT NULL COMMENT 'é“¾æ¥',
  `target` varchar(20) DEFAULT NULL COMMENT 'ç›®æ ‡',
  `description` varchar(255) DEFAULT NULL COMMENT 'æè¿°',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'å…³é”®å­—',
  `sort` int(11) DEFAULT '30' COMMENT 'æ’åºï¼ˆå‡åºï¼‰',
  `in_menu` char(1) DEFAULT '1' COMMENT 'æ˜¯å¦åœ¨å¯¼èˆªä¸­æ˜¾ç¤º',
  `in_list` char(1) DEFAULT '1' COMMENT 'æ˜¯å¦åœ¨åˆ†ç±»é¡µä¸­æ˜¾ç¤ºåˆ—è¡¨',
  `show_modes` char(1) DEFAULT '0' COMMENT 'å±•ç°æ–¹å¼',
  `allow_comment` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦å…è®¸è¯„è®º',
  `is_audit` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦éœ€è¦å®¡æ ¸',
  `custom_list_view` varchar(255) DEFAULT NULL COMMENT 'è‡ªå®šä¹‰åˆ—è¡¨è§†å›¾',
  `custom_content_view` varchar(255) DEFAULT NULL COMMENT 'è‡ªå®šä¹‰å†…å®¹è§†å›¾',
  `view_config` text COMMENT 'è§†å›¾é…ç½®',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `cms_category_parent_id` (`parent_id`),
  KEY `cms_category_module` (`module`),
  KEY `cms_category_name` (`name`),
  KEY `cms_category_sort` (`sort`),
  KEY `cms_category_del_flag` (`del_flag`),
  KEY `cms_category_office_id` (`office_id`),
  KEY `cms_category_site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ ç›®è¡¨';

/*Data for the table `cms_category` */

insert  into `cms_category`(`id`,`parent_id`,`parent_ids`,`site_id`,`office_id`,`module`,`name`,`image`,`href`,`target`,`description`,`keywords`,`sort`,`in_menu`,`in_list`,`show_modes`,`allow_comment`,`is_audit`,`custom_list_view`,`custom_content_view`,`view_config`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('1','0','0,','0','1',NULL,'é¡¶çº§æ ç›®',NULL,NULL,NULL,NULL,NULL,0,'1','1','0','0','1',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','1','0,1,','1','4','article','è½¯ä»¶ä»‹ç»',NULL,NULL,NULL,NULL,NULL,20,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('11','10','0,1,10,','1','4','article','ç½‘ç»œå·¥å…·',NULL,NULL,NULL,NULL,NULL,30,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('12','10','0,1,10,','1','4','article','æµè§ˆå·¥å…·',NULL,NULL,NULL,NULL,NULL,40,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13','10','0,1,10,','1','4','article','æµè§ˆè¾…åŠ©',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('14','10','0,1,10,','1','4','article','ç½‘ç»œä¼˜åŒ–',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('15','10','0,1,10,','1','4','article','é‚®ä»¶å¤„ç†',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('16','10','0,1,10,','1','4','article','ä¸‹è½½å·¥å…·',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('17','10','0,1,10,','1','4','article','æœç´¢å·¥å…·',NULL,NULL,NULL,NULL,NULL,50,'1','1','2','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('18','1','0,1,','1','5','link','å‹æƒ…é“¾æ¥',NULL,NULL,NULL,NULL,NULL,90,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('19','18','0,1,18,','1','5','link','å¸¸ç”¨ç½‘ç«™',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','1','0,1,','1','3','article','ç»„ç»‡æœºæ„',NULL,NULL,NULL,NULL,NULL,10,'1','1','0','0','1',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('20','18','0,1,18,','1','5','link','é—¨æˆ·ç½‘ç«™',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('21','18','0,1,18,','1','5','link','è´­ç‰©ç½‘ç«™',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('22','18','0,1,18,','1','5','link','äº¤å‹ç¤¾åŒº',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('23','18','0,1,18,','1','5','link','éŸ³ä¹è§†é¢‘',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('24','1','0,1,','1','6',NULL,'ç™¾åº¦ä¸€ä¸‹',NULL,'http://www.baidu.com','_blank',NULL,NULL,90,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('25','1','0,1,','1','6',NULL,'å…¨æ–‡æ£€ç´¢',NULL,'/search',NULL,NULL,NULL,90,'0','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('26','1','0,1,','2','6','article','æµ‹è¯•æ ç›®',NULL,NULL,NULL,NULL,NULL,90,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('27','1','0,1,','1','6',NULL,'å…¬å…±ç•™è¨€',NULL,'/guestbook',NULL,NULL,NULL,90,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','2','0,1,2,','1','3','article','ç½‘ç«™ç®€ä»‹',NULL,NULL,NULL,NULL,NULL,30,'1','1','0','0','1',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','2','0,1,2,','1','3','article','å†…éƒ¨æœºæ„',NULL,NULL,NULL,NULL,NULL,40,'1','1','0','0','1',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5','2','0,1,2,','1','3','article','åœ°æ–¹æœºæ„',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','0','1',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','1','0,1,','1','3','article','è´¨é‡æ£€éªŒ',NULL,NULL,NULL,NULL,NULL,20,'1','1','1','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('7','6','0,1,6,','1','3','article','äº§å“è´¨é‡',NULL,NULL,NULL,NULL,NULL,30,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('8','6','0,1,6,','1','3','article','æŠ€æœ¯è´¨é‡',NULL,NULL,NULL,NULL,NULL,40,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('9','6','0,1,6,','1','3','article','å·¥ç¨‹è´¨é‡',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `cms_comment` */

DROP TABLE IF EXISTS `cms_comment`;

CREATE TABLE `cms_comment` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `category_id` varchar(64) NOT NULL COMMENT 'æ ç›®ç¼–å·',
  `content_id` varchar(64) NOT NULL COMMENT 'æ ç›®å†…å®¹çš„ç¼–å·',
  `title` varchar(255) DEFAULT NULL COMMENT 'æ ç›®å†…å®¹çš„æ ‡é¢˜',
  `content` varchar(255) DEFAULT NULL COMMENT 'è¯„è®ºå†…å®¹',
  `name` varchar(100) DEFAULT NULL COMMENT 'è¯„è®ºå§“å',
  `ip` varchar(100) DEFAULT NULL COMMENT 'è¯„è®ºIP',
  `create_date` datetime NOT NULL COMMENT 'è¯„è®ºæ—¶é—´',
  `audit_user_id` varchar(64) DEFAULT NULL COMMENT 'å®¡æ ¸äºº',
  `audit_date` datetime DEFAULT NULL COMMENT 'å®¡æ ¸æ—¶é—´',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `cms_comment_category_id` (`category_id`),
  KEY `cms_comment_content_id` (`content_id`),
  KEY `cms_comment_status` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è¯„è®ºè¡¨';

/*Data for the table `cms_comment` */

/*Table structure for table `cms_guestbook` */

DROP TABLE IF EXISTS `cms_guestbook`;

CREATE TABLE `cms_guestbook` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `type` char(1) NOT NULL COMMENT 'ç•™è¨€åˆ†ç±»',
  `content` varchar(255) NOT NULL COMMENT 'ç•™è¨€å†…å®¹',
  `name` varchar(100) NOT NULL COMMENT 'å§“å',
  `email` varchar(100) NOT NULL COMMENT 'é‚®ç®±',
  `phone` varchar(100) NOT NULL COMMENT 'ç”µè¯',
  `workunit` varchar(100) NOT NULL COMMENT 'å•ä½',
  `ip` varchar(100) NOT NULL COMMENT 'IP',
  `create_date` datetime NOT NULL COMMENT 'ç•™è¨€æ—¶é—´',
  `re_user_id` varchar(64) DEFAULT NULL COMMENT 'å›å¤äºº',
  `re_date` datetime DEFAULT NULL COMMENT 'å›å¤æ—¶é—´',
  `re_content` varchar(100) DEFAULT NULL COMMENT 'å›å¤å†…å®¹',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `cms_guestbook_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ç•™è¨€æ¿';

/*Data for the table `cms_guestbook` */

/*Table structure for table `cms_link` */

DROP TABLE IF EXISTS `cms_link`;

CREATE TABLE `cms_link` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `category_id` varchar(64) NOT NULL COMMENT 'æ ç›®ç¼–å·',
  `title` varchar(255) NOT NULL COMMENT 'é“¾æ¥åç§°',
  `color` varchar(50) DEFAULT NULL COMMENT 'æ ‡é¢˜é¢œè‰²',
  `image` varchar(255) DEFAULT NULL COMMENT 'é“¾æ¥å›¾ç‰‡',
  `href` varchar(255) DEFAULT NULL COMMENT 'é“¾æ¥åœ°å€',
  `weight` int(11) DEFAULT '0' COMMENT 'æƒé‡ï¼Œè¶Šå¤§è¶Šé å‰',
  `weight_date` datetime DEFAULT NULL COMMENT 'æƒé‡æœŸé™',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `cms_link_category_id` (`category_id`),
  KEY `cms_link_title` (`title`),
  KEY `cms_link_del_flag` (`del_flag`),
  KEY `cms_link_weight` (`weight`),
  KEY `cms_link_create_by` (`create_by`),
  KEY `cms_link_update_date` (`update_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='å‹æƒ…é“¾æ¥';

/*Data for the table `cms_link` */

insert  into `cms_link`(`id`,`category_id`,`title`,`color`,`image`,`href`,`weight`,`weight_date`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('1','19','JeeSite',NULL,NULL,'http://thinkgem.github.com/jeesite',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','22','58åŒåŸ',NULL,NULL,'http://www.58.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('11','23','è§†é¢‘å¤§å…¨',NULL,NULL,'http://v.360.cn/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('12','23','å‡¤å‡°ç½‘',NULL,NULL,'http://www.ifeng.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','19','ThinkGem',NULL,NULL,'http://thinkgem.iteye.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','19','ç™¾åº¦ä¸€ä¸‹',NULL,NULL,'http://www.baidu.com',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','19','è°·æ­Œæœç´¢',NULL,NULL,'http://www.google.com',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5','20','æ–°æµªç½‘',NULL,NULL,'http://www.sina.com.cn',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','20','è…¾è®¯ç½‘',NULL,NULL,'http://www.qq.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('7','21','æ·˜å®ç½‘',NULL,NULL,'http://www.taobao.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('8','21','æ–°åç½‘',NULL,NULL,'http://www.xinhuanet.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('9','22','èµ¶é›†ç½‘',NULL,NULL,'http://www.ganji.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `cms_site` */

DROP TABLE IF EXISTS `cms_site`;

CREATE TABLE `cms_site` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `name` varchar(100) NOT NULL COMMENT 'ç«™ç‚¹åç§°',
  `title` varchar(100) NOT NULL COMMENT 'ç«™ç‚¹æ ‡é¢˜',
  `logo` varchar(255) DEFAULT NULL COMMENT 'ç«™ç‚¹Logo',
  `domain` varchar(255) DEFAULT NULL COMMENT 'ç«™ç‚¹åŸŸå',
  `description` varchar(255) DEFAULT NULL COMMENT 'æè¿°',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'å…³é”®å­—',
  `theme` varchar(255) DEFAULT 'default' COMMENT 'ä¸»é¢˜',
  `copyright` text COMMENT 'ç‰ˆæƒä¿¡æ¯',
  `custom_index_view` varchar(255) DEFAULT NULL COMMENT 'è‡ªå®šä¹‰ç«™ç‚¹é¦–é¡µè§†å›¾',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `cms_site_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ç«™ç‚¹è¡¨';

/*Data for the table `cms_site` */

insert  into `cms_site`(`id`,`name`,`title`,`logo`,`domain`,`description`,`keywords`,`theme`,`copyright`,`custom_index_view`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('1','é»˜è®¤ç«™ç‚¹','JeeSite Web',NULL,NULL,'JeeSite','JeeSite','basic','Copyright &copy; 2012-2013 <a href=\'http://thinkgem.iteye.com\' target=\'_blank\'>ThinkGem</a> - Powered By <a href=\'https://github.com/thinkgem/jeesite\' target=\'_blank\'>JeeSite</a> V1.0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','å­ç«™ç‚¹æµ‹è¯•','JeeSite Subsite',NULL,NULL,'JeeSite subsite','JeeSite subsite','basic','Copyright &copy; 2012-2013 <a href=\'http://thinkgem.iteye.com\' target=\'_blank\'>ThinkGem</a> - Powered By <a href=\'https://github.com/thinkgem/jeesite\' target=\'_blank\'>JeeSite</a> V1.0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');

/*Table structure for table `gen_scheme` */

DROP TABLE IF EXISTS `gen_scheme`;

CREATE TABLE `gen_scheme` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `name` varchar(200) DEFAULT NULL COMMENT 'åç§°',
  `category` varchar(2000) DEFAULT NULL COMMENT 'åˆ†ç±»',
  `package_name` varchar(500) DEFAULT NULL COMMENT 'ç”ŸæˆåŒ…è·¯å¾„',
  `module_name` varchar(30) DEFAULT NULL COMMENT 'ç”Ÿæˆæ¨¡å—å',
  `sub_module_name` varchar(30) DEFAULT NULL COMMENT 'ç”Ÿæˆå­æ¨¡å—å',
  `function_name` varchar(500) DEFAULT NULL COMMENT 'ç”ŸæˆåŠŸèƒ½å',
  `function_name_simple` varchar(100) DEFAULT NULL COMMENT 'ç”ŸæˆåŠŸèƒ½åï¼ˆç®€å†™ï¼‰',
  `function_author` varchar(100) DEFAULT NULL COMMENT 'ç”ŸæˆåŠŸèƒ½ä½œè€…',
  `gen_table_id` varchar(200) DEFAULT NULL COMMENT 'ç”Ÿæˆè¡¨ç¼–å·',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°ï¼ˆ0ï¼šæ­£å¸¸ï¼›1ï¼šåˆ é™¤ï¼‰',
  `can_xls_export` char(1) DEFAULT '0' COMMENT 'æ˜¯å¦æ”¯æŒExcelå¯¼å‡º',
  `can_xls_import` char(1) DEFAULT '0' COMMENT 'æ˜¯å¦æ”¯æŒExcelå¯¼å…¥',
  `form_print` char(1) DEFAULT '0' COMMENT 'æ˜¯å¦æ”¯æŒè¡¨å•æ‰“å°',
  PRIMARY KEY (`id`),
  KEY `gen_scheme_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ç”Ÿæˆæ–¹æ¡ˆ';

/*Data for the table `gen_scheme` */

insert  into `gen_scheme`(`id`,`name`,`category`,`package_name`,`module_name`,`sub_module_name`,`function_name`,`function_name_simple`,`function_author`,`gen_table_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`,`can_xls_export`,`can_xls_import`,`form_print`) values ('02b85ca04ab54572bafb48be0e93b74b','ä½“æ£€ä¸­å¿ƒ','curd','com.thinkgem.jeesite.modules','wshbj','','ä½“æ£€ä¸­å¿ƒ','ä½“æ£€ä¸­å¿ƒ','zhxl','5e8fb141d8f04235996da148395083ed','1','2018-03-06 14:16:17','1','2018-03-06 14:16:17','','1','0','0','0'),('06cea655c7dc4312bbcae7d5bf3dc119','æ£€æŸ¥é¡¹ç›®åˆ†ç±»','curd','com.thinkgem.jeesite.modules','wshbj','','æ£€æŸ¥é¡¹ç›®åˆ†ç±»','æ£€æŸ¥é¡¹ç›®åˆ†ç±»','zhxl','6c9094e7e22b4aadb26da86e9b8cbaa3','1','2018-03-07 16:29:28','1','2018-03-07 16:29:28','','0','0','0','0'),('07ca5544e38f419eb25950e537a47023','æµ‹è¯•1æ–¹æ¡ˆ','curd','com.thinkgem.jeesite.modules','test1','','æµ‹è¯•1 æè¿°','æµ‹è¯•1','å´”é¹å®‡','0f64808413ec40b4890b094920d9ed3c','1','2018-03-05 13:04:24','1','2018-03-05 14:15:06','','0','0','0','0'),('108cde6cf4284d21b36685022eb82467','Test1è¡¨ç”Ÿæˆ','curd','com.thinkgem.jeesite.modules','test1','','æµ‹è¯•ä¸€ä¸‹ä»test1è¡¨ç”Ÿæˆç±»','æµ‹è¯•1','å´”é¹å®‡','5ccbcfb5e27348c4826ed976bbd1cc56','1','2018-03-03 00:32:46','1','2018-03-03 00:46:08','','1','0','0','0'),('1a9e026a6152438c80b24eeb040cd630','æ£€æŸ¥ç±»åˆ«','curd','com.thinkgem.jeesite.modules','wshbj','','æ£€æŸ¥ç±»åˆ«','æ£€æŸ¥ç±»åˆ«','zhxl','fb90f165141648fe89fb2774ad2afbad','1','2018-03-07 16:27:55','1','2018-03-07 16:27:55','','0','0','0','0'),('1ac77aab612944ba9aeb6ded35f6ba3f','ä½“æ£€ç»“æœå­—å…¸','curd','com.thinkgem.jeesite.modules','wshbj','','ä½“æ£€ç»“æœå­—å…¸','ä½“æ£€ç»“æœå­—å…¸','zhxl','38ca93fc0d8f4fa08d622c0ecdeefa6d','1','2018-03-07 16:32:03','1','2018-03-12 10:31:13','','0','0','0','0'),('20d5319d345245a0b6eba6568a10ade0','åºåˆ—å·ç”Ÿæˆ','curd','com.thinkgem.jeesite.modules','wshbj','','åºåˆ—å·ç”Ÿæˆ','åºåˆ—å·ç”Ÿæˆ','zhxl','a98828fcd5844036b3bd6203a5c2a15d','1','2018-03-19 18:48:38','1','2018-03-19 18:48:38','','0','0','0','0'),('25fb299e12bf4d759552013251ec9017','æ ·æœ¬ç¼–å·åŒ…','curd','com.thinkgem.jeesite.modules','wshbj','','æ ·æœ¬ç¼–å·åŒ…','æ ·æœ¬ç¼–å·åŒ…','cuipengyu','0c1a5cd70b104852b79102cb62270f52','1','2018-04-20 17:00:48','1','2018-04-20 17:00:48','','0','0','0','0'),('35a13dc260284a728a270db3f382664b','æ ‘ç»“æ„','treeTable','com.thinkgem.jeesite.modules','test',NULL,'æ ‘ç»“æ„ç”Ÿæˆ','æ ‘ç»“æ„','ThinkGem','f6e4dafaa72f4c509636484715f33a96','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0','0'),('413f0d40bf5f400dbc0f6dfc95174801','æ£€æŸ¥é¡¹ç›®ç±»å‹','curd','com.thinkgem.jeesite.modules','wshbj','','æ£€æŸ¥é¡¹ç›®ç±»å‹','æ£€æŸ¥é¡¹ç›®ç±»å‹','zhxl','778b701a91b64ea5b35c17fd63948436','1','2018-03-07 16:29:55','1','2018-03-07 16:29:55','','0','0','0','0'),('419d250b09124478806a667f8af9835a','å·¥ä½œå²—ä½','curd','com.thinkgem.jeesite.modules','wshbj','','å·¥ä½œå²—ä½','å·¥ä½œå²—ä½ç®¡ç†','zhxl','0ef5b1fbbf594e32ac90c2524935eb15','1','2018-03-06 13:47:14','1','2018-03-11 13:43:19','','0','0','0','0'),('4c7222ae306c4a3dadc3a015903ae98f','ä½“æ£€è®°å½•','curd_many','com.thinkgem.jeesite.modules','wshbj','','ä½“æ£€è®°å½•','ä½“æ£€è®°å½•','zhxl','263df3b73ec844e89e6ce388e2ede14b','1','2018-03-07 16:31:36','1','2018-03-17 12:03:45','','0','1','0','0'),('554eefaf19e744a491ebb79d973b9f41','æ£€æŸ¥é¡¹ç›®','curd','com.thinkgem.jeesite.modules','wshbj','','æ£€æŸ¥é¡¹ç›®','æ£€æŸ¥é¡¹ç›®','zhxl','38e44531dea149a0a70219a175eb65cb','1','2018-03-07 16:29:03','1','2018-03-07 16:29:03','','0','0','0','0'),('5f60920d6bdd4cae8bd40ab15e0ae0bc','ä½“æ£€å•ä½','curd','com.thinkgem.jeesite.modules','wshbj','','ä½“æ£€å•ä½','ä½“æ£€å•ä½','zhxl','7003dd8eb3554a0ab99771fdd1464c74','1','2018-03-07 16:01:51','1','2018-03-12 12:24:21','','0','0','0','0'),('6255e493563f441bbef216a19361023a','æ ·æœ¬ç¼–å·åº“','curd','com.thinkgem.jeesite.modules','wshbj','','æ ·æœ¬ç¼–å·åº“','æ ·æœ¬ç¼–å·åº“','cuipengyu','7ea5e9edfc8f4eb293b9f7d54d19f4f3','1','2018-04-20 17:03:49','1','2018-04-20 17:04:30','','0','0','0','0'),('75d1513e04654777aabaace09de46a4e','ä½“æ£€æµç¨‹è¡¨æ¨¡æ¿','curd','com.thinkgem.jeesite.modules','sys','','ä½“æ£€æµç¨‹è¡¨æ¨¡æ¿','ä½“æ£€æµç¨‹è¡¨æ¨¡æ¿','zhxl','85e80c76deba4aeb93da7b186077c44a','1','2018-03-14 12:59:42','1','2018-04-18 11:40:59','','0','0','0','1'),('9c9de9db6da743bb899036c6546061ac','å•è¡¨','curd','com.thinkgem.jeesite.modules','test',NULL,'å•è¡¨ç”Ÿæˆ','å•è¡¨','ThinkGem','aef6f1fc948f4c9ab1c1b780bc471cc2','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0','0'),('9f918300db7344279356b5283c857e22','è¡Œä¸šç®¡ç†','curd','com.thinkgem.jeesite.modules','wshbj','','è¡Œä¸šåŸºç¡€æ•°æ®ç®¡ç†','è¡Œä¸šç®¡ç†','zhxl','b9dcbd6f07b34b09a7de65921518d6a1','1','2018-03-06 12:47:39','1','2018-03-11 13:43:04','','0','0','0','0'),('a791f1d0da8141679599294ab65bdb7e','ä½“æ£€ç”¨æˆ·','curd','com.thinkgem.jeesite.modules','wshbj','','ä½“æ£€ç”¨æˆ·','ä½“æ£€ç”¨æˆ·','zhxl','1fc82bd23cb64af4bc5f5874b9148aa3','1','2018-03-07 16:32:28','1','2018-03-07 16:32:28','','0','0','0','0'),('b156432b63d44be5a28f99b449191be5','å…¨å±€å‚æ•°é…ç½®','curd','com.thinkgem.jeesite.modules','sys','','å…¨å±€å‚æ•°é…ç½®','å…¨å±€å‚æ•°é…ç½®','cuipengyu','7313b302ac694a0f9639efaa0ad188d1','1','2018-04-18 11:33:47','1','2018-04-18 11:43:16','','0','0','0','1'),('b45d2fb40b804418bc9e7efea2e11651','æ£€æŸ¥éƒ¨é—¨','curd','com.thinkgem.jeesite.modules','wshbj','','æ£€æŸ¥éƒ¨é—¨','æ£€æŸ¥éƒ¨é—¨','zhxl','74db589fc1e74881be178df82449d5ee','1','2018-03-07 16:28:28','1','2018-03-07 16:28:28','','0','0','0','0'),('c32ec055a91549a09709ec339bcd3de4','æ£€æŸ¥æ ‡æœ¬ç±»å‹','curd','com.thinkgem.jeesite.modules','wshbj','','æ£€æŸ¥æ ‡æœ¬ç±»å‹','æ£€æŸ¥æ ‡æœ¬ç±»å‹','zhxl','3a4d8288c1ff4277b4beaed0ddad3301','1','2018-03-07 15:58:01','1','2018-03-07 16:01:14','','0','0','0','0'),('e4dd89f13bc1440bac103ade400b5244','ä½“æ£€å¥—é¤','curd_many','com.thinkgem.jeesite.modules','wshbj','','ä½“æ£€å¥—é¤','ä½“æ£€å¥—é¤','zhxl','67146f87f0b847a5a855efe4e9077e40','1','2018-03-07 16:31:00','1','2018-03-12 16:37:12','','0','0','0','0'),('e6d905fd236b46d1af581dd32bdfb3b0','ä¸»å­è¡¨','curd_many','com.thinkgem.jeesite.modules','test',NULL,'ä¸»å­è¡¨ç”Ÿæˆ','ä¸»å­è¡¨','ThinkGem','43d6d5acffa14c258340ce6765e46c6f','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0','0'),('fa032188dbb747768e485a27a37c7824','åˆ¶å¡è®°å½•','curd','com.thinkgem.jeesite.modules','wshbj','','åˆ¶å¡è®°å½•','åˆ¶å¡è®°å½•','zhxl','165367ce1a75430da8729b0561adce25','1','2018-03-25 16:01:37','1','2018-03-25 17:51:57','','0','0','0','0');

/*Table structure for table `gen_seq_number` */

DROP TABLE IF EXISTS `gen_seq_number`;

CREATE TABLE `gen_seq_number` (
  `noid` char(32) NOT NULL,
  `key_code` varchar(32) NOT NULL,
  `curr_val` int(11) NOT NULL DEFAULT '1' COMMENT 'å½“å‰å€¼ï¼Œå–ä¸€ä¸ªï¼Œå¢åŠ ä¸€ä¸ª',
  PRIMARY KEY (`noid`),
  UNIQUE KEY `noid_UNIQUE` (`noid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='åºåˆ—å·';

/*Data for the table `gen_seq_number` */

insert  into `gen_seq_number`(`noid`,`key_code`,`curr_val`) values ('043fafb22b4a11e896a7d7a8c4dd088c','a',2),('4af1cb8c2b4c11e896a7d7a8c4dd088c','null1803',5),('fb80ae162b4f11e896a7d7a8c4dd088c','0020011803',1),('899ca39e2b5011e896a7d7a8c4dd088c','0020011',1),('d0ddc0c62b5011e896a7d7a8c4dd088c','00200118',353),('93af872a2b5511e896a7d7a8c4dd088c','10000018',111),('f5dad3222b8811e896a7d7a8c4dd088c','002001ITEM_',14),('8b75fc202b8b11e896a7d7a8c4dd088c','111',1),('1a898485411f11e88548000c29b69695','00218',35),('68703c77412311e88548000c29b69695','002ITEM_',2);

/*Table structure for table `gen_table` */

DROP TABLE IF EXISTS `gen_table`;

CREATE TABLE `gen_table` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `name` varchar(200) DEFAULT NULL COMMENT 'åç§°',
  `comments` varchar(500) DEFAULT NULL COMMENT 'æè¿°',
  `class_name` varchar(100) DEFAULT NULL COMMENT 'å®ä½“ç±»åç§°',
  `parent_table` varchar(200) DEFAULT NULL COMMENT 'å…³è”çˆ¶è¡¨',
  `parent_table_fk` varchar(100) DEFAULT NULL COMMENT 'å…³è”çˆ¶è¡¨å¤–é”®',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°ï¼ˆ0ï¼šæ­£å¸¸ï¼›1ï¼šåˆ é™¤ï¼‰',
  PRIMARY KEY (`id`),
  KEY `gen_table_name` (`name`),
  KEY `gen_table_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä¸šåŠ¡è¡¨';

/*Data for the table `gen_table` */

insert  into `gen_table`(`id`,`name`,`comments`,`class_name`,`parent_table`,`parent_table_fk`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('0c1a5cd70b104852b79102cb62270f52','bj_sample_codes_pack','æ ·æœ¬ç¼–å·åŒ…','SampleCodesPack','','','1','2018-04-20 16:58:56','1','2018-04-20 16:58:56','','0'),('0ef5b1fbbf594e32ac90c2524935eb15','bj_job_post','å·¥ä½œå²—ä½','JobPost','','','1','2018-03-06 13:46:01','1','2018-03-11 13:42:45','','0'),('0f64808413ec40b4890b094920d9ed3c','test1','æµ‹è¯•è¡¨1','Test1','','','1','2018-03-05 13:03:35','1','2018-03-05 14:14:51','','0'),('165367ce1a75430da8729b0561adce25','bj_cert_record','åˆ¶å¡è®°å½•','CertRecord','','','1','2018-03-25 16:00:45','1','2018-03-25 16:13:40','','0'),('1fc82bd23cb64af4bc5f5874b9148aa3','bj_examination_user','ä½“æ£€ç”¨æˆ·','ExaminationUser','','','1','2018-03-07 16:24:52','1','2018-03-07 16:24:52','','0'),('263df3b73ec844e89e6ce388e2ede14b','bj_examination_record','ä½“æ£€è®°å½•','ExaminationRecord','','','1','2018-03-07 16:26:02','1','2018-03-17 12:03:35','','0'),('38ca93fc0d8f4fa08d622c0ecdeefa6d','bj_examination_result_dict','ä½“æ£€ç»“æœå­—å…¸','ExaminationResultDict','','','1','2018-03-07 16:23:20','1','2018-03-12 10:30:56','','0'),('38e44531dea149a0a70219a175eb65cb','bj_examination_item','æ£€æŸ¥é¡¹ç›®','ExaminationItem','','','1','2018-03-07 16:18:04','1','2018-03-07 16:18:04','','0'),('3a4d8288c1ff4277b4beaed0ddad3301','bj_specimen','æ£€æŸ¥æ ‡æœ¬ç±»å‹','Specimen','','','1','2018-03-07 15:57:22','1','2018-03-07 15:59:38','','0'),('43d6d5acffa14c258340ce6765e46c6f','test_data_main','ä¸šåŠ¡æ•°æ®è¡¨','TestDataMain',NULL,NULL,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('4beae09010714fba860989f8d26cf1d0','bj_package_item','å¥—é¤åŒ…å«æ£€æŸ¥é¡¹ç›®','PackageItem','bj_examination_package','package_id','1','2018-03-12 15:09:25','1','2018-03-12 16:36:54','','0'),('5ccbcfb5e27348c4826ed976bbd1cc56','test1','æµ‹è¯•è¡¨1','Test1','','','1','2018-03-03 00:29:13','1','2018-03-03 00:29:13','','1'),('5e8fb141d8f04235996da148395083ed','bj_m_e_center','ä½“æ£€ä¸­å¿ƒ','MECenter','','','1','2018-03-06 14:15:33','1','2018-03-06 14:15:33','','1'),('67146f87f0b847a5a855efe4e9077e40','bj_examination_package','ä½“æ£€å¥—é¤','ExaminationPackage','','','1','2018-03-07 16:20:28','1','2018-03-07 16:20:28','','0'),('6c9094e7e22b4aadb26da86e9b8cbaa3','bj_examination_item_category','æ£€æŸ¥é¡¹ç›®åˆ†ç±»','ExaminationItemCategory','','','1','2018-03-07 16:11:09','1','2018-03-07 16:11:09','','0'),('6e05c389f3c6415ea34e55e9dfb28934','test_data_child','ä¸šåŠ¡æ•°æ®å­è¡¨','TestDataChild','test_data_main','test_data_main_id','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('7003dd8eb3554a0ab99771fdd1464c74','bj_organ','ä½“æ£€å•ä½','Organ','','','1','2018-03-07 15:59:22','1','2018-03-12 12:24:06','','0'),('7313b302ac694a0f9639efaa0ad188d1','bj_global_set','ä½“æ£€é¡¹ç›®å…¨å±€å‚æ•°é…ç½®','GlobalSet','','','1','2018-04-18 11:31:06','1','2018-04-18 11:31:06','','0'),('74db589fc1e74881be178df82449d5ee','bj_examination_dept','æ£€æŸ¥éƒ¨é—¨','ExaminationDept','','','1','2018-03-07 16:03:58','1','2018-03-07 16:03:58','','0'),('778b701a91b64ea5b35c17fd63948436','bj_examination_item_type','æ£€æŸ¥é¡¹ç›®ç±»å‹','ExaminationItemType','','','1','2018-03-07 16:15:19','1','2018-03-07 16:15:19','','0'),('7ea5e9edfc8f4eb293b9f7d54d19f4f3','bj_sample_codes','æ ·æœ¬ç¼–å·åº“','SampleCodes','','','1','2018-04-20 17:02:28','1','2018-04-20 17:02:28','','0'),('85e80c76deba4aeb93da7b186077c44a','bj_examination_form','ä½“æ£€æµç¨‹è¡¨æ¨¡æ¿','ExaminationForm','','','1','2018-03-14 12:07:44','1','2018-03-14 12:07:44','','0'),('8cc24412bbc4414a9ab589e7877028f9','bj_examination_result_dict','ä½“æ£€å¥—é¤','ExaminationResultDict','','','1','2018-03-07 16:19:25','1','2018-03-07 16:19:25','','1'),('a98828fcd5844036b3bd6203a5c2a15d','gen_seq_number','åºåˆ—å·','GenSeqNumber','','','1','2018-03-19 18:47:50','1','2018-03-19 18:47:50','','0'),('aef6f1fc948f4c9ab1c1b780bc471cc2','test_data','ä¸šåŠ¡æ•°æ®è¡¨','TestData',NULL,NULL,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('b9dcbd6f07b34b09a7de65921518d6a1','bj_industry','è¡Œä¸šæ•°æ®','Industry','','','1','2018-03-06 13:14:05','1','2018-03-11 13:42:28','','0'),('c657d573d06d48fd9e7c68bf8254674b','bj_examination_record_item','æ£€æŸ¥è®°å½•é¡¹ç›®','ExaminationRecordItem','bj_examination_record','record_id','1','2018-03-17 11:16:33','1','2018-03-17 11:16:33','','0'),('de5493dc511c454a823c223814ad2ec3','bj_industry','è¡Œä¸šæ•°æ®','Industry','','','1','2018-03-06 12:45:42','1','2018-03-06 12:45:42','','1'),('f6e4dafaa72f4c509636484715f33a96','test_tree','æ ‘ç»“æ„è¡¨','TestTree',NULL,NULL,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('fb90f165141648fe89fb2774ad2afbad','bj_examination_category','æ£€æŸ¥ç±»åˆ«','ExaminationCategory','','','1','2018-03-07 16:09:00','1','2018-03-07 16:09:00','','0');

/*Table structure for table `gen_table_column` */

DROP TABLE IF EXISTS `gen_table_column`;

CREATE TABLE `gen_table_column` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `gen_table_id` varchar(64) DEFAULT NULL COMMENT 'å½’å±è¡¨ç¼–å·',
  `name` varchar(200) DEFAULT NULL COMMENT 'åç§°',
  `comments` varchar(500) DEFAULT NULL COMMENT 'æè¿°',
  `jdbc_type` varchar(100) DEFAULT NULL COMMENT 'åˆ—çš„æ•°æ®ç±»å‹çš„å­—èŠ‚é•¿åº¦',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVAç±»å‹',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVAå­—æ®µå',
  `is_pk` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦ä¸»é”®',
  `is_null` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦å¯ä¸ºç©º',
  `is_insert` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦ä¸ºæ’å…¥å­—æ®µ',
  `is_edit` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦ç¼–è¾‘å­—æ®µ',
  `is_list` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦åˆ—è¡¨å­—æ®µ',
  `is_query` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦æŸ¥è¯¢å­—æ®µ',
  `query_type` varchar(200) DEFAULT NULL COMMENT 'æŸ¥è¯¢æ–¹å¼ï¼ˆç­‰äºã€ä¸ç­‰äºã€å¤§äºã€å°äºã€èŒƒå›´ã€å·¦LIKEã€å³LIKEã€å·¦å³LIKEï¼‰',
  `show_type` varchar(200) DEFAULT NULL COMMENT 'å­—æ®µç”Ÿæˆæ–¹æ¡ˆï¼ˆæ–‡æœ¬æ¡†ã€æ–‡æœ¬åŸŸã€ä¸‹æ‹‰æ¡†ã€å¤é€‰æ¡†ã€å•é€‰æ¡†ã€å­—å…¸é€‰æ‹©ã€äººå‘˜é€‰æ‹©ã€éƒ¨é—¨é€‰æ‹©ã€åŒºåŸŸé€‰æ‹©ï¼‰',
  `dict_type` varchar(200) DEFAULT NULL COMMENT 'å­—å…¸ç±»å‹',
  `settings` varchar(2000) DEFAULT NULL COMMENT 'å…¶å®ƒè®¾ç½®ï¼ˆæ‰©å±•å­—æ®µJSONï¼‰',
  `sort` decimal(10,0) DEFAULT NULL COMMENT 'æ’åºï¼ˆå‡åºï¼‰',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°ï¼ˆ0ï¼šæ­£å¸¸ï¼›1ï¼šåˆ é™¤ï¼‰',
  `is_invent` char(1) DEFAULT '0' COMMENT 'æ˜¯å¦è™šå­—æ®µ',
  `is_unique` varchar(45) DEFAULT '0' COMMENT 'æ˜¯å¦å”¯ä¸€å­—æ®µ',
  `tree_url` varchar(64) DEFAULT NULL COMMENT 'å¤–é”®è¯»å–treeåœ°å€',
  PRIMARY KEY (`id`),
  KEY `gen_table_column_table_id` (`gen_table_id`),
  KEY `gen_table_column_name` (`name`),
  KEY `gen_table_column_sort` (`sort`),
  KEY `gen_table_column_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä¸šåŠ¡è¡¨å­—æ®µ';

/*Data for the table `gen_table_column` */

insert  into `gen_table_column`(`id`,`gen_table_id`,`name`,`comments`,`jdbc_type`,`java_type`,`java_field`,`is_pk`,`is_null`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`show_type`,`dict_type`,`settings`,`sort`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`,`is_invent`,`is_unique`,`tree_url`) values ('0087c897058e4ebd8d59719b1d93a2eb','263df3b73ec844e89e6ce388e2ede14b','create_by','åˆ›å»ºè€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'120','1','2018-03-07 16:26:03','1','2018-03-17 12:03:35',NULL,'0','0','0',NULL),('00c7839e82b74b7490e2978b99773c44','c657d573d06d48fd9e7c68bf8254674b','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-17 11:16:33','1','2018-03-17 11:16:33',NULL,'0','0','0',NULL),('014c859545074713bee8f01662a5d9d4','de5493dc511c454a823c223814ad2ec3','update_by','update_by','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'70','1','2018-03-06 12:45:42','1','2018-03-06 12:45:42',NULL,'1','0','0',NULL),('0490b9527f274deba7cd43f08dbaf3ae','778b701a91b64ea5b35c17fd63948436','update_date','æ›´æ–°æ—¶é—´','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,'80','1','2018-03-07 16:15:20','1','2018-03-07 16:15:20',NULL,'0','0','0',NULL),('06998543e0ec4b44ac4c5a54ab7166cb','38e44531dea149a0a70219a175eb65cb','update_by','æ›´æ–°è€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'70','1','2018-03-07 16:18:04','1','2018-03-07 16:18:04',NULL,'0','0','0',NULL),('071863f566514bd4af489f4a4a0d2d51','67146f87f0b847a5a855efe4e9077e40','del_flag','åˆ é™¤æ ‡è®°','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'50','1','2018-03-07 16:20:28','1','2018-03-07 16:20:28',NULL,'0','0','0',NULL),('073b6a2dd1914527b5282e539c6bf237','1fc82bd23cb64af4bc5f5874b9148aa3','birthday','å‡ºç”Ÿæ—¥æœŸ','varchar(10)','String','birthday','0','0','1','1','0','0','=','input','',NULL,'80','1','2018-03-07 16:24:52','1','2018-03-07 16:24:52',NULL,'0','0','0',NULL),('0792d13c4cf940019ec3b12721ff14d4','5e8fb141d8f04235996da148395083ed','status','çŠ¶æ€','varchar(4)','String','status','0','0','1','1','0','1','=','input','',NULL,'90','1','2018-03-06 14:15:33','1','2018-03-06 14:15:33',NULL,'1','0','0',NULL),('07b1a683773046a7a8e902db9ca634b9','74db589fc1e74881be178df82449d5ee','update_date','æ›´æ–°æ—¶é—´','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,'70','1','2018-03-07 16:03:59','1','2018-03-07 16:03:59',NULL,'0','0','0',NULL),('0847f2d08e93405190c0e67cc4fc1c70','5ccbcfb5e27348c4826ed976bbd1cc56','remarks','å¤‡æ³¨ä¿¡æ¯','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'90','1','2018-03-03 00:29:13','1','2018-03-03 00:29:13',NULL,'1','0','0',NULL),('08adfd2eeae84bb180ffa00bc6b8c0c9','7ea5e9edfc8f4eb293b9f7d54d19f4f3','specimen_id','æ ·æœ¬ç±»å‹ID','varchar(128)','String','specimenId','0','0','1','1','0','0','=','input','',NULL,'20','1','2018-04-20 17:02:28','1','2018-04-20 17:02:28',NULL,'0','0','0',NULL),('0902a0cb3e8f434280c20e9d771d0658','aef6f1fc948f4c9ab1c1b780bc471cc2','sex','æ€§åˆ«','char(1)','String','sex','0','1','1','1','1','1','=','radiobox','sex',NULL,'6','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('09446ee775a64c3e83dc95a63f5a7b8f','c657d573d06d48fd9e7c68bf8254674b','create_date','åˆ›å»ºæ—¶é—´','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'80','1','2018-03-17 11:16:34','1','2018-03-17 11:16:34',NULL,'0','0','0',NULL),('0acce1589f8f4c0099b60970266dc196','263df3b73ec844e89e6ce388e2ede14b','package_id','ä½“æ£€å¥—é¤','varchar(64)','String','packageId','0','1','1','1','1','1','=','select','',NULL,'180','1','2018-03-07 16:26:03','1','2018-03-17 12:03:35',NULL,'0','0','0',NULL),('0b61d58ec21e4a198788f48fcda1501f','8cc24412bbc4414a9ab589e7877028f9','create_date','åˆ›å»ºæ—¶é—´','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'80','1','2018-03-07 16:19:26','1','2018-03-07 16:19:26',NULL,'1','0','0',NULL),('0bc03a3d513a4ff4b05f069a0e3c1196','165367ce1a75430da8729b0561adce25','user_name','å§“å','varchar(50)','String','userName','0','0','1','1','1','1','=','input','',NULL,'60','1','2018-03-25 16:00:45','1','2018-03-25 16:13:40',NULL,'0','0','0',NULL),('0bd4debdba454a999f169443dda7df9b','85e80c76deba4aeb93da7b186077c44a','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-14 12:07:44','1','2018-03-14 12:07:44',NULL,'0','0','0',NULL),('0cc30e4e310048e38c70dedbda5b14e1','de5493dc511c454a823c223814ad2ec3','update_date','update_date','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,'80','1','2018-03-06 12:45:42','1','2018-03-06 12:45:42',NULL,'1','0','0',NULL),('0d8f0ff9c60b485a8b8a58651ebcc522','8cc24412bbc4414a9ab589e7877028f9','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-07 16:19:25','1','2018-03-07 16:19:25',NULL,'1','0','0',NULL),('0d94b8a26a124364aeaf8592589a9f35','38e44531dea149a0a70219a175eb65cb','create_date','åˆ›å»ºæ—¶é—´','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'60','1','2018-03-07 16:18:04','1','2018-03-07 16:18:04',NULL,'0','0','0',NULL),('0e44fb394ace45fb8040ae08ece9fd5b','de5493dc511c454a823c223814ad2ec3','del_flag','del_flag','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'40','1','2018-03-06 12:45:42','1','2018-03-06 12:45:42',NULL,'1','0','0',NULL),('0fc5c73d9ce74e85aad72a49c33af28d','1fc82bd23cb64af4bc5f5874b9148aa3','code','ç¼–å·','varchar(50)','String','code','0','0','1','1','1','1','=','input','',NULL,'20','1','2018-03-07 16:24:52','1','2018-03-07 16:24:52',NULL,'0','0','0',NULL),('102b3e19b44647509eb95138c3c6b395','0ef5b1fbbf594e32ac90c2524935eb15','reference_flag','å‚è€ƒæ ‡è¯†ï¼š0-å¦ï¼Œ1-æ˜¯','char(1)','String','referenceFlag','0','1','1','1','0','0','=','input','',NULL,'100','1','2018-03-11 13:42:46','1','2018-03-11 13:42:46',NULL,'0','0','0',NULL),('103fc05c88ff40639875c2111881996a','aef6f1fc948f4c9ab1c1b780bc471cc2','create_date','åˆ›å»ºæ—¶é—´','timestamp(6)','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect',NULL,NULL,'9','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('10d8903566ff441aae6a62bdbc78114c','0f64808413ec40b4890b094920d9ed3c','id','ç¼–å·','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-05 13:03:35','1','2018-03-05 14:14:52',NULL,'0','0','0',NULL),('129f60a2b32349c3ac9cbdd6a40a923b','165367ce1a75430da8729b0561adce25','update_by','æ›´æ–°è€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','0','0','0','=','input','',NULL,'100','1','2018-03-25 16:00:45','1','2018-03-25 16:13:40',NULL,'0','0','0',NULL),('12fa38dd986e41908f7fefa5839d1220','6e05c389f3c6415ea34e55e9dfb28934','create_by','åˆ›å»ºè€…','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input',NULL,NULL,'4','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('1375e859a25441c581aaf3d765dea208','c657d573d06d48fd9e7c68bf8254674b','update_by','æ›´æ–°è€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'90','1','2018-03-17 11:16:34','1','2018-03-17 11:16:34',NULL,'0','0','0',NULL),('141a243c131c4bbabd22011d92915f11','6c9094e7e22b4aadb26da86e9b8cbaa3','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-07 16:11:10','1','2018-03-07 16:11:10',NULL,'0','0','0',NULL),('1475c91f59774e0fab1fabf621af17b4','0c1a5cd70b104852b79102cb62270f52','id','ç¼–å·','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-04-20 16:58:56','1','2018-04-20 16:58:56',NULL,'0','0','0',NULL),('14a359dfaf1f4f369d01facb3d11e286','38ca93fc0d8f4fa08d622c0ecdeefa6d','create_date','åˆ›å»ºæ—¶é—´','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'70','1','2018-03-07 16:23:20','1','2018-03-12 10:30:56',NULL,'0','0','0',NULL),('14b86396b282419a9ac53e328c4066e1','38e44531dea149a0a70219a175eb65cb','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-07 16:18:04','1','2018-03-07 16:18:04',NULL,'0','0','0',NULL),('14dfce94c5d84851af5477232858454e','5e8fb141d8f04235996da148395083ed','update_by','æ›´æ–°è€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'70','1','2018-03-06 14:15:33','1','2018-03-06 14:15:33',NULL,'1','0','0',NULL),('1881315dd90c4bb4aa7b1afea9071f43','263df3b73ec844e89e6ce388e2ede14b','post_id','å²—ä½','varchar(64)','String','postId','0','0','1','1','0','0','=','select','',NULL,'80','1','2018-03-07 16:26:02','1','2018-03-17 12:03:35',NULL,'0','0','0',NULL),('195ee9241f954d008fe01625f4adbfef','f6e4dafaa72f4c509636484715f33a96','create_by','åˆ›å»ºè€…','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input',NULL,NULL,'6','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('19c6478b8ff54c60910c2e4fc3d27503','43d6d5acffa14c258340ce6765e46c6f','id','ç¼–å·','varchar2(64)','String','id','1','0','1','0','0','0','=','input',NULL,NULL,'1','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('1a42d948003d4bbe98d8ad529161bb69','263df3b73ec844e89e6ce388e2ede14b','phone_number','è”ç³»ç”µè¯','varchar(45)','String','phoneNumber','0','0','1','1','1','1','=','input','',NULL,'50','1','2018-03-07 16:26:02','1','2018-03-17 12:03:35',NULL,'0','0','0',NULL),('1a637a9d834640c48b5f4fdaa7bd3889','778b701a91b64ea5b35c17fd63948436','reference_flag','å‚è€ƒæ ‡è¯†ï¼š0-å¦ï¼Œ1-æ˜¯','char(1)','String','referenceFlag','0','0','1','1','0','0','=','input','',NULL,'100','1','2018-03-07 16:15:20','1','2018-03-07 16:15:20',NULL,'0','0','0',NULL),('1ac6562f753d4e599693840651ab2bf7','43d6d5acffa14c258340ce6765e46c6f','in_date','åŠ å…¥æ—¥æœŸ','date(7)','java.util.Date','inDate','0','1','1','1','0','0','=','dateselect',NULL,NULL,'7','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('1b8eb55f65284fa6b0a5879b6d8ad3ec','aef6f1fc948f4c9ab1c1b780bc471cc2','in_date','åŠ å…¥æ—¥æœŸ','date(7)','java.util.Date','inDate','0','1','1','1','0','1','between','dateselect',NULL,NULL,'7','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('1bea0e125bc346e08c49f551df878d7b','5e8fb141d8f04235996da148395083ed','linkman','è”ç³»äºº','varchar(45)','String','linkman','0','1','1','1','0','0','like','input','',NULL,'110','1','2018-03-06 14:15:33','1','2018-03-06 14:15:33',NULL,'1','0','0',NULL),('1d5ca4d114be41e99f8dc42a682ba609','aef6f1fc948f4c9ab1c1b780bc471cc2','user_id','å½’å±ç”¨æˆ·','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','user.id|name','0','1','1','1','1','1','=','userselect',NULL,NULL,'2','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('1d640a60844147849f4a7a8b672ab753','0ef5b1fbbf594e32ac90c2524935eb15','owner','æ‰€å±ä½“æ£€ä¸­å¿ƒ','varchar(64)','String','owner','0','1','1','1','0','0','=','input','',NULL,'110','1','2018-03-11 13:42:46','1','2018-03-11 13:42:46',NULL,'0','0','0',NULL),('1ed6153102f14b67b06db613a9c020ec','a98828fcd5844036b3bd6203a5c2a15d','key_code','key_code','varchar(32)','String','keyCode','0','0','1','1','0','0','=','input','',NULL,'20','1','2018-03-19 18:47:50','1','2018-03-19 18:47:50',NULL,'0','0','0',NULL),('1f5beb64c0b645c49770aca4d6e4430d','263df3b73ec844e89e6ce388e2ede14b','create_date','åˆ›å»ºæ—¶é—´','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'130','1','2018-03-07 16:26:03','1','2018-03-17 12:03:35',NULL,'0','0','0',NULL),('1f6d0fb1fdfe47cdb778d6af414d9108','0f64808413ec40b4890b094920d9ed3c','auth_id','ä½œè€…id','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','auth.id|name','0','0','1','1','0','1','=','userselect','',NULL,'40','1','2018-03-05 13:03:35','1','2018-03-05 14:14:52',NULL,'0','0','0',NULL),('207fcca5393b4fa2a5c6d72cdf5405f5','38e44531dea149a0a70219a175eb65cb','del_flag','åˆ é™¤æ ‡è®°','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'40','1','2018-03-07 16:18:04','1','2018-03-07 16:18:04',NULL,'0','0','0',NULL),('20f4ff043bf24893b2c36c1611c77b64','0ef5b1fbbf594e32ac90c2524935eb15','del_flag','åˆ é™¤æ ‡è®°','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'40','1','2018-03-06 13:46:01','1','2018-03-11 13:42:45',NULL,'0','0','0',NULL),('212c4bcb1d7a41469094d64a3a796847','778b701a91b64ea5b35c17fd63948436','name','åç§°','varchar(50)','String','name','0','0','1','1','1','1','like','input','',NULL,'30','1','2018-03-07 16:15:19','1','2018-03-07 16:15:19',NULL,'0','0','0',NULL),('21756504ffdc487eb167a823f89c0c06','43d6d5acffa14c258340ce6765e46c6f','update_by','æ›´æ–°è€…','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input',NULL,NULL,'10','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('21b2d13671a84f6aaa65932fcd26aaf8','38e44531dea149a0a70219a175eb65cb','code','ç¼–å·','varchar(45)','String','code','0','0','1','1','1','1','=','input','',NULL,'20','1','2018-03-07 16:18:04','1','2018-03-07 16:18:04',NULL,'0','0','0',NULL),('21de0290a69741b9bb5c6106198afdac','3a4d8288c1ff4277b4beaed0ddad3301','update_by','æ›´æ–°è€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'70','1','2018-03-07 15:57:22','1','2018-03-07 15:59:38',NULL,'0','0','0',NULL),('221f969628834fc0a166be5837b1241e','de5493dc511c454a823c223814ad2ec3','create_date','create_date','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'60','1','2018-03-06 12:45:42','1','2018-03-06 12:45:42',NULL,'1','0','0',NULL),('2448c2b49fb943d4a78b91e99f2f60ed','67146f87f0b847a5a855efe4e9077e40','reference_flag','å‚è€ƒæ ‡è¯†ï¼š0-å¦ï¼Œ1-æ˜¯','char(1)','String','referenceFlag','0','1','1','1','0','0','=','input','',NULL,'110','1','2018-03-07 16:20:29','1','2018-03-07 16:20:29',NULL,'0','0','0',NULL),('24bbdc0a555e4412a106ab1c5f03008e','f6e4dafaa72f4c509636484715f33a96','parent_ids','æ‰€æœ‰çˆ¶çº§ç¼–å·','varchar2(2000)','String','parentIds','0','0','1','1','0','0','like','input',NULL,NULL,'3','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('25789828621845a688a5cecfd1240191','165367ce1a75430da8729b0561adce25','update_date','æ›´æ–°æ—¶é—´','datetime','java.util.Date','updateDate','0','0','1','0','0','0','=','dateselect','',NULL,'110','1','2018-03-25 16:00:45','1','2018-03-25 16:13:40',NULL,'0','0','0',NULL),('257ce6318f5a4df2b38efbc232add58e','5e8fb141d8f04235996da148395083ed','phone_number','è”ç³»ç”µè¯','varchar(45)','String','phoneNumber','0','1','1','1','0','1','=','input','',NULL,'120','1','2018-03-06 14:15:34','1','2018-03-06 14:15:34',NULL,'1','0','0',NULL),('259bedcec63f4d6ba8abab61920c1165','7ea5e9edfc8f4eb293b9f7d54d19f4f3','auth_id','auth_id','varchar(64)','String','authId','0','0','1','1','0','0','=','input','',NULL,'70','1','2018-04-20 17:02:29','1','2018-04-20 17:02:29',NULL,'0','0','0',NULL),('2662bb122ebb42f1b3d0ca3fded53fb5','fb90f165141648fe89fb2774ad2afbad','update_by','æ›´æ–°è€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'70','1','2018-03-07 16:09:01','1','2018-03-07 16:09:01',NULL,'0','0','0',NULL),('26702fd35e7749caaadf880273856c12','165367ce1a75430da8729b0561adce25','code','å¡å·','varchar(50)','String','code','0','1','1','1','1','1','=','input','',NULL,'20','1','2018-03-25 16:00:45','1','2018-03-25 16:13:40',NULL,'0','0','0',NULL),('268a5026fe6c4bab8ea3e21b2fe5e07c','6c9094e7e22b4aadb26da86e9b8cbaa3','code','ç¼–å·','varchar(45)','String','code','0','0','1','1','1','1','=','input','',NULL,'20','1','2018-03-07 16:11:10','1','2018-03-07 16:11:10',NULL,'0','0','0',NULL),('270b689e79f345e98b59b3c185c4aba0','778b701a91b64ea5b35c17fd63948436','del_flag','åˆ é™¤æ ‡è®°','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'40','1','2018-03-07 16:15:20','1','2018-03-07 16:15:20',NULL,'0','0','0',NULL),('27691c351b1c4f69bbcce922828e634a','165367ce1a75430da8729b0561adce25','create_by','åˆ›å»ºè€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'80','1','2018-03-25 16:00:45','1','2018-03-25 16:13:40',NULL,'0','0','0',NULL),('288f9e5e9d0147ba9c34fd1e93f00574','165367ce1a75430da8729b0561adce25','examination_code','ä½“æ£€ç¼–å·','varchar(50)','String','examinationCode','0','0','1','1','1','1','=','input','',NULL,'30','1','2018-03-25 16:00:45','1','2018-03-25 16:13:40',NULL,'0','0','0',NULL),('28b66c808a7f4b2081350be686834c85','b9dcbd6f07b34b09a7de65921518d6a1','update_date','æ›´æ–°æ—¶é—´','datetime','java.util.Date','updateDate','0','0','1','1','0','0','=','dateselect','',NULL,'80','1','2018-03-06 13:14:06','1','2018-03-11 13:42:28',NULL,'0','0','0',NULL),('2a26e00a841a4f35b0cbc35e1ad38d03','0f64808413ec40b4890b094920d9ed3c','del_flag','åˆ é™¤æ ‡è®°','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'110','1','2018-03-05 13:03:35','1','2018-03-05 14:14:52',NULL,'0','0','0',NULL),('2ac394219be2486e911c5962b79c83cf','fb90f165141648fe89fb2774ad2afbad','code','ç¼–å·','varchar(45)','String','code','0','0','1','1','1','1','=','input','',NULL,'20','1','2018-03-07 16:09:00','1','2018-03-07 16:09:00',NULL,'0','0','0',NULL),('2d061ef89c4d40b7bdaec788a6679207','38e44531dea149a0a70219a175eb65cb','reference_flag','å‚è€ƒæ ‡è¯†ï¼š0-å¦ï¼Œ1-æ˜¯','char(1)','String','referenceFlag','0','0','1','1','0','0','=','input','',NULL,'100','1','2018-03-07 16:18:05','1','2018-03-07 16:18:05',NULL,'0','0','0',NULL),('2d5382b8d1b2428abea57056c234dd4a','85e80c76deba4aeb93da7b186077c44a','owner','æ‰€å±ä½“æ£€ä¸­å¿ƒ','varchar(64)','String','owner','0','1','1','1','0','0','=','input','',NULL,'110','1','2018-03-14 12:07:44','1','2018-03-14 12:07:44',NULL,'0','0','0',NULL),('2d90964356834f93914a81afcd2e4061','38ca93fc0d8f4fa08d622c0ecdeefa6d','update_date','æ›´æ–°æ—¶é—´','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,'90','1','2018-03-07 16:23:20','1','2018-03-12 10:30:56',NULL,'0','0','0',NULL),('2d9df670af494b6ab74eaf75a94daf46','6c9094e7e22b4aadb26da86e9b8cbaa3','remarks','å¤‡æ³¨','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'90','1','2018-03-07 16:11:10','1','2018-03-07 16:11:10',NULL,'0','0','0',NULL),('2dc2fb84be5a465bb53a2972b10f0110','7003dd8eb3554a0ab99771fdd1464c74','reference_flag','å‚è€ƒæ ‡è¯†ï¼š0-å¦ï¼Œ1-æ˜¯','char(1)','String','referenceFlag','0','1','1','1','0','0','=','input','',NULL,'90','1','2018-03-12 12:24:07','1','2018-03-12 12:24:07',NULL,'0','0','0',NULL),('2e11469a981844f4ba0c517a1ee45b33','85e80c76deba4aeb93da7b186077c44a','create_date','åˆ›å»ºæ—¶é—´','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'60','1','2018-03-14 12:07:44','1','2018-03-14 12:07:44',NULL,'0','0','0',NULL),('2f2c57264a2240938f11a59df49ce29c','c657d573d06d48fd9e7c68bf8254674b','item_id','æ£€æŸ¥é¡¹ç›®','varchar(64)','String','itemId','0','0','1','1','0','0','=','input','',NULL,'30','1','2018-03-17 11:16:34','1','2018-03-17 11:16:34',NULL,'0','0','0',NULL),('2f941261702445f2b6a67f043770a608','38e44531dea149a0a70219a175eb65cb','create_by','åˆ›å»ºè€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'50','1','2018-03-07 16:18:04','1','2018-03-07 16:18:04',NULL,'0','0','0',NULL),('2f99f1f90c984294b35c24f4c88c21b5','fb90f165141648fe89fb2774ad2afbad','create_by','åˆ›å»ºè€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'50','1','2018-03-07 16:09:01','1','2018-03-07 16:09:01',NULL,'0','0','0',NULL),('318ab537ddbc4e7c8665bb1b7dc74392','5e8fb141d8f04235996da148395083ed','code','ç¼–å·','varchar(45)','String','code','0','0','1','1','0','1','like','input','',NULL,'20','1','2018-03-06 14:15:33','1','2018-03-06 14:15:33',NULL,'1','0','0',NULL),('32343a06a4bb47ee911de2627e95c25c','1fc82bd23cb64af4bc5f5874b9148aa3','update_by','æ›´æ–°è€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'130','1','2018-03-07 16:24:53','1','2018-03-07 16:24:53',NULL,'0','0','0',NULL),('33152ce420904594b3eac796a27f0560','6e05c389f3c6415ea34e55e9dfb28934','id','ç¼–å·','varchar2(64)','String','id','1','0','1','0','0','0','=','input',NULL,NULL,'1','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('335c7bde25e44763aba17f3668b09ce9','3a4d8288c1ff4277b4beaed0ddad3301','remarks','å¤‡æ³¨','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'90','1','2018-03-07 15:57:22','1','2018-03-07 15:59:38',NULL,'0','0','0',NULL),('35af241859624a01917ab64c3f4f0813','aef6f1fc948f4c9ab1c1b780bc471cc2','del_flag','åˆ é™¤æ ‡è®°ï¼ˆ0ï¼šæ­£å¸¸ï¼›1ï¼šåˆ é™¤ï¼‰','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'13','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('35e9ff3404d840f48bf7427f1ec1364a','67146f87f0b847a5a855efe4e9077e40','create_date','åˆ›å»ºæ—¶é—´','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'70','1','2018-03-07 16:20:28','1','2018-03-07 16:20:28',NULL,'0','0','0',NULL),('3830e7a9ac5f4b81b3f388a42f5d2745','1fc82bd23cb64af4bc5f5874b9148aa3','phone_number','è”ç³»ç”µè¯','varchar(45)','String','phoneNumber','0','0','1','1','1','1','=','input','',NULL,'40','1','2018-03-07 16:24:52','1','2018-03-07 16:24:52',NULL,'0','0','0',NULL),('38a37e1cb20b44419658b136831fe214','4beae09010714fba860989f8d26cf1d0','create_by','åˆ›å»ºè€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'50','1','2018-03-12 15:09:26','1','2018-03-12 16:36:54',NULL,'0','0','0',NULL),('38da3b896a5449a6bcbd55ca48cd0cf5','fb90f165141648fe89fb2774ad2afbad','create_date','åˆ›å»ºæ—¶é—´','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'60','1','2018-03-07 16:09:01','1','2018-03-07 16:09:01',NULL,'0','0','0',NULL),('398b4a03f06940bfb979ca574e1911e3','aef6f1fc948f4c9ab1c1b780bc471cc2','create_by','åˆ›å»ºè€…','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input',NULL,NULL,'8','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('3a7cf23ae48a4c849ceb03feffc7a524','43d6d5acffa14c258340ce6765e46c6f','area_id','å½’å±åŒºåŸŸ','nvarchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.Area','area.id|name','0','1','1','1','0','0','=','areaselect',NULL,NULL,'4','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('3ac1739bc6704c6d85621e72d849e369','7003dd8eb3554a0ab99771fdd1464c74','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-07 15:59:22','1','2018-03-12 12:24:06',NULL,'0','0','0',NULL),('3b2b00fb9257448f8976d0f39411fb2a','7ea5e9edfc8f4eb293b9f7d54d19f4f3','update_date','æ›´æ–°æ—¶é—´','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,'120','1','2018-04-20 17:02:29','1','2018-04-20 17:02:29',NULL,'0','0','0',NULL),('3b911e060ac54f0ab4ce2572814313d3','0f64808413ec40b4890b094920d9ed3c','update_by','æ›´æ–°è€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'80','1','2018-03-05 13:03:35','1','2018-03-05 14:14:52',NULL,'0','0','0',NULL),('3ba0c0ec74394de68d9f78e6a5587f5e','3a4d8288c1ff4277b4beaed0ddad3301','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-07 15:57:22','1','2018-03-07 15:59:38',NULL,'0','0','0',NULL),('3ce8ba6ba36a4fae906297e65df1cf94','a98828fcd5844036b3bd6203a5c2a15d','curr_val','å½“å‰å€¼ï¼Œå–ä¸€ä¸ªï¼Œå¢åŠ ä¸€ä¸ª','int(11)','String','currVal','0','0','1','1','0','0','=','input','',NULL,'30','1','2018-03-19 18:47:50','1','2018-03-19 18:47:50',NULL,'0','0','0',NULL),('3cef34196fe543c9aae306e0e167ff47','165367ce1a75430da8729b0561adce25','user_id','ä½“æ£€ç”¨æˆ·','varchar(64)','String','userId','0','0','1','1','0','1','=','fk_sys_user','',NULL,'40','1','2018-03-25 16:00:45','1','2018-03-25 16:13:40',NULL,'0','0','0','/sys/office/treeData?type=3'),('3d139b71a4fd47beaef6f40e7be75202','4beae09010714fba860989f8d26cf1d0','remarks','å¤‡æ³¨','varchar(255)','String','remarks','0','1','1','1','1','0','=','input','',NULL,'90','1','2018-03-12 15:09:26','1','2018-03-12 16:36:54',NULL,'0','0','0',NULL),('3d9c32865bb44e85af73381df0ffbf3d','43d6d5acffa14c258340ce6765e46c6f','update_date','æ›´æ–°æ—¶é—´','timestamp(6)','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect',NULL,NULL,'11','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('3df59db3747640d7a39d625ff54da67d','fb90f165141648fe89fb2774ad2afbad','update_date','æ›´æ–°æ—¶é—´','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,'80','1','2018-03-07 16:09:01','1','2018-03-07 16:09:01',NULL,'0','0','0',NULL),('3e265b4a836c4932807d6d2ed512eb21','5e8fb141d8f04235996da148395083ed','name','åç§°','varchar(50)','String','name','0','0','1','1','1','1','like','input','',NULL,'30','1','2018-03-06 14:15:33','1','2018-03-06 14:15:33',NULL,'1','0','0',NULL),('3e41db865c3b4601a05f65e6868b1632','263df3b73ec844e89e6ce388e2ede14b','industry_id','è¡Œä¸š','varchar(64)','String','industryId','0','0','1','1','0','0','=','select','',NULL,'70','1','2018-03-07 16:26:02','1','2018-03-17 12:03:35',NULL,'0','0','0',NULL),('3e4e90e6859b4d3cae042283499991ab','74db589fc1e74881be178df82449d5ee','remarks','å¤‡æ³¨','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'80','1','2018-03-07 16:03:59','1','2018-03-07 16:03:59',NULL,'0','0','0',NULL),('412cd53f68c54d22aab2ec23db19166a','6c9094e7e22b4aadb26da86e9b8cbaa3','reference_flag','å‚è€ƒæ ‡è¯†ï¼š0-å¦ï¼Œ1-æ˜¯','char(1)','String','referenceFlag','0','0','1','1','0','0','=','input','',NULL,'100','1','2018-03-07 16:11:10','1','2018-03-07 16:11:10',NULL,'0','0','0',NULL),('416c76d2019b4f76a96d8dc3a8faf84c','f6e4dafaa72f4c509636484715f33a96','update_date','æ›´æ–°æ—¶é—´','timestamp(6)','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect',NULL,NULL,'9','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('420fc0cf4a00411a8e05700064afcda4','8cc24412bbc4414a9ab589e7877028f9','name','åç§°','varchar(50)','String','name','0','0','1','1','1','1','like','input','',NULL,'20','1','2018-03-07 16:19:26','1','2018-03-07 16:19:26',NULL,'1','0','0',NULL),('4455a83bdab84eb7a36fae65d96995e9','7ea5e9edfc8f4eb293b9f7d54d19f4f3','create_by','åˆ›å»ºè€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'90','1','2018-04-20 17:02:29','1','2018-04-20 17:02:29',NULL,'0','0','0',NULL),('44f9d55e0c1841c3b7e3b667569222a8','5e8fb141d8f04235996da148395083ed','enable_date','æœ‰æ•ˆæœŸ','datetime','java.util.Date','enableDate','0','0','1','1','0','1','=','dateselect','',NULL,'100','1','2018-03-06 14:15:33','1','2018-03-06 14:15:33',NULL,'1','0','0',NULL),('4572ae9b9f51475faeeceb037b2f3ae3','38ca93fc0d8f4fa08d622c0ecdeefa6d','item_id','æ£€æŸ¥é¡¹ç›®','varchar(64)','String','itemId','0','0','1','1','0','0','=','select','',NULL,'30','1','2018-03-07 16:23:20','1','2018-03-12 10:30:56',NULL,'0','0','0',NULL),('46e6d8283270493687085d29efdecb05','f6e4dafaa72f4c509636484715f33a96','del_flag','åˆ é™¤æ ‡è®°ï¼ˆ0ï¼šæ­£å¸¸ï¼›1ï¼šåˆ é™¤ï¼‰','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'11','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('472601e6e45c41d69594b6f67329343b','263df3b73ec844e89e6ce388e2ede14b','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-07 16:26:02','1','2018-03-17 12:03:35',NULL,'0','0','0',NULL),('475f39608f9e4e6eac7d95a7dfb900ea','38e44531dea149a0a70219a175eb65cb','unit','å•ä½','varchar(64)','String','unit','0','0','1','1','1','0','=','input','',NULL,'130','1','2018-03-07 16:18:05','1','2018-03-07 16:18:05',NULL,'0','0','0',NULL),('47d61f891eda491dbf9c3ea17f7efc6d','5e8fb141d8f04235996da148395083ed','remarks','å¤‡æ³¨','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'150','1','2018-03-06 14:15:34','1','2018-03-06 14:15:34',NULL,'1','0','0',NULL),('48bfa2bcd0fa4d4bb1d6cfe011789153','6c9094e7e22b4aadb26da86e9b8cbaa3','update_by','æ›´æ–°è€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'70','1','2018-03-07 16:11:10','1','2018-03-07 16:11:10',NULL,'0','0','0',NULL),('4a0a1fff86ca46519477d66b82e01991','aef6f1fc948f4c9ab1c1b780bc471cc2','name','åç§°','nvarchar2(100)','String','name','0','1','1','1','1','1','like','input',NULL,NULL,'5','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('4bb81aa2d9014d8d922de9eec6f88172','8cc24412bbc4414a9ab589e7877028f9','create_by','åˆ›å»ºè€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'70','1','2018-03-07 16:19:26','1','2018-03-07 16:19:26',NULL,'1','0','0',NULL),('4c8ef12cb6924b9ba44048ba9913150b','43d6d5acffa14c258340ce6765e46c6f','create_date','åˆ›å»ºæ—¶é—´','timestamp(6)','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect',NULL,NULL,'9','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('4df3b7d6db12496f896eb5a8fb7d11fc','0c1a5cd70b104852b79102cb62270f52','specimen_name','æ ·æœ¬ç±»å‹åç§°','varchar(64)','String','specimenName','0','1','1','1','0','0','=','input','',NULL,'30','1','2018-04-20 16:58:56','1','2018-04-20 16:58:56',NULL,'0','0','0',NULL),('4e42469cbe3c489394e6a4de89ff1c18','38e44531dea149a0a70219a175eb65cb','range_min','å‚è€ƒèŒƒå›´æœ€å°å€¼','varchar(45)','String','rangeMin','0','1','1','1','1','0','=','input','',NULL,'160','1','2018-03-07 16:18:05','1','2018-03-07 16:18:05',NULL,'0','0','0',NULL),('4eb26e0e6081442ca0ef1dacd15ae234','6c9094e7e22b4aadb26da86e9b8cbaa3','update_date','æ›´æ–°æ—¶é—´','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,'80','1','2018-03-07 16:11:10','1','2018-03-07 16:11:10',NULL,'0','0','0',NULL),('505fa2c2cff04c8fa19f1fc1cecf0b6e','0c1a5cd70b104852b79102cb62270f52','code_count','æ ·æœ¬ç¼–å·æ•°é‡','varchar(10)','String','codeCount','0','1','1','1','0','0','=','input','',NULL,'40','1','2018-04-20 16:58:56','1','2018-04-20 16:58:56',NULL,'0','0','0',NULL),('515ff9d8b2804fbc9cb73d0a22369cf5','de5493dc511c454a823c223814ad2ec3','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-06 12:45:42','1','2018-03-06 12:45:42',NULL,'1','0','0',NULL),('5295e8257a754bc29d4cf052a3a13184','6c9094e7e22b4aadb26da86e9b8cbaa3','owner','æ‰€å±ä½“æ£€ä¸­å¿ƒ','varchar(64)','String','owner','0','1','1','1','0','0','=','input','',NULL,'110','1','2018-03-07 16:11:10','1','2018-03-07 16:11:10',NULL,'0','0','0',NULL),('53d65a3d306d4fac9e561db9d3c66912','6e05c389f3c6415ea34e55e9dfb28934','del_flag','åˆ é™¤æ ‡è®°ï¼ˆ0ï¼šæ­£å¸¸ï¼›1ï¼šåˆ é™¤ï¼‰','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'9','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('55131190e5a74828bdd96241fb66a2d0','8cc24412bbc4414a9ab589e7877028f9','item_id','æ£€æŸ¥é¡¹ç›®','varchar(64)','String','itemId','0','0','1','1','0','0','=','input','',NULL,'40','1','2018-03-07 16:19:26','1','2018-03-07 16:19:26',NULL,'1','0','0',NULL),('55473826ef53403f9c2600a62593374c','0ef5b1fbbf594e32ac90c2524935eb15','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-06 13:46:01','1','2018-03-11 13:42:45',NULL,'0','0','0',NULL),('5572d9a2e9dc444281603cc0390a34f3','67146f87f0b847a5a855efe4e9077e40','name','åç§°','varchar(50)','String','name','0','0','1','1','1','1','like','input','',NULL,'20','1','2018-03-07 16:20:28','1','2018-03-07 16:20:28',NULL,'0','0','0',NULL),('56456cb1916e4e46bb289e9420a03565','7ea5e9edfc8f4eb293b9f7d54d19f4f3','id','ç¼–å·','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-04-20 17:02:28','1','2018-04-20 17:02:28',NULL,'0','0','0',NULL),('56c7d4476cd74d15891a77eb69c1521d','778b701a91b64ea5b35c17fd63948436','create_date','åˆ›å»ºæ—¶é—´','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'60','1','2018-03-07 16:15:20','1','2018-03-07 16:15:20',NULL,'0','0','0',NULL),('56d12196f64141c18c38eaa12b3b1e03','67146f87f0b847a5a855efe4e9077e40','category_id','æ£€æŸ¥ç±»åˆ«','varchar(64)','String','categoryId','0','0','1','1','0','0','=','input','',NULL,'40','1','2018-03-07 16:20:28','1','2018-03-07 16:20:28',NULL,'0','0','0',NULL),('56fa71c0bd7e4132931874e548dc9ba5','6e05c389f3c6415ea34e55e9dfb28934','update_by','æ›´æ–°è€…','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input',NULL,NULL,'6','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('572d26f0eb2c4ba4a436af28482b112f','38ca93fc0d8f4fa08d622c0ecdeefa6d','update_by','æ›´æ–°è€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'80','1','2018-03-07 16:23:20','1','2018-03-12 10:30:56',NULL,'0','0','0',NULL),('57b2e7e12a0147f8b9c475ab3afcddf0','b9dcbd6f07b34b09a7de65921518d6a1','owner','æ‰€å±ä½“æ£€ä¸­å¿ƒ','varchar(64)','String','owner','0','1','1','1','0','0','=','input','',NULL,'110','1','2018-03-11 13:42:01','1','2018-03-11 13:42:29',NULL,'0','0','0',NULL),('5806cd01e87842f5a7d0c33d989893d7','38e44531dea149a0a70219a175eb65cb','specimen_id','æ‰€éœ€æ ‡æœ¬','varchar(64)','String','specimenId','0','1','1','1','1','0','=','input','',NULL,'170','1','2018-03-07 16:18:05','1','2018-03-07 16:18:05',NULL,'0','0','0',NULL),('58a5b27c3a74472083958f84f74d677e','38ca93fc0d8f4fa08d622c0ecdeefa6d','default_flag','æ˜¯å¦é»˜è®¤ï¼š0-å¦ï¼Œ1-æ˜¯','char(1)','String','defaultFlag','0','0','1','1','0','0','=','select','yes_no',NULL,'40','1','2018-03-07 16:23:20','1','2018-03-12 10:30:56',NULL,'0','0','0',NULL),('593d8788493b4dea9bb206226bccf5f2','7003dd8eb3554a0ab99771fdd1464c74','remarks','å¤‡æ³¨','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'80','1','2018-03-07 15:59:22','1','2018-03-12 12:24:07',NULL,'0','0','0',NULL),('59ac652f303d4695ae8750ab96034943','74db589fc1e74881be178df82449d5ee','name','åç§°','varchar(50)','String','name','0','0','1','1','1','1','like','input','',NULL,'20','1','2018-03-07 16:03:59','1','2018-03-07 16:03:59',NULL,'0','0','0',NULL),('5a4a1933c9c844fdba99de043dc8205e','aef6f1fc948f4c9ab1c1b780bc471cc2','update_by','æ›´æ–°è€…','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input',NULL,NULL,'10','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('5aa171b6dced474785f6b555102749ad','38e44531dea149a0a70219a175eb65cb','type_id','æ£€æŸ¥é¡¹ç›®ç±»å‹','varchar(64)','String','typeId','0','0','1','1','0','0','=','input','',NULL,'120','1','2018-03-07 16:18:05','1','2018-03-07 16:18:05',NULL,'0','0','0',NULL),('5cd32b23e2ee49eca43231cf58718ce6','5ccbcfb5e27348c4826ed976bbd1cc56','update_by','æ›´æ–°è€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'70','1','2018-03-03 00:29:13','1','2018-03-03 00:29:13',NULL,'1','0','0',NULL),('5e5c69bd3eaa4dcc9743f361f3771c08','aef6f1fc948f4c9ab1c1b780bc471cc2','id','ç¼–å·','varchar2(64)','String','id','1','0','1','0','0','0','=','input',NULL,NULL,'1','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('5fc81de91c29413eb6ee77953460709e','67146f87f0b847a5a855efe4e9077e40','owner','æ‰€å±ä½“æ£€ä¸­å¿ƒ','varchar(64)','String','owner','0','1','1','1','0','0','=','input','',NULL,'120','1','2018-03-07 16:20:29','1','2018-03-07 16:20:29',NULL,'0','0','0',NULL),('60c08cbd528347e983d130f12ec7a36a','0f64808413ec40b4890b094920d9ed3c','auth_name','ä½œè€…','varchar(64)','String','authName','0','1','0','0','0','0','=','input','',NULL,'50','1','2018-03-05 13:03:35','1','2018-03-05 14:14:52',NULL,'0','0','0',NULL),('60c3114025c34127ae1398112db07fb8','0c1a5cd70b104852b79102cb62270f52','create_date','åˆ›å»ºæ—¶é—´','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'80','1','2018-04-20 16:58:56','1','2018-04-20 16:58:56',NULL,'0','0','0',NULL),('627381bc3bf74bc18722ae47ce9dd507','5ccbcfb5e27348c4826ed976bbd1cc56','del_flag','åˆ é™¤æ ‡è®°','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'100','1','2018-03-03 00:29:13','1','2018-03-03 00:29:13',NULL,'1','0','0',NULL),('62d06ee60e6c4ce38047bd42da833844','0c1a5cd70b104852b79102cb62270f52','create_by','åˆ›å»ºè€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'70','1','2018-04-20 16:58:56','1','2018-04-20 16:58:56',NULL,'0','0','0',NULL),('633f5a49ec974c099158e7b3e6bfa930','f6e4dafaa72f4c509636484715f33a96','name','åç§°','nvarchar2(100)','String','name','0','0','1','1','1','1','like','input',NULL,NULL,'4','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('63500ca2a8934c1aaf7beff01c4d7d72','0ef5b1fbbf594e32ac90c2524935eb15','create_date','åˆ›å»ºæ—¶é—´','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'60','1','2018-03-06 13:46:01','1','2018-03-11 13:42:45',NULL,'0','0','0',NULL),('652491500f2641ffa7caf95a93e64d34','6e05c389f3c6415ea34e55e9dfb28934','update_date','æ›´æ–°æ—¶é—´','timestamp(6)','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect',NULL,NULL,'7','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('65715e24446e475ab02ae7379c18ca3a','38e44531dea149a0a70219a175eb65cb','name','åç§°','varchar(50)','String','name','0','0','1','1','1','1','like','input','',NULL,'30','1','2018-03-07 16:18:04','1','2018-03-07 16:18:04',NULL,'0','0','0',NULL),('664996d9b3c54097918122c2f2b82ae1','1fc82bd23cb64af4bc5f5874b9148aa3','sex','æ€§åˆ«','varchar(64)','String','sex','0','0','1','1','1','0','=','input','',NULL,'50','1','2018-03-07 16:24:52','1','2018-03-07 16:24:52',NULL,'0','0','0',NULL),('673f21591d3d44bf8aeb233f643951ee','263df3b73ec844e89e6ce388e2ede14b','update_date','æ›´æ–°æ—¶é—´','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,'150','1','2018-03-07 16:26:03','1','2018-03-17 12:03:35',NULL,'0','0','0',NULL),('6763ff6dc7cd4c668e76cf9b697d3ff6','f6e4dafaa72f4c509636484715f33a96','sort','æ’åº','number(10)','Integer','sort','0','0','1','1','1','0','=','input',NULL,NULL,'5','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('676f0bb881b9495294e8fbe6a0dc140f','b9dcbd6f07b34b09a7de65921518d6a1','create_by','åˆ›å»ºè€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'50','1','2018-03-06 13:14:06','1','2018-03-11 13:42:28',NULL,'0','0','0',NULL),('67d0331f809a48ee825602659f0778e8','43d6d5acffa14c258340ce6765e46c6f','name','åç§°','nvarchar2(100)','String','name','0','1','1','1','1','1','like','input',NULL,NULL,'5','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('67e2c8c4b6d8469fa2c20d55edd331e4','67146f87f0b847a5a855efe4e9077e40','price','ä»·æ ¼','varchar(100)','String','price','0','1','1','1','1','0','=','input','',NULL,'30','1','2018-03-07 16:20:28','1','2018-03-07 16:20:28',NULL,'0','0','0',NULL),('68345713bef3445c906f70e68f55de38','6e05c389f3c6415ea34e55e9dfb28934','test_data_main_id','ä¸šåŠ¡ä¸»è¡¨','varchar2(64)','String','testDataMain.id','0','1','1','1','0','0','=','input',NULL,NULL,'2','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('69d51444dd4641f4bb4743333f4fdbf8','85e80c76deba4aeb93da7b186077c44a','code','ç¼–å·','varchar(45)','String','code','0','0','1','1','0','0','=','input','',NULL,'20','1','2018-03-14 12:07:44','1','2018-03-14 12:07:44',NULL,'0','0','0',NULL),('69f49d4af6134400b2d483028d9e42e8','b9dcbd6f07b34b09a7de65921518d6a1','remarks','å¤‡æ³¨','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'90','1','2018-03-06 14:12:20','1','2018-03-11 13:42:28',NULL,'0','0','0',NULL),('6a156a5bb89d49ed81a1afad7e97c9bd','778b701a91b64ea5b35c17fd63948436','code','ç¼–å·','varchar(45)','String','code','0','0','1','1','1','1','=','input','',NULL,'20','1','2018-03-07 16:15:19','1','2018-03-07 16:15:19',NULL,'0','0','0',NULL),('6a6651ff4b08424f9706bffeb8c14a02','7ea5e9edfc8f4eb293b9f7d54d19f4f3','sample_code','æ ·æœ¬ç¼–å·','varchar(64)','String','sampleCode','0','0','1','1','0','0','=','input','',NULL,'50','1','2018-04-20 17:02:28','1','2018-04-20 17:02:28',NULL,'0','0','0',NULL),('6a6805388b63411485a6275b2314deb0','38ca93fc0d8f4fa08d622c0ecdeefa6d','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-07 16:23:20','1','2018-03-12 10:30:56',NULL,'0','0','0',NULL),('6a84032a85284d26b1abb6998fe0148d','0c1a5cd70b104852b79102cb62270f52','auth_id','auth_id','varchar(64)','String','authId','0','0','1','1','0','0','=','input','',NULL,'50','1','2018-04-20 16:58:56','1','2018-04-20 16:58:56',NULL,'0','0','0',NULL),('6ae109f6e1c241e4bcf260f372ad2588','6c9094e7e22b4aadb26da86e9b8cbaa3','name','åç§°','varchar(50)','String','name','0','0','1','1','1','1','like','input','',NULL,'30','1','2018-03-07 16:11:10','1','2018-03-07 16:11:10',NULL,'0','0','0',NULL),('6b9cae3a6c8d45518328fb3cc8f6ecdb','fb90f165141648fe89fb2774ad2afbad','remarks','å¤‡æ³¨','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'90','1','2018-03-07 16:09:01','1','2018-03-07 16:09:01',NULL,'0','0','0',NULL),('6c2824179cb74c97847a26f65d0b9e61','0c1a5cd70b104852b79102cb62270f52','auth_name','ä½œè€…','varchar(64)','String','authName','0','1','1','1','0','0','=','input','',NULL,'60','1','2018-04-20 16:58:56','1','2018-04-20 16:58:56',NULL,'0','0','0',NULL),('6e068514809b4a00998d6d0b5f34f83b','c657d573d06d48fd9e7c68bf8254674b','record_id','æ£€æŸ¥è®°å½•','varchar(64)','String','recordId','0','0','1','1','0','0','=','input','',NULL,'20','1','2018-03-17 11:16:34','1','2018-03-17 11:16:34',NULL,'0','0','0',NULL),('711243d6e0f142c7acbaffe279edfd1e','7003dd8eb3554a0ab99771fdd1464c74','create_by','åˆ›å»ºè€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'40','1','2018-03-07 15:59:22','1','2018-03-12 12:24:06',NULL,'0','0','0',NULL),('71ea4bc10d274911b405f3165fc1bb1a','aef6f1fc948f4c9ab1c1b780bc471cc2','area_id','å½’å±åŒºåŸŸ','nvarchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.Area','area.id|name','0','1','1','1','1','1','=','areaselect',NULL,NULL,'4','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('72e35cc1216146b582ef50babdf78f78','5ccbcfb5e27348c4826ed976bbd1cc56','auth_name','ä½œè€…','varchar(64)','String','authName','0','1','1','1','0','1','=','input','',NULL,'40','1','2018-03-03 00:29:13','1','2018-03-03 00:29:13',NULL,'1','0','0',NULL),('731c937506604874a998379435687897','67146f87f0b847a5a855efe4e9077e40','update_date','æ›´æ–°æ—¶é—´','datetime','java.util.Date','updateDate','0','0','1','1','0','0','=','dateselect','',NULL,'90','1','2018-03-07 16:20:28','1','2018-03-07 16:20:28',NULL,'0','0','0',NULL),('750a345675f94ec7bf239a08d212d857','0ef5b1fbbf594e32ac90c2524935eb15','code','ç¼–å·','varchar(45)','String','code','0','0','1','1','1','1','like','input','',NULL,'20','1','2018-03-06 13:46:01','1','2018-03-11 13:42:45',NULL,'0','0','0',NULL),('7546051fe713464dbfed534779d74f49','263df3b73ec844e89e6ce388e2ede14b','owner','æ‰€å±ä½“æ£€ä¸­å¿ƒ','varchar(64)','String','owner','0','1','1','1','0','0','=','input','',NULL,'170','1','2018-03-07 16:26:03','1','2018-03-17 12:03:35',NULL,'0','0','0',NULL),('75f8e3d3d89f4141977f28b3af5c6d38','85e80c76deba4aeb93da7b186077c44a','create_by','åˆ›å»ºè€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'50','1','2018-03-14 12:07:44','1','2018-03-14 12:07:44',NULL,'0','0','0',NULL),('78f5f07499164fa2865fb141922548a9','263df3b73ec844e89e6ce388e2ede14b','user_id','ä½“æ£€ç”¨æˆ·','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','user.id','0','0','1','1','1','1','=','fk_sys_user','',NULL,'20','1','2018-03-07 16:26:02','1','2018-03-17 12:03:35',NULL,'0','0','0','/sys/office/treeData?type=3'),('798673faab5f419397dfc5fea736b12e','165367ce1a75430da8729b0561adce25','id_number','èº«ä»½è¯å·','varchar(20)','String','idNumber','0','1','1','1','1','1','=','input','',NULL,'50','1','2018-03-25 16:00:45','1','2018-03-25 16:13:40',NULL,'0','0','0',NULL),('79cfd1a3c38f4f2687647b39861f85ea','c657d573d06d48fd9e7c68bf8254674b','remarks','å¤‡æ³¨','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'110','1','2018-03-17 11:16:34','1','2018-03-17 11:16:34',NULL,'0','0','0',NULL),('7b07da14d0af40049ac9f543aca65a5f','263df3b73ec844e89e6ce388e2ede14b','package_price','å¥—é¤ä»·æ ¼','varchar(64)','String','packagePrice','0','1','1','1','1','0','=','input','',NULL,'190','1','2018-03-07 16:26:03','1','2018-03-17 12:03:35',NULL,'0','0','0',NULL),('7b41844a657e4f7db7a506e88cfbff1d','778b701a91b64ea5b35c17fd63948436','owner','æ‰€å±ä½“æ£€ä¸­å¿ƒ','varchar(64)','String','owner','0','1','1','1','0','0','=','input','',NULL,'110','1','2018-03-07 16:15:20','1','2018-03-07 16:15:20',NULL,'0','0','0',NULL),('7b41d9d496f8419eb845f0c12ca9de60','7ea5e9edfc8f4eb293b9f7d54d19f4f3','auth_name','ä½œè€…','varchar(64)','String','authName','0','1','1','1','0','0','=','input','',NULL,'80','1','2018-04-20 17:02:29','1','2018-04-20 17:02:29',NULL,'0','0','0',NULL),('7b51ff26a6a7416ab09014dd820e0b5e','fb90f165141648fe89fb2774ad2afbad','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-07 16:09:00','1','2018-03-07 16:09:00',NULL,'0','0','0',NULL),('7c5599e103d5466395fb2e928a04ef6f','de5493dc511c454a823c223814ad2ec3','code','code','varchar(45)','String','code','0','0','1','1','1','1','=','input','',NULL,'20','1','2018-03-06 12:45:42','1','2018-03-06 12:45:42',NULL,'1','0','0',NULL),('7d195536091b4432835bf199c7e0b424','778b701a91b64ea5b35c17fd63948436','update_by','æ›´æ–°è€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'70','1','2018-03-07 16:15:20','1','2018-03-07 16:15:20',NULL,'0','0','0',NULL),('7f871058d94c4d9a89084be7c9ce806d','6e05c389f3c6415ea34e55e9dfb28934','remarks','å¤‡æ³¨ä¿¡æ¯','nvarchar2(255)','String','remarks','0','1','1','1','1','0','=','input',NULL,NULL,'8','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('7facc7a3c64c43de8db0438a05a19012','1fc82bd23cb64af4bc5f5874b9148aa3','post_id','å²—ä½','varchar(64)','String','postId','0','0','1','1','0','0','=','input','',NULL,'70','1','2018-03-07 16:24:52','1','2018-03-07 16:24:52',NULL,'0','0','0',NULL),('802d777e0bd04ce6918cc8c7fb9ad868','0f64808413ec40b4890b094920d9ed3c','update_date','æ›´æ–°æ—¶é—´','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,'90','1','2018-03-05 13:03:35','1','2018-03-05 14:14:52',NULL,'0','0','0',NULL),('8168e1ab2f864618a11ceb1120e1fc8d','8cc24412bbc4414a9ab589e7877028f9','update_date','æ›´æ–°æ—¶é—´','datetime','java.util.Date','updateDate','0','0','1','1','0','0','=','dateselect','',NULL,'100','1','2018-03-07 16:19:26','1','2018-03-07 16:19:26',NULL,'1','0','0',NULL),('84df1af9436d4e81a20662633407ee14','de5493dc511c454a823c223814ad2ec3','name','name','varchar(50)','String','name','0','0','1','1','1','1','like','input','',NULL,'30','1','2018-03-06 12:45:42','1','2018-03-06 12:45:42',NULL,'1','0','0',NULL),('862df9afa26d48abbf7adf6ff9e2c7a4','0f64808413ec40b4890b094920d9ed3c','content','å†…å®¹','varchar(20000)','String','content','0','0','1','1','0','0','=','ckeditor','',NULL,'30','1','2018-03-05 13:03:35','1','2018-03-05 14:14:52',NULL,'0','0','0',NULL),('865ccff0c236493fa5eca71976cbca4f','fb90f165141648fe89fb2774ad2afbad','reference_flag','å‚è€ƒæ ‡è¯†ï¼š0-å¦ï¼Œ1-æ˜¯','char(1)','String','referenceFlag','0','0','1','1','0','0','=','input','',NULL,'100','1','2018-03-07 16:09:01','1','2018-03-07 16:09:01',NULL,'0','0','0',NULL),('8667f2d3ed0b454fa795b1e9f28e898b','38e44531dea149a0a70219a175eb65cb','owner','æ‰€å±ä½“æ£€ä¸­å¿ƒ','varchar(64)','String','owner','0','1','1','1','0','0','=','input','',NULL,'110','1','2018-03-07 16:18:05','1','2018-03-07 16:18:05',NULL,'0','0','0',NULL),('87594b1c8f014674a6a5c8d02a4e873b','67146f87f0b847a5a855efe4e9077e40','remarks','å¤‡æ³¨','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'100','1','2018-03-07 16:20:29','1','2018-03-07 16:20:29',NULL,'0','0','0',NULL),('876b1d89c7474de8b7bb6110d657aa34','85e80c76deba4aeb93da7b186077c44a','update_by','æ›´æ–°è€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'70','1','2018-03-14 12:07:44','1','2018-03-14 12:07:44',NULL,'0','0','0',NULL),('87a0383b2e1e4fb2a7f05a131cc0761f','74db589fc1e74881be178df82449d5ee','create_date','åˆ›å»ºæ—¶é—´','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'50','1','2018-03-07 16:03:59','1','2018-03-07 16:03:59',NULL,'0','0','0',NULL),('89cbd17e03534d6694cf0a25b54bcc14','fb90f165141648fe89fb2774ad2afbad','del_flag','åˆ é™¤æ ‡è®°','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'40','1','2018-03-07 16:09:00','1','2018-03-07 16:09:00',NULL,'0','0','0',NULL),('8b4330c964b14507a33ee396d8287a68','4beae09010714fba860989f8d26cf1d0','update_date','æ›´æ–°æ—¶é—´','datetime','java.util.Date','updateDate','0','0','1','0','1','0','=','dateselect','',NULL,'80','1','2018-03-12 15:09:26','1','2018-03-12 16:36:54',NULL,'0','0','0',NULL),('8b48774cfe184913b8b5eb17639cf12d','43d6d5acffa14c258340ce6765e46c6f','create_by','åˆ›å»ºè€…','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input',NULL,NULL,'8','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('8b7cf0525519474ebe1de9e587eb7067','6e05c389f3c6415ea34e55e9dfb28934','create_date','åˆ›å»ºæ—¶é—´','timestamp(6)','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect',NULL,NULL,'5','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('8b9de88df53e485d8ef461c4b1824bc1','43d6d5acffa14c258340ce6765e46c6f','user_id','å½’å±ç”¨æˆ·','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','user.id|name','0','1','1','1','1','1','=','userselect',NULL,NULL,'2','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('8ba46b9ced4f47f1b6ba0dae8e0ad176','38ca93fc0d8f4fa08d622c0ecdeefa6d','name','åç§°','varchar(50)','String','name','0','0','1','1','1','1','like','input','',NULL,'20','1','2018-03-07 16:23:20','1','2018-03-12 10:30:56',NULL,'0','0','0',NULL),('8bcba22e49f642ffa0c156411fd32bad','3a4d8288c1ff4277b4beaed0ddad3301','code','ç¼–å·','varchar(45)','String','code','0','0','1','1','1','0','=','input','',NULL,'20','1','2018-03-07 15:57:22','1','2018-03-07 15:59:38',NULL,'0','0','0',NULL),('8c5349cef95847dcac90f6e2099018fd','85e80c76deba4aeb93da7b186077c44a','template_path','æ¨¡æ¿è·¯å¾„','varchar(64)','String','templatePath','0','1','1','1','0','0','=','input','',NULL,'120','1','2018-03-14 12:07:44','1','2018-03-14 12:07:44',NULL,'0','0','0',NULL),('8da38dbe5fe54e9bb1f9682c27fbf403','aef6f1fc948f4c9ab1c1b780bc471cc2','remarks','å¤‡æ³¨ä¿¡æ¯','nvarchar2(255)','String','remarks','0','1','1','1','1','0','=','textarea',NULL,NULL,'12','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('8eb444bae02148d6b8a7cf836cca3de1','38ca93fc0d8f4fa08d622c0ecdeefa6d','del_flag','åˆ é™¤æ ‡è®°','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'50','1','2018-03-07 16:23:20','1','2018-03-12 10:30:56',NULL,'0','0','0',NULL),('8f9d774237314e9f81de6537de987d74','0ef5b1fbbf594e32ac90c2524935eb15','name','åç§°','varchar(50)','String','name','0','0','1','1','1','1','like','input','',NULL,'30','1','2018-03-06 13:46:01','1','2018-03-11 13:42:45',NULL,'0','0','0',NULL),('9198fcb6d1f149aea720b817b690a17a','8cc24412bbc4414a9ab589e7877028f9','price','ä»·æ ¼','varchar(100)','String','price','0','1','1','1','1','0','=','input','',NULL,'30','1','2018-03-07 16:19:26','1','2018-03-07 16:19:26',NULL,'1','0','0',NULL),('91a06e50b6a9402badfb974605ea4407','4beae09010714fba860989f8d26cf1d0','del_flag','åˆ é™¤æ ‡è®°','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'40','1','2018-03-12 15:09:26','1','2018-03-12 16:36:54',NULL,'0','0','0',NULL),('91e1304f73894ee78b113ad4a524e0e8','778b701a91b64ea5b35c17fd63948436','create_by','åˆ›å»ºè€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'50','1','2018-03-07 16:15:20','1','2018-03-07 16:15:20',NULL,'0','0','0',NULL),('92481c16a0b94b0e8bba16c3c54eb1e4','f6e4dafaa72f4c509636484715f33a96','create_date','åˆ›å»ºæ—¶é—´','timestamp(6)','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect',NULL,NULL,'7','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('9295b9885260443fa50c19536af087fc','1fc82bd23cb64af4bc5f5874b9148aa3','industry_id','è¡Œä¸š','varchar(64)','String','industryId','0','0','1','1','0','0','=','input','',NULL,'60','1','2018-03-07 16:24:52','1','2018-03-07 16:24:52',NULL,'0','0','0',NULL),('933f03ca21e3454692568892f114e805','0ef5b1fbbf594e32ac90c2524935eb15','update_date','æ›´æ–°æ—¶é—´','datetime','java.util.Date','updateDate','0','0','1','1','0','0','=','dateselect','',NULL,'80','1','2018-03-06 13:46:01','1','2018-03-11 13:42:45',NULL,'0','0','0',NULL),('93a12b991185481c96750e053b5beeb7','8cc24412bbc4414a9ab589e7877028f9','update_by','æ›´æ–°è€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'90','1','2018-03-07 16:19:26','1','2018-03-07 16:19:26',NULL,'1','0','0',NULL),('94cb3adb334348a092533f039aa1ff85','7003dd8eb3554a0ab99771fdd1464c74','update_date','æ›´æ–°æ—¶é—´','datetime','java.util.Date','updateDate','0','0','1','1','0','0','=','dateselect','',NULL,'70','1','2018-03-07 15:59:22','1','2018-03-12 12:24:06',NULL,'0','0','0',NULL),('957fcf422b66419db0723d10b7f3139a','7313b302ac694a0f9639efaa0ad188d1','center_name','ä½“æ£€ä¸­å¿ƒåç§°ï¼Œæ·»åŠ åï¼Œè‡ªåŠ¨å¢åŠ åˆ°éƒ¨é—¨çš„ä½“æ£€ä¸­å¿ƒèŠ‚ç‚¹ä¸‹','varchar(32)','String','centerName','0','1','1','1','0','0','=','input','',NULL,'40','1','2018-04-18 11:31:06','1','2018-04-18 11:31:06',NULL,'0','0','0',NULL),('9861d597f67d458cb89ad3479d88f974','7313b302ac694a0f9639efaa0ad188d1','code_pre','å½“å‰ä½“æ£€ä¸­å¿ƒç¼–å·å‰ç¼€','varchar(16)','String','codePre','0','1','1','1','0','0','=','input','',NULL,'30','1','2018-04-18 11:31:06','1','2018-04-18 11:31:06',NULL,'0','0','0',NULL),('986419ff4a224aa6b6b11f58e9a9c692','fb90f165141648fe89fb2774ad2afbad','owner','æ‰€å±ä½“æ£€ä¸­å¿ƒ','varchar(64)','String','owner','0','1','1','0','0','0','=','input','',NULL,'110','1','2018-03-07 16:09:01','1','2018-03-07 16:09:01',NULL,'0','0','0',NULL),('98c1d297160543b0894fae18b56792a4','74db589fc1e74881be178df82449d5ee','create_by','åˆ›å»ºè€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'40','1','2018-03-07 16:03:59','1','2018-03-07 16:03:59',NULL,'0','0','0',NULL),('98fe8c837c2148e0b369f7dbadb4a2e7','263df3b73ec844e89e6ce388e2ede14b','update_by','æ›´æ–°è€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'140','1','2018-03-07 16:26:03','1','2018-03-17 12:03:35',NULL,'0','0','0',NULL),('99214ee17c73473fa53d4ec45d97ffe8','5ccbcfb5e27348c4826ed976bbd1cc56','update_date','æ›´æ–°æ—¶é—´','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,'80','1','2018-03-03 00:29:13','1','2018-03-03 00:29:13',NULL,'1','0','0',NULL),('9955912078e64220aeb8cb7dca6650ff','165367ce1a75430da8729b0561adce25','del_flag','åˆ é™¤æ ‡è®°','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'70','1','2018-03-25 16:00:45','1','2018-03-25 16:13:40',NULL,'0','0','0',NULL),('997eddec1fc14b1196567002a05d5847','85e80c76deba4aeb93da7b186077c44a','del_flag','åˆ é™¤æ ‡è®°','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'40','1','2018-03-14 12:07:44','1','2018-03-14 12:07:44',NULL,'0','0','0',NULL),('9a012c1d2f934dbf996679adb7cc827a','f6e4dafaa72f4c509636484715f33a96','parent_id','çˆ¶çº§ç¼–å·','varchar2(64)','This','parent.id|name','0','0','1','1','0','0','=','treeselect',NULL,NULL,'2','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('9a485e43a1964390b9ae76a644a14186','7003dd8eb3554a0ab99771fdd1464c74','create_date','åˆ›å»ºæ—¶é—´','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'50','1','2018-03-07 15:59:22','1','2018-03-12 12:24:06',NULL,'0','0','0',NULL),('9bc771570a924d49bb6787d4b84ac90a','0f64808413ec40b4890b094920d9ed3c','create_by','åˆ›å»ºè€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'60','1','2018-03-05 13:03:35','1','2018-03-05 14:14:52',NULL,'0','0','0',NULL),('9bf105aacb3d4fd1bc9fb12a8a5969a0','3a4d8288c1ff4277b4beaed0ddad3301','create_by','åˆ›å»ºè€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'50','1','2018-03-07 15:57:22','1','2018-03-07 15:59:38',NULL,'0','0','0',NULL),('9c5ee9a0633f43d087cfcb11b4cdbddf','38e44531dea149a0a70219a175eb65cb','price','ä»·æ ¼','varchar(45)','String','price','0','1','1','1','1','0','=','input','',NULL,'140','1','2018-03-07 16:18:05','1','2018-03-07 16:18:05',NULL,'0','0','0',NULL),('9d244adf2b7c4b81a4d0096d8603e6c9','7ea5e9edfc8f4eb293b9f7d54d19f4f3','specimen_name','æ ·æœ¬ç±»å‹åç§°','varchar(64)','String','specimenName','0','0','1','1','0','0','=','input','',NULL,'30','1','2018-04-20 17:02:28','1','2018-04-20 17:02:28',NULL,'0','0','0',NULL),('9d36c09d6ac34596a742a901486f2176','3a4d8288c1ff4277b4beaed0ddad3301','create_date','åˆ›å»ºæ—¶é—´','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'60','1','2018-03-07 15:57:22','1','2018-03-07 15:59:38',NULL,'0','0','0',NULL),('9e2454cb13e24b12b64c591f1084eb7e','263df3b73ec844e89e6ce388e2ede14b','organ_id','å•ä½','varchar(64)','String','organId','0','0','1','1','1','0','=','input','',NULL,'100','1','2018-03-07 16:26:03','1','2018-03-17 12:03:35',NULL,'0','0','0',NULL),('9f20a97606fe46079eea17b10f9fef4f','0c1a5cd70b104852b79102cb62270f52','update_date','æ›´æ–°æ—¶é—´','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,'100','1','2018-04-20 16:58:56','1','2018-04-20 16:58:56',NULL,'0','0','0',NULL),('9f54d0edf5a743899af64cbf7e73fe59','7003dd8eb3554a0ab99771fdd1464c74','name','åç§°','varchar(50)','String','name','0','0','1','1','1','1','like','input','',NULL,'20','1','2018-03-07 15:59:22','1','2018-03-12 12:24:06',NULL,'0','0','0',NULL),('a0c90ea85d5344da90c961ae9143a373','7313b302ac694a0f9639efaa0ad188d1','owner','æ‰€å±çš„ä½“æ£€ä¸­å¿ƒ','varchar(64)','String','owner','0','0','1','1','0','0','=','input','',NULL,'20','1','2018-04-18 11:31:06','1','2018-04-18 11:31:06',NULL,'0','0','0',NULL),('a0dc2ca52742486c96686ef218bbd455','8cc24412bbc4414a9ab589e7877028f9','del_flag','åˆ é™¤æ ‡è®°','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'60','1','2018-03-07 16:19:26','1','2018-03-07 16:19:26',NULL,'1','0','0',NULL),('a12598f2d8cf4ca1a03c21f9a1bbe18e','263df3b73ec844e89e6ce388e2ede14b','remarks','å¤‡æ³¨','varchar(255)','String','remarks','0','1','1','1','0','0','=','textarea','',NULL,'160','1','2018-03-07 16:26:03','1','2018-03-17 12:03:35',NULL,'0','0','0',NULL),('a1692cca65ca4b0c8951037b8aaeae0d','38e44531dea149a0a70219a175eb65cb','remarks','å¤‡æ³¨','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'90','1','2018-03-07 16:18:04','1','2018-03-07 16:18:04',NULL,'0','0','0',NULL),('a1ddeec1ba664735b1922803d942aa5f','de5493dc511c454a823c223814ad2ec3','create_by','create_by','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'50','1','2018-03-06 12:45:42','1','2018-03-06 12:45:42',NULL,'1','0','0',NULL),('a21a3bc1cac84a28b16d1ee4b52ebc3e','38e44531dea149a0a70219a175eb65cb','update_date','æ›´æ–°æ—¶é—´','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,'80','1','2018-03-07 16:18:04','1','2018-03-07 16:18:04',NULL,'0','0','0',NULL),('a290e56b770e454ba7e110e8c9567f72','778b701a91b64ea5b35c17fd63948436','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-07 16:15:19','1','2018-03-07 16:15:19',NULL,'0','0','0',NULL),('a4f8346c64db496fb0882911c4f6e661','7ea5e9edfc8f4eb293b9f7d54d19f4f3','update_by','æ›´æ–°è€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'110','1','2018-04-20 17:02:29','1','2018-04-20 17:02:29',NULL,'0','0','0',NULL),('a569004c6dbf4a24a5f6d9f48aa77569','5ccbcfb5e27348c4826ed976bbd1cc56','content','å†…å®¹','varchar(2000)','String','content','0','1','1','1','0','0','like','textarea','',NULL,'30','1','2018-03-03 00:29:13','1','2018-03-03 00:29:13',NULL,'1','0','0',NULL),('a60d713935934d4f8ae4cb0001417eec','165367ce1a75430da8729b0561adce25','remarks','å¤‡æ³¨','varchar(255)','String','remarks','0','1','1','0','1','0','=','textarea','',NULL,'120','1','2018-03-25 16:00:45','1','2018-03-25 16:13:40',NULL,'0','0','0',NULL),('a6f44ca21254496e989911d6c5923e61','38ca93fc0d8f4fa08d622c0ecdeefa6d','create_by','åˆ›å»ºè€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'60','1','2018-03-07 16:23:20','1','2018-03-12 10:30:56',NULL,'0','0','0',NULL),('a860674ea1584978a478c973633fe553','4beae09010714fba860989f8d26cf1d0','item_id','æ£€æŸ¥é¡¹ç›®','varchar(64)','String','itemId','0','0','1','1','0','0','=','select','',NULL,'30','1','2018-03-12 15:09:25','1','2018-03-12 16:36:54',NULL,'0','0','0',NULL),('a9c0460ac63e496d859b22646fab0e30','778b701a91b64ea5b35c17fd63948436','tips','æç¤ºä¿¡æ¯','varchar(100)','String','tips','0','1','1','1','0','0','=','input','',NULL,'140','1','2018-03-07 16:15:20','1','2018-03-07 16:15:20',NULL,'0','0','0',NULL),('ad3bf0d4b44b4528a5211a66af88f322','aef6f1fc948f4c9ab1c1b780bc471cc2','office_id','å½’å±éƒ¨é—¨','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.Office','office.id|name','0','1','1','1','1','1','=','officeselect',NULL,NULL,'3','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('ad8d8a9cef1e47e3a277f21b46e516df','b9dcbd6f07b34b09a7de65921518d6a1','name','åç§°','varchar(50)','String','name','0','0','1','1','1','1','like','input','',NULL,'30','1','2018-03-06 13:14:05','1','2018-03-11 13:42:28',NULL,'0','0','0',NULL),('afb4f5824f8848f581d4170cd989a405','67146f87f0b847a5a855efe4e9077e40','update_by','æ›´æ–°è€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'80','1','2018-03-07 16:20:28','1','2018-03-07 16:20:28',NULL,'0','0','0',NULL),('b25a71d5ddb241c9a2e7837e6090b938','38ca93fc0d8f4fa08d622c0ecdeefa6d','remarks','å…·ä½“æè¿°','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'100','1','2018-03-07 16:23:20','1','2018-03-12 10:30:56',NULL,'0','0','0',NULL),('b2f8713761f74e648455af46dc8b48a0','6c9094e7e22b4aadb26da86e9b8cbaa3','create_by','åˆ›å»ºè€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'50','1','2018-03-07 16:11:10','1','2018-03-07 16:11:10',NULL,'0','0','0',NULL),('b33b4e856c9a4692b13961eecbdeb797','74db589fc1e74881be178df82449d5ee','reference_flag','å‚è€ƒæ ‡è¯†ï¼š0-å¦ï¼Œ1-æ˜¯','char(1)','String','referenceFlag','0','0','1','1','0','0','=','input','',NULL,'90','1','2018-03-07 16:03:59','1','2018-03-07 16:03:59',NULL,'0','0','0',NULL),('b407063d3fab4650b62bbd3c1e2c5cf9','263df3b73ec844e89e6ce388e2ede14b','del_flag','åˆ é™¤æ ‡è®°','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'110','1','2018-03-07 16:26:03','1','2018-03-17 12:03:35',NULL,'0','0','0',NULL),('b465aa3c04f84c3aad7c38e9020d3c05','74db589fc1e74881be178df82449d5ee','owner','æ‰€å±ä½“æ£€ä¸­å¿ƒ','varchar(64)','String','owner','0','1','1','1','0','0','=','input','',NULL,'100','1','2018-03-07 16:03:59','1','2018-03-07 16:03:59',NULL,'0','0','0',NULL),('b5d65ecb68cd402783c083df0880421d','3a4d8288c1ff4277b4beaed0ddad3301','update_date','æ›´æ–°æ—¶é—´','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,'80','1','2018-03-07 15:57:22','1','2018-03-07 15:59:38',NULL,'0','0','0',NULL),('b6630779be72482c87f40a4178354a9e','85e80c76deba4aeb93da7b186077c44a','reference_flag','å‚è€ƒæ ‡è¯†ï¼š0-å¦ï¼Œ1-æ˜¯','char(1)','String','referenceFlag','0','1','1','1','0','0','=','input','',NULL,'100','1','2018-03-14 12:07:44','1','2018-03-14 12:07:44',NULL,'0','0','0',NULL),('b69dec91896e489a84a527b67cfe4a30','3a4d8288c1ff4277b4beaed0ddad3301','reference_flag','å‚è€ƒæ ‡è¯†ï¼š0-å¦ï¼Œ1-æ˜¯','char(1)','String','referenceFlag','0','0','1','1','0','0','=','input','',NULL,'100','1','2018-03-07 15:57:22','1','2018-03-07 15:59:38',NULL,'0','0','0',NULL),('b69e2f852b5846aca7d6bb7fbc7d0e8c','c657d573d06d48fd9e7c68bf8254674b','update_date','æ›´æ–°æ—¶é—´','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,'100','1','2018-03-17 11:16:34','1','2018-03-17 11:16:34',NULL,'0','0','0',NULL),('b77075c6bc8e463589f5c097819a1112','1fc82bd23cb64af4bc5f5874b9148aa3','del_flag','åˆ é™¤æ ‡è®°','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'100','1','2018-03-07 16:24:52','1','2018-03-07 16:24:52',NULL,'0','0','0',NULL),('b778aa9101794741b5e09a1c445f41c1','6c9094e7e22b4aadb26da86e9b8cbaa3','del_flag','åˆ é™¤æ ‡è®°','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'40','1','2018-03-07 16:11:10','1','2018-03-07 16:11:10',NULL,'0','0','0',NULL),('b7ac4b1d9b6248a5aea7d1894a5680ce','7ea5e9edfc8f4eb293b9f7d54d19f4f3','del_flag','åˆ é™¤æ ‡è®°','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'140','1','2018-04-20 17:02:29','1','2018-04-20 17:02:29',NULL,'0','0','0',NULL),('b7b4bf5892c04610b9960ccf902b7f8b','c657d573d06d48fd9e7c68bf8254674b','user_id','ä½“æ£€ç”¨æˆ·','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','user.id|name','0','0','1','1','0','0','=','fk_sys_user','',NULL,'40','1','2018-03-17 11:16:34','1','2018-03-17 11:16:34',NULL,'0','0','0','/sys/office/treeData?type=3'),('b7e92c0b93c94fc8becc27699b94175f','5e8fb141d8f04235996da148395083ed','mobile_number','æ‰‹æœºå·ç ','varchar(45)','String','mobileNumber','0','1','1','1','0','0','=','input','',NULL,'130','1','2018-03-06 14:15:34','1','2018-03-06 14:15:34',NULL,'1','0','0',NULL),('b8ec1bccf59e4a34a93a80cdb8458b23','0f64808413ec40b4890b094920d9ed3c','create_date','åˆ›å»ºæ—¶é—´','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'70','1','2018-03-05 13:03:35','1','2018-03-05 14:14:52',NULL,'0','0','0',NULL),('b9393983f5084983bc0e0e8ed1bdb417','5e8fb141d8f04235996da148395083ed','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-06 14:15:33','1','2018-03-06 14:15:33',NULL,'1','0','0',NULL),('b96c1a1f856d456bb6a4481432be9e44','38e44531dea149a0a70219a175eb65cb','range_max','å‚è€ƒèŒƒå›´æœ€å¤§å€¼','varchar(45)','String','rangeMax','0','1','1','1','1','0','=','input','',NULL,'150','1','2018-03-07 16:18:05','1','2018-03-07 16:18:05',NULL,'0','0','0',NULL),('badc51e2b7104d21badce5f4c3449294','1fc82bd23cb64af4bc5f5874b9148aa3','name','å§“å','varchar(50)','String','name','0','0','1','1','1','1','like','input','',NULL,'30','1','2018-03-07 16:24:52','1','2018-03-07 16:24:52',NULL,'0','0','0',NULL),('bb1256a8d1b741f6936d8fed06f45eed','f6e4dafaa72f4c509636484715f33a96','update_by','æ›´æ–°è€…','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input',NULL,NULL,'8','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('bb3e27c78dca4f769fbe0deb077b2833','4beae09010714fba860989f8d26cf1d0','update_by','æ›´æ–°è€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','0','0','0','=','input','',NULL,'70','1','2018-03-12 15:09:26','1','2018-03-12 16:36:54',NULL,'0','0','0',NULL),('bc9b35c59e084cc69ec79ff5c127a569','778b701a91b64ea5b35c17fd63948436','item_category_id','æ£€æŸ¥é¡¹ç›®åˆ†ç±»','varchar(64)','String','itemCategoryId','0','1','1','1','0','0','=','input','',NULL,'120','1','2018-03-07 16:15:20','1','2018-03-07 16:15:20',NULL,'0','0','0',NULL),('bcc7c7fb30174567ade2bbc98795405d','7313b302ac694a0f9639efaa0ad188d1','id','id','varchar(64)','String','id','0','1','1','0','0','0','=','input','',NULL,'10','1','2018-04-18 11:31:06','1','2018-04-18 11:31:06',NULL,'0','0','0',NULL),('bceb7e4f3f654368a6eb8a9d1f465142','6c9094e7e22b4aadb26da86e9b8cbaa3','create_date','åˆ›å»ºæ—¶é—´','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'60','1','2018-03-07 16:11:10','1','2018-03-07 16:11:10',NULL,'0','0','0',NULL),('bd956f146e6c47438a4856a49c7d6df3','b9dcbd6f07b34b09a7de65921518d6a1','code','ç¼–å·','varchar(45)','String','code','0','0','1','1','1','1','like','input','',NULL,'20','1','2018-03-06 13:14:05','1','2018-03-11 13:42:28',NULL,'0','0','0',NULL),('bdfa137220614eeb8069e4d125052311','c657d573d06d48fd9e7c68bf8254674b','create_by','åˆ›å»ºè€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'70','1','2018-03-17 11:16:34','1','2018-03-17 11:16:34',NULL,'0','0','0',NULL),('beb55815e6b64fbea6bc64339d338de0','165367ce1a75430da8729b0561adce25','owner','æ‰€å±ä½“æ£€ä¸­å¿ƒ','varchar(64)','String','owner','0','1','1','0','0','0','=','input','',NULL,'130','1','2018-03-25 16:00:45','1','2018-03-25 16:13:40',NULL,'0','0','0',NULL),('bf127ec98a0549deac8115d98dc69c17','5e8fb141d8f04235996da148395083ed','update_date','æ›´æ–°æ—¶é—´','datetime','java.util.Date','updateDate','0','0','1','1','0','0','=','dateselect','',NULL,'80','1','2018-03-06 14:15:33','1','2018-03-06 14:15:33',NULL,'1','0','0',NULL),('bfd43008788a4de9a2820d4cbf2c1988','263df3b73ec844e89e6ce388e2ede14b','name','å§“å','varchar(50)','String','name','0','0','1','1','1','1','like','input','',NULL,'40','1','2018-03-07 16:26:02','1','2018-03-17 12:03:35',NULL,'0','0','0',NULL),('c0b206a1a20444a39ebb994a963d547a','4beae09010714fba860989f8d26cf1d0','create_date','åˆ›å»ºæ—¶é—´','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'60','1','2018-03-12 15:09:26','1','2018-03-12 16:36:54',NULL,'0','0','0',NULL),('c267025ee68547c5a7711940d97deb46','74db589fc1e74881be178df82449d5ee','update_by','æ›´æ–°è€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'60','1','2018-03-07 16:03:59','1','2018-03-07 16:03:59',NULL,'0','0','0',NULL),('c290fd4a8a83488b951013612a43cb7e','0c1a5cd70b104852b79102cb62270f52','del_flag','åˆ é™¤æ ‡è®°','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'120','1','2018-04-20 16:58:57','1','2018-04-20 16:58:57',NULL,'0','0','0',NULL),('c3a354f9f4fc486c882127fef8d0970f','263df3b73ec844e89e6ce388e2ede14b','code','ç¼–å·','varchar(50)','String','code','0','0','1','1','0','1','=','input','',NULL,'30','1','2018-03-07 16:26:02','1','2018-03-17 12:03:35',NULL,'0','0','0',NULL),('c41b3ab77759453f9eb768c9c9951e46','8cc24412bbc4414a9ab589e7877028f9','remarks','å…·ä½“æè¿°','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'110','1','2018-03-07 16:19:26','1','2018-03-07 16:19:26',NULL,'1','0','0',NULL),('c4a221e65f43426ab3366bdee944ca5f','b9dcbd6f07b34b09a7de65921518d6a1','create_date','åˆ›å»ºæ—¶é—´','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'60','1','2018-03-06 13:14:06','1','2018-03-11 13:42:28',NULL,'0','0','0',NULL),('c4f62018248a47d59a08f0033e74116a','4beae09010714fba860989f8d26cf1d0','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-12 15:09:25','1','2018-03-12 16:36:54',NULL,'0','0','0',NULL),('c50304b46e9b4246a5a8a1ed954e55bc','0c1a5cd70b104852b79102cb62270f52','specimen_id','æ ·æœ¬ç±»å‹ID','varchar(128)','String','specimenId','0','1','1','1','0','0','=','input','',NULL,'20','1','2018-04-20 16:58:56','1','2018-04-20 16:58:56',NULL,'0','0','0',NULL),('c5c0ae36920d4c488be7e68256494eff','85e80c76deba4aeb93da7b186077c44a','name','åç§°','varchar(50)','String','name','0','0','1','1','1','1','like','input','',NULL,'30','1','2018-03-14 12:07:44','1','2018-03-14 12:07:44',NULL,'0','0','0',NULL),('c680b6620bca4361b4477539ee8c16d1','7ea5e9edfc8f4eb293b9f7d54d19f4f3','pack_id','æ‰¹æ¬¡id','varchar(64)','String','packId','0','1','1','1','0','0','=','input','',NULL,'40','1','2018-04-20 17:02:28','1','2018-04-20 17:02:28',NULL,'0','0','0',NULL),('c6c91884cdd644f4b7ab7a7f03cdf9ff','7003dd8eb3554a0ab99771fdd1464c74','update_by','æ›´æ–°è€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'60','1','2018-03-07 15:59:22','1','2018-03-12 12:24:06',NULL,'0','0','0',NULL),('c9291308de26401fb6b15691f52efbf3','1fc82bd23cb64af4bc5f5874b9148aa3','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-07 16:24:52','1','2018-03-07 16:24:52',NULL,'0','0','0',NULL),('ca68a2d403f0449cbaa1d54198c6f350','43d6d5acffa14c258340ce6765e46c6f','office_id','å½’å±éƒ¨é—¨','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.Office','office.id|name','0','1','1','1','0','0','=','officeselect',NULL,NULL,'3','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('cb9c0ec3da26432d9cbac05ede0fd1d0','43d6d5acffa14c258340ce6765e46c6f','remarks','å¤‡æ³¨ä¿¡æ¯','nvarchar2(255)','String','remarks','0','1','1','1','1','0','=','textarea',NULL,NULL,'12','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('cbc07d2265c243bf838af1b99f0372ab','b9dcbd6f07b34b09a7de65921518d6a1','update_by','æ›´æ–°è€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'70','1','2018-03-06 13:14:06','1','2018-03-11 13:42:28',NULL,'0','0','0',NULL),('cd08d51fb30d4beda8aa3ba44d22cb04','fb90f165141648fe89fb2774ad2afbad','name','åç§°','varchar(50)','String','name','0','0','1','1','1','1','like','input','',NULL,'30','1','2018-03-07 16:09:00','1','2018-03-07 16:09:00',NULL,'0','0','0',NULL),('cd206c6143fe408eab85668aa36ecc0e','263df3b73ec844e89e6ce388e2ede14b','status','ä½“æ£€çŠ¶æ€ï¼Œå¯¹åº”examination_record_statuså­—å…¸','varchar(64)','String','status','0','1','1','1','0','0','=','select','examination_record_status',NULL,'210','1','2018-03-17 11:20:22','1','2018-03-17 12:03:35',NULL,'0','0','0',NULL),('cf529cfdb8de4edfae51da29043d5930','0c1a5cd70b104852b79102cb62270f52','remarks','å¤‡æ³¨ä¿¡æ¯','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'110','1','2018-04-20 16:58:57','1','2018-04-20 16:58:57',NULL,'0','0','0',NULL),('cfcfa06ea61749c9b4c4dbc507e0e580','f6e4dafaa72f4c509636484715f33a96','id','ç¼–å·','varchar2(64)','String','id','1','0','1','0','0','0','=','input',NULL,NULL,'1','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('d0abf26bfdca40fc92cbb221bc0480fd','3a4d8288c1ff4277b4beaed0ddad3301','owner','æ‰€å±ä½“æ£€ä¸­å¿ƒ','varchar(64)','String','owner','0','1','1','1','0','0','=','input','',NULL,'110','1','2018-03-07 15:57:22','1','2018-03-07 15:59:38',NULL,'0','0','0',NULL),('d0c5e0c1b9204ad6a84c4a48f260f841','7ea5e9edfc8f4eb293b9f7d54d19f4f3','remarks','å¤‡æ³¨ä¿¡æ¯','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'130','1','2018-04-20 17:02:29','1','2018-04-20 17:02:29',NULL,'0','0','0',NULL),('d1d3395d7389427895089f9cbe1b11e5','c657d573d06d48fd9e7c68bf8254674b','del_flag','åˆ é™¤æ ‡è®°','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'60','1','2018-03-17 11:16:34','1','2018-03-17 11:16:34',NULL,'0','0','0',NULL),('d3bccf699f944badab077ddb124a21b6','0ef5b1fbbf594e32ac90c2524935eb15','update_by','æ›´æ–°è€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'70','1','2018-03-06 13:46:01','1','2018-03-11 13:42:45',NULL,'0','0','0',NULL),('d4b931fbba764d0d873c502002433be5','0f64808413ec40b4890b094920d9ed3c','remarks','å¤‡æ³¨ä¿¡æ¯','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'100','1','2018-03-05 13:03:35','1','2018-03-05 14:14:52',NULL,'0','0','0',NULL),('d5c2d932ae904aa8a9f9ef34cd36fb0b','43d6d5acffa14c258340ce6765e46c6f','sex','æ€§åˆ«','char(1)','String','sex','0','1','1','1','0','1','=','select','sex',NULL,'6','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('d7275267c20f44fd8d3711d3bd029b61','5e8fb141d8f04235996da148395083ed','create_date','åˆ›å»ºæ—¶é—´','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'60','1','2018-03-06 14:15:33','1','2018-03-06 14:15:33',NULL,'1','0','0',NULL),('d93a4f3f582a4788a20b11a8bece9b18','7ea5e9edfc8f4eb293b9f7d54d19f4f3','create_date','åˆ›å»ºæ—¶é—´','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'100','1','2018-04-20 17:02:29','1','2018-04-20 17:02:29',NULL,'0','0','0',NULL),('d9700df921b24be98672fe6195260184','a98828fcd5844036b3bd6203a5c2a15d','noid','noid','char(32)','String','noid','1','0','1','1','0','0','=','input','',NULL,'10','1','2018-03-19 18:47:50','1','2018-03-19 18:47:50',NULL,'0','0','0',NULL),('d9e260363a7e4bd6b49f1c653ecb6449','1fc82bd23cb64af4bc5f5874b9148aa3','remarks','å¤‡æ³¨','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'150','1','2018-03-07 16:24:53','1','2018-03-07 16:24:53',NULL,'0','0','0',NULL),('dad973735423470cb9d6dc4105d19f16','5e8fb141d8f04235996da148395083ed','address','åœ°å€','varchar(200)','String','address','0','1','1','1','0','1','=','input','',NULL,'140','1','2018-03-06 14:15:34','1','2018-03-06 14:15:34',NULL,'1','0','0',NULL),('db113743c77140319e33637f0766d1ed','1fc82bd23cb64af4bc5f5874b9148aa3','owner','æ‰€å±ä½“æ£€ä¸­å¿ƒ','varchar(64)','String','owner','0','1','1','1','0','0','=','input','',NULL,'160','1','2018-03-07 16:24:53','1','2018-03-07 16:24:53',NULL,'0','0','0',NULL),('dbb9e03fbc5844e3a914cd12f27b93e3','263df3b73ec844e89e6ce388e2ede14b','birthday','å‡ºç”Ÿæ—¥æœŸ','varchar(10)','String','birthday','0','0','1','1','0','0','=','input','',NULL,'90','1','2018-03-07 16:26:03','1','2018-03-17 12:03:35',NULL,'0','0','0',NULL),('de654468b44f4e8eb7bfe053bc3c96c8','1fc82bd23cb64af4bc5f5874b9148aa3','create_date','åˆ›å»ºæ—¶é—´','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'120','1','2018-03-07 16:24:53','1','2018-03-07 16:24:53',NULL,'0','0','0',NULL),('e06177e0e132412ea58e540a52961b8d','5ccbcfb5e27348c4826ed976bbd1cc56','create_date','åˆ›å»ºæ—¶é—´','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,'60','1','2018-03-03 00:29:13','1','2018-03-03 00:29:13',NULL,'1','0','0',NULL),('e2698cf8b40e4f1c8c21fe5a460062a9','74db589fc1e74881be178df82449d5ee','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-07 16:03:59','1','2018-03-07 16:03:59',NULL,'0','0','0',NULL),('e472aba97d0440ac8495dd04da650910','165367ce1a75430da8729b0561adce25','create_date','åˆ›å»ºæ—¶é—´','datetime','java.util.Date','createDate','0','0','1','0','1','1','=','dateselect','',NULL,'90','1','2018-03-25 16:00:45','1','2018-03-25 16:13:40',NULL,'0','0','0',NULL),('e5e4f35115ea46d59b1469e38b55240e','7003dd8eb3554a0ab99771fdd1464c74','owner','æ‰€å±ä½“æ£€ä¸­å¿ƒ','varchar(64)','String','owner','0','1','1','1','0','0','=','input','',NULL,'100','1','2018-03-12 12:24:07','1','2018-03-12 12:24:07',NULL,'0','0','0',NULL),('e64050a2ebf041faa16f12dda5dcf784','6e05c389f3c6415ea34e55e9dfb28934','name','åç§°','nvarchar2(100)','String','name','0','1','1','1','1','1','like','input',NULL,NULL,'3','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('e69b3cd5cc1441a1b668c0726d9e54be','5ccbcfb5e27348c4826ed976bbd1cc56','id','ç¼–å·','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-03 00:29:13','1','2018-03-03 00:29:13',NULL,'1','0','0',NULL),('e6b9c9700b5c40838fc472fb741aaf02','263df3b73ec844e89e6ce388e2ede14b','sex','æ€§åˆ«','varchar(64)','String','sex','0','0','1','1','1','0','=','select','sex',NULL,'60','1','2018-03-07 16:26:02','1','2018-03-17 12:03:35',NULL,'0','0','0',NULL),('e780e12c3bd14f1b9ecae5deaca7f90a','4beae09010714fba860989f8d26cf1d0','package_id','æ£€æŸ¥å¥—é¤','varchar(64)','String','examinationPackage.id','0','0','1','1','0','0','=','input','',NULL,'20','1','2018-03-12 15:09:25','1','2018-03-12 16:36:54',NULL,'0','0','0',NULL),('e8cc5a90024646aba6387fcb90fbf17a','b9dcbd6f07b34b09a7de65921518d6a1','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-06 13:14:05','1','2018-03-11 13:42:28',NULL,'0','0','0',NULL),('e8d11127952d4aa288bb3901fc83127f','43d6d5acffa14c258340ce6765e46c6f','del_flag','åˆ é™¤æ ‡è®°ï¼ˆ0ï¼šæ­£å¸¸ï¼›1ï¼šåˆ é™¤ï¼‰','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'13','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('e98fc5ccc7104bf2811d15dd12d16d5c','67146f87f0b847a5a855efe4e9077e40','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-07 16:20:28','1','2018-03-07 16:20:28',NULL,'0','0','0',NULL),('e9fbb46d6f7949779f41d199c4ce78d2','b9dcbd6f07b34b09a7de65921518d6a1','del_flag','åˆ é™¤æ ‡è®°','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'40','1','2018-03-06 13:14:05','1','2018-03-11 13:42:28',NULL,'0','0','0',NULL),('ea89adadff7d414bbd979a8544ce34f6','5ccbcfb5e27348c4826ed976bbd1cc56','title','æ ‡é¢˜','varchar(128)','String','title','0','1','1','1','1','1','like','input','',NULL,'20','1','2018-03-03 00:29:13','1','2018-03-03 00:29:13',NULL,'1','0','0',NULL),('eb2e5afd13f147a990d30e68e7f64e12','aef6f1fc948f4c9ab1c1b780bc471cc2','update_date','æ›´æ–°æ—¶é—´','timestamp(6)','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect',NULL,NULL,'11','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('ec4c4ce73fd34bcda9aa4de59490d74a','5e8fb141d8f04235996da148395083ed','del_flag','åˆ é™¤æ ‡è®°','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'40','1','2018-03-06 14:15:33','1','2018-03-06 14:15:33',NULL,'1','0','0',NULL),('ec6982d7c117423d81e640ea5e00f300','8cc24412bbc4414a9ab589e7877028f9','default_flag','æ˜¯å¦é»˜è®¤ï¼š0-å¦ï¼Œ1-æ˜¯','char(1)','String','defaultFlag','0','0','1','1','0','0','=','input','',NULL,'50','1','2018-03-07 16:19:26','1','2018-03-07 16:19:26',NULL,'1','0','0',NULL),('ef59c79bc66a4e308585221cb67ae3f2','778b701a91b64ea5b35c17fd63948436','remarks','å¤‡æ³¨','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'90','1','2018-03-07 16:15:20','1','2018-03-07 16:15:20',NULL,'0','0','0',NULL),('ef70d0f10144407fb70863dc57479138','85e80c76deba4aeb93da7b186077c44a','update_date','æ›´æ–°æ—¶é—´','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,'80','1','2018-03-14 12:07:44','1','2018-03-14 12:07:44',NULL,'0','0','0',NULL),('f076b87dad5f4e4f8275e2215f0f64dc','b9dcbd6f07b34b09a7de65921518d6a1','reference_flag','å‚è€ƒæ ‡è¯†ï¼š0-å¦ï¼Œ1-æ˜¯','char(1)','String','referenceFlag','0','1','1','1','0','0','=','input','',NULL,'100','1','2018-03-11 13:42:01','1','2018-03-11 13:42:28',NULL,'0','0','0',NULL),('f0d18d65656a48918679835baa262d26','7ea5e9edfc8f4eb293b9f7d54d19f4f3','is_used','æ˜¯å¦ä½¿ç”¨ï¼Œ0æœªä½¿ç”¨ 1å·²ä½¿ç”¨','char(1)','String','isUsed','0','0','1','1','0','0','=','input','',NULL,'60','1','2018-04-20 17:02:28','1','2018-04-20 17:02:28',NULL,'0','0','0',NULL),('f1cba09a57ce4afda68997dfd497ae8c','0f64808413ec40b4890b094920d9ed3c','title','æ ‡é¢˜','varchar(128)','String','title','0','0','1','1','1','1','like','input','',NULL,'20','1','2018-03-05 13:03:35','1','2018-03-05 14:14:52',NULL,'0','0','0',NULL),('f1d8ac118cad461893074b906946624a','3a4d8288c1ff4277b4beaed0ddad3301','del_flag','åˆ é™¤æ ‡è®°','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'40','1','2018-03-07 15:57:22','1','2018-03-07 15:59:38',NULL,'0','0','0',NULL),('f33509fda8a541a9a4aba686346ef41e','1fc82bd23cb64af4bc5f5874b9148aa3','create_by','åˆ›å»ºè€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'110','1','2018-03-07 16:24:53','1','2018-03-07 16:24:53',NULL,'0','0','0',NULL),('f35f123bbc54444fb5ee24f82cc96c39','263df3b73ec844e89e6ce388e2ede14b','id_number','èº«ä»½è¯å·','varchar(20)','String','idNumber','0','1','1','1','0','0','=','input','',NULL,'200','1','2018-03-17 11:20:22','1','2018-03-17 12:03:35',NULL,'0','0','0',NULL),('f53a2754bb0d4178bd1d9638a1e9cf67','c657d573d06d48fd9e7c68bf8254674b','result_dict_id','ä½“æ£€ç»“æœ','varchar(64)','String','resultDictId','0','0','1','1','0','0','=','input','',NULL,'50','1','2018-03-17 11:16:34','1','2018-03-17 11:16:34',NULL,'0','0','0',NULL),('f55443b31606438687a74fdcd4b430a8','74db589fc1e74881be178df82449d5ee','del_flag','åˆ é™¤æ ‡è®°','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'30','1','2018-03-07 16:03:59','1','2018-03-07 16:03:59',NULL,'0','0','0',NULL),('f5b3a1e08a07496481e94e9afe525523','1fc82bd23cb64af4bc5f5874b9148aa3','organ_id','å•ä½','varchar(64)','String','organId','0','0','1','1','1','1','=','officeselect','',NULL,'90','1','2018-03-07 16:24:52','1','2018-03-07 16:24:52',NULL,'0','0','0',NULL),('f5ed8c82bad0413fbfcccefa95931358','f6e4dafaa72f4c509636484715f33a96','remarks','å¤‡æ³¨ä¿¡æ¯','nvarchar2(255)','String','remarks','0','1','1','1','1','0','=','textarea',NULL,NULL,'10','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0','0','0',NULL),('f6374a6318c743cea53251518e5c721b','5e8fb141d8f04235996da148395083ed','create_by','åˆ›å»ºè€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'50','1','2018-03-06 14:15:33','1','2018-03-06 14:15:33',NULL,'1','0','0',NULL),('f70d580dc23b4f9ca5092c1f5935a1dc','0ef5b1fbbf594e32ac90c2524935eb15','create_by','åˆ›å»ºè€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'50','1','2018-03-06 13:46:01','1','2018-03-11 13:42:45',NULL,'0','0','0',NULL),('f747ad8f36944f2d801790edf6d617f6','778b701a91b64ea5b35c17fd63948436','examination_dept_id','æ£€æŸ¥éƒ¨é—¨','varchar(64)','String','examinationDeptId','0','1','1','1','0','0','=','input','',NULL,'130','1','2018-03-07 16:15:20','1','2018-03-07 16:15:20',NULL,'0','0','0',NULL),('f79bf80ad96e44438488456af4596a35','5ccbcfb5e27348c4826ed976bbd1cc56','create_by','åˆ›å»ºè€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','1','=','input','',NULL,'50','1','2018-03-03 00:29:13','1','2018-03-03 00:29:13',NULL,'1','0','0',NULL),('f82714e2159c45cc9bed6cc03074dc68','7003dd8eb3554a0ab99771fdd1464c74','del_flag','åˆ é™¤æ ‡è®°','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,'30','1','2018-03-07 15:59:22','1','2018-03-12 12:24:06',NULL,'0','0','0',NULL),('f94bdc5538214238a02c0edcc5491f6f','67146f87f0b847a5a855efe4e9077e40','create_by','åˆ›å»ºè€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,'60','1','2018-03-07 16:20:28','1','2018-03-07 16:20:28',NULL,'0','0','0',NULL),('faa7026664384fe2902b68ff8b0b61b7','1fc82bd23cb64af4bc5f5874b9148aa3','update_date','æ›´æ–°æ—¶é—´','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,'140','1','2018-03-07 16:24:53','1','2018-03-07 16:24:53',NULL,'0','0','0',NULL),('fc295eedbf30439e8d1820b9fcf9b8ee','165367ce1a75430da8729b0561adce25','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,'10','1','2018-03-25 16:00:45','1','2018-03-25 16:13:40',NULL,'0','0','0',NULL),('fe2ced04e28946a5a4449ec26f34160a','85e80c76deba4aeb93da7b186077c44a','remarks','å¤‡æ³¨','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'90','1','2018-03-14 12:07:44','1','2018-03-14 12:07:44',NULL,'0','0','0',NULL),('fe4758f2f3044f96a1d3ab572cb3af75','0ef5b1fbbf594e32ac90c2524935eb15','remarks','å¤‡æ³¨','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,'90','1','2018-03-06 14:11:50','1','2018-03-11 13:42:45',NULL,'0','0','0',NULL),('ff26417aceea4dfa9b0be62da2ccd594','3a4d8288c1ff4277b4beaed0ddad3301','name','åç§°','varchar(50)','String','name','0','0','1','1','1','1','like','input','',NULL,'30','1','2018-03-07 15:57:22','1','2018-03-07 15:59:38',NULL,'0','0','0',NULL),('ff339d68f5ba47af90b3f268cbc7e6b3','0c1a5cd70b104852b79102cb62270f52','update_by','æ›´æ–°è€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,'90','1','2018-04-20 16:58:56','1','2018-04-20 16:58:56',NULL,'0','0','0',NULL);

/*Table structure for table `gen_template` */

DROP TABLE IF EXISTS `gen_template`;

CREATE TABLE `gen_template` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `name` varchar(200) DEFAULT NULL COMMENT 'åç§°',
  `category` varchar(2000) DEFAULT NULL COMMENT 'åˆ†ç±»',
  `file_path` varchar(500) DEFAULT NULL COMMENT 'ç”Ÿæˆæ–‡ä»¶è·¯å¾„',
  `file_name` varchar(200) DEFAULT NULL COMMENT 'ç”Ÿæˆæ–‡ä»¶å',
  `content` text COMMENT 'å†…å®¹',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°ï¼ˆ0ï¼šæ­£å¸¸ï¼›1ï¼šåˆ é™¤ï¼‰',
  PRIMARY KEY (`id`),
  KEY `gen_template_del_falg` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä»£ç æ¨¡æ¿è¡¨';

/*Data for the table `gen_template` */

/*Table structure for table `oa_leave` */

DROP TABLE IF EXISTS `oa_leave`;

CREATE TABLE `oa_leave` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `process_instance_id` varchar(64) DEFAULT NULL COMMENT 'æµç¨‹å®ä¾‹ç¼–å·',
  `start_time` datetime DEFAULT NULL COMMENT 'å¼€å§‹æ—¶é—´',
  `end_time` datetime DEFAULT NULL COMMENT 'ç»“æŸæ—¶é—´',
  `leave_type` varchar(20) DEFAULT NULL COMMENT 'è¯·å‡ç±»å‹',
  `reason` varchar(255) DEFAULT NULL COMMENT 'è¯·å‡ç†ç”±',
  `apply_time` datetime DEFAULT NULL COMMENT 'ç”³è¯·æ—¶é—´',
  `reality_start_time` datetime DEFAULT NULL COMMENT 'å®é™…å¼€å§‹æ—¶é—´',
  `reality_end_time` datetime DEFAULT NULL COMMENT 'å®é™…ç»“æŸæ—¶é—´',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `oa_leave_create_by` (`create_by`),
  KEY `oa_leave_process_instance_id` (`process_instance_id`),
  KEY `oa_leave_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è¯·å‡æµç¨‹è¡¨';

/*Data for the table `oa_leave` */

/*Table structure for table `oa_notify` */

DROP TABLE IF EXISTS `oa_notify`;

CREATE TABLE `oa_notify` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `type` char(1) DEFAULT NULL COMMENT 'ç±»å‹',
  `title` varchar(200) DEFAULT NULL COMMENT 'æ ‡é¢˜',
  `content` varchar(2000) DEFAULT NULL COMMENT 'å†…å®¹',
  `files` varchar(2000) DEFAULT NULL COMMENT 'é™„ä»¶',
  `status` char(1) DEFAULT NULL COMMENT 'çŠ¶æ€',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `oa_notify_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='é€šçŸ¥é€šå‘Š';

/*Data for the table `oa_notify` */

insert  into `oa_notify`(`id`,`type`,`title`,`content`,`files`,`status`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('d953377b907b4caeb956509b6b23278c','2','å¥½å§','é€Ÿåº¦å¿«å»ºå®‰è´¹\r\nå¡ä¸‰ç­‰å¥–å‘\r\nå¡ä¸‰ç­‰å¥–','','1','1','2018-03-03 11:19:28','1','2018-03-03 11:19:48',NULL,'0'),('f468177e62144f2989cace097aa63a5c','1','ä»Šå¤©è¦å¼€ä¼š','è¿·ä½ æ”¹å¤©å¿…é¡»æ¥ã€‚\r\nå¿«ç‚¹ç»“æŸå§ã€‚','','1','1','2018-03-03 09:56:00','1','2018-03-03 09:56:00',NULL,'0');

/*Table structure for table `oa_notify_record` */

DROP TABLE IF EXISTS `oa_notify_record`;

CREATE TABLE `oa_notify_record` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `oa_notify_id` varchar(64) DEFAULT NULL COMMENT 'é€šçŸ¥é€šå‘ŠID',
  `user_id` varchar(64) DEFAULT NULL COMMENT 'æ¥å—äºº',
  `read_flag` char(1) DEFAULT '0' COMMENT 'é˜…è¯»æ ‡è®°',
  `read_date` date DEFAULT NULL COMMENT 'é˜…è¯»æ—¶é—´',
  PRIMARY KEY (`id`),
  KEY `oa_notify_record_notify_id` (`oa_notify_id`),
  KEY `oa_notify_record_user_id` (`user_id`),
  KEY `oa_notify_record_read_flag` (`read_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='é€šçŸ¥é€šå‘Šå‘é€è®°å½•';

/*Data for the table `oa_notify_record` */

insert  into `oa_notify_record`(`id`,`oa_notify_id`,`user_id`,`read_flag`,`read_date`) values ('059f4b68c5ee4902b1c739ca4ac9a0b6','f468177e62144f2989cace097aa63a5c','9','0',NULL),('06aace7c3783456e8561700f3ed6e4eb','f468177e62144f2989cace097aa63a5c','10','0',NULL),('0fc08b2f69b744c1ad9415b371eb1922','d953377b907b4caeb956509b6b23278c','6','0',NULL),('10c5d97cfc624ffbba0ec399353be1c3','f468177e62144f2989cace097aa63a5c','11','0',NULL),('2e7c30554d8b47379147507a17d1b3d5','d953377b907b4caeb956509b6b23278c','13','0',NULL),('2eef72896f4c40b3b52c5204975c3112','f468177e62144f2989cace097aa63a5c','13','0',NULL),('56fc50cd25a04ed5a74660e3283cd5cf','d953377b907b4caeb956509b6b23278c','5','0',NULL),('6c33207612bf4ada92801369b6c07dbb','d953377b907b4caeb956509b6b23278c','9','0',NULL),('77008f0dbdf042c98b6c1d038dbe6f3a','f468177e62144f2989cace097aa63a5c','4','0',NULL),('78c5a481afca4d979933cd0fbda374f8','f468177e62144f2989cace097aa63a5c','2','0',NULL),('79848b62312d488fba1872005bfff8a8','f468177e62144f2989cace097aa63a5c','3','0',NULL),('7c9a8152e8c141aa8ba305a9a64458e6','d953377b907b4caeb956509b6b23278c','10','0',NULL),('80741bf482a2493e95e2dfc5994512ed','f468177e62144f2989cace097aa63a5c','12','0',NULL),('89294e0dbb204f7284bcb8c2c71ef7b4','d953377b907b4caeb956509b6b23278c','12','0',NULL),('8edd88336e54420cbe95c94b5fa43920','f468177e62144f2989cace097aa63a5c','6','0',NULL),('94a1378fd70c4055a1acbfa1e4a3aa0f','d953377b907b4caeb956509b6b23278c','1','1','2018-03-03'),('acd7af1cbfef4971a1855d89b310b3d4','f468177e62144f2989cace097aa63a5c','8','0',NULL),('b2b70d0eefbe4ed9b4346a15e47794a6','f468177e62144f2989cace097aa63a5c','5','0',NULL),('b3d90fa81a1e49fea79a0e2dfc7c5a51','f468177e62144f2989cace097aa63a5c','7','0',NULL),('b6c4975eee014d0eada97cf4020a2357','d953377b907b4caeb956509b6b23278c','4','0',NULL),('b7e682e8174b43939f0a48be7f27511f','d953377b907b4caeb956509b6b23278c','8','0',NULL),('bd7946bf2ec84e0a93b85518827e1fca','d953377b907b4caeb956509b6b23278c','2','0',NULL),('c21a9dcd327746e780b5628c1c29a11d','d953377b907b4caeb956509b6b23278c','3','0',NULL),('db3b8fde7bd449e5ae097417da901581','f468177e62144f2989cace097aa63a5c','1','1','2018-03-03'),('e135ff9dfbf64a66985cc2cfab091b93','d953377b907b4caeb956509b6b23278c','7','0',NULL),('e40846456ed74480831d1e0448b1284a','d953377b907b4caeb956509b6b23278c','11','0',NULL);

/*Table structure for table `oa_test_audit` */

DROP TABLE IF EXISTS `oa_test_audit`;

CREATE TABLE `oa_test_audit` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `PROC_INS_ID` varchar(64) DEFAULT NULL COMMENT 'æµç¨‹å®ä¾‹ID',
  `USER_ID` varchar(64) DEFAULT NULL COMMENT 'å˜åŠ¨ç”¨æˆ·',
  `OFFICE_ID` varchar(64) DEFAULT NULL COMMENT 'å½’å±éƒ¨é—¨',
  `POST` varchar(255) DEFAULT NULL COMMENT 'å²—ä½',
  `AGE` char(1) DEFAULT NULL COMMENT 'æ€§åˆ«',
  `EDU` varchar(255) DEFAULT NULL COMMENT 'å­¦å†',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT 'è°ƒæ•´åŸå› ',
  `OLDA` varchar(255) DEFAULT NULL COMMENT 'ç°è¡Œæ ‡å‡† è–ªé…¬æ¡£çº§',
  `OLDB` varchar(255) DEFAULT NULL COMMENT 'ç°è¡Œæ ‡å‡† æœˆå·¥èµ„é¢',
  `OLDC` varchar(255) DEFAULT NULL COMMENT 'ç°è¡Œæ ‡å‡† å¹´è–ªæ€»é¢',
  `NEWA` varchar(255) DEFAULT NULL COMMENT 'è°ƒæ•´åæ ‡å‡† è–ªé…¬æ¡£çº§',
  `NEWB` varchar(255) DEFAULT NULL COMMENT 'è°ƒæ•´åæ ‡å‡† æœˆå·¥èµ„é¢',
  `NEWC` varchar(255) DEFAULT NULL COMMENT 'è°ƒæ•´åæ ‡å‡† å¹´è–ªæ€»é¢',
  `ADD_NUM` varchar(255) DEFAULT NULL COMMENT 'æœˆå¢èµ„',
  `EXE_DATE` varchar(255) DEFAULT NULL COMMENT 'æ‰§è¡Œæ—¶é—´',
  `HR_TEXT` varchar(255) DEFAULT NULL COMMENT 'äººåŠ›èµ„æºéƒ¨é—¨æ„è§',
  `LEAD_TEXT` varchar(255) DEFAULT NULL COMMENT 'åˆ†ç®¡é¢†å¯¼æ„è§',
  `MAIN_LEAD_TEXT` varchar(255) DEFAULT NULL COMMENT 'é›†å›¢ä¸»è¦é¢†å¯¼æ„è§',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `OA_TEST_AUDIT_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='å®¡æ‰¹æµç¨‹æµ‹è¯•è¡¨';

/*Data for the table `oa_test_audit` */

/*Table structure for table `sequence_define` */

DROP TABLE IF EXISTS `sequence_define`;

CREATE TABLE `sequence_define` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `class_name` varchar(64) NOT NULL COMMENT 'ç±»å',
  `method_name` varchar(64) NOT NULL COMMENT 'æ–¹æ³•å',
  `ann_express` varchar(64) NOT NULL COMMENT 'æ³¨è§£ä¸Šé»˜è®¤çš„è¡¨è¾¾å¼ï¼Œåªè¯»',
  `custom_express` varchar(64) NOT NULL COMMENT 'è‡ªå®šä¹‰çš„è¡¨è¾¾å¼',
  `ann_describe` varchar(64) NOT NULL COMMENT 'ç¼–å·æè¿°ï¼Œåªè¯»',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sequence_define_class_method` (`class_name`,`method_name`),
  UNIQUE KEY `sequence_define_ann_express` (`ann_express`),
  UNIQUE KEY `sequence_define_custom_express` (`custom_express`),
  KEY `sequence_define_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='åºåˆ—è¡¨';

/*Data for the table `sequence_define` */

/*Table structure for table `sys_area` */

DROP TABLE IF EXISTS `sys_area`;

CREATE TABLE `sys_area` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `parent_id` varchar(64) NOT NULL COMMENT 'çˆ¶çº§ç¼–å·',
  `parent_ids` varchar(2000) NOT NULL COMMENT 'æ‰€æœ‰çˆ¶çº§ç¼–å·',
  `name` varchar(100) NOT NULL COMMENT 'åç§°',
  `sort` decimal(10,0) NOT NULL COMMENT 'æ’åº',
  `code` varchar(100) DEFAULT NULL COMMENT 'åŒºåŸŸç¼–ç ',
  `type` char(1) DEFAULT NULL COMMENT 'åŒºåŸŸç±»å‹',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `default_record` char(1) NOT NULL DEFAULT '0' COMMENT 'ç³»ç»Ÿé»˜è®¤è®°å½•ï¼Œä¸å¯åˆ é™¤ã€‚ä¸å¯ä¿®æ”¹',
  PRIMARY KEY (`id`),
  KEY `sys_area_parent_id` (`parent_id`),
  KEY `sys_area_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='åŒºåŸŸè¡¨';

/*Data for the table `sys_area` */

insert  into `sys_area`(`id`,`parent_id`,`parent_ids`,`name`,`sort`,`code`,`type`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`,`default_record`) values ('1','0','0,','ä¸­å›½','10','100000','1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('6ac2c7dec6754eb0a992d089a8176375','ff194b1d2f404810a45001f836a6348d','0,1,8cc21c3cd6564faca50bafb92424926b,ff194b1d2f404810a45001f836a6348d,','æ¡¥è¥¿åŒº','30','050051','4','1','2018-04-18 09:56:30','1','2018-04-18 09:56:30','','0','0'),('8cc21c3cd6564faca50bafb92424926b','1','0,1,','æ²³åŒ—çœ','30','130000','2','1','2018-03-07 17:06:30','1','2018-03-07 17:06:30','','0','1'),('ff194b1d2f404810a45001f836a6348d','8cc21c3cd6564faca50bafb92424926b','0,1,8cc21c3cd6564faca50bafb92424926b,','çŸ³å®¶åº„å¸‚','30','130100','3','1','2018-03-07 17:09:07','1','2018-03-07 17:09:07','','0','1');

/*Table structure for table `sys_dict` */

DROP TABLE IF EXISTS `sys_dict`;

CREATE TABLE `sys_dict` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `value` varchar(100) NOT NULL COMMENT 'æ•°æ®å€¼',
  `label` varchar(100) NOT NULL COMMENT 'æ ‡ç­¾å',
  `type` varchar(100) NOT NULL COMMENT 'ç±»å‹',
  `description` varchar(100) NOT NULL COMMENT 'æè¿°',
  `sort` decimal(10,0) NOT NULL COMMENT 'æ’åºï¼ˆå‡åºï¼‰',
  `parent_id` varchar(64) DEFAULT '0' COMMENT 'çˆ¶çº§ç¼–å·',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `default_record` char(1) NOT NULL DEFAULT '0' COMMENT 'ç³»ç»Ÿè®°å½•ï¼Œä¸å¯åˆ é™¤ï¼Œå€¼ä¸å¯ä¿®æ”¹',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`label`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='å­—å…¸è¡¨';

/*Data for the table `sys_dict` */

insert  into `sys_dict`(`id`,`value`,`label`,`type`,`description`,`sort`,`parent_id`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`,`default_record`) values ('1','0','æ­£å¸¸','del_flag','åˆ é™¤æ ‡è®°','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('10','yellow','é»„è‰²','color','é¢œè‰²å€¼','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('100','java.util.Date','Date','gen_java_type','Javaç±»å‹\0\0','50','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('101','com.thinkgem.jeesite.modules.sys.entity.User','User','gen_java_type','Javaç±»å‹\0\0','60','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('102','com.thinkgem.jeesite.modules.sys.entity.Office','Office','gen_java_type','Javaç±»å‹\0\0','70','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('103','com.thinkgem.jeesite.modules.sys.entity.Area','Area','gen_java_type','Javaç±»å‹\0\0','80','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('104','Custom','Custom','gen_java_type','Javaç±»å‹\0\0','90','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('105','1','ä¼šè®®é€šå‘Š\0\0\0\0','oa_notify_type','é€šçŸ¥é€šå‘Šç±»å‹','10','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0','1'),('106','2','å¥–æƒ©é€šå‘Š\0\0\0\0','oa_notify_type','é€šçŸ¥é€šå‘Šç±»å‹','20','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0','1'),('107','3','æ´»åŠ¨é€šå‘Š\0\0\0\0','oa_notify_type','é€šçŸ¥é€šå‘Šç±»å‹','30','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0','1'),('108','0','è‰ç¨¿','oa_notify_status','é€šçŸ¥é€šå‘ŠçŠ¶æ€','10','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0','1'),('109','1','å‘å¸ƒ','oa_notify_status','é€šçŸ¥é€šå‘ŠçŠ¶æ€','20','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0','1'),('11','orange','æ©™è‰²','color','é¢œè‰²å€¼','50','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('110','0','æœªè¯»','oa_notify_read','é€šçŸ¥é€šå‘ŠçŠ¶æ€','10','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0','1'),('110eda8532bd44c1b1c55e380134eb41','40','åˆæ£€åˆæ ¼å¯åˆ¶è¯','examination_record_status','åˆæ£€åˆæ ¼å¯åˆ¶è¯','5','0','1','2018-04-14 17:59:27','1','2018-04-20 12:47:09','','0','1'),('111','1','å·²è¯»','oa_notify_read','é€šçŸ¥é€šå‘ŠçŠ¶æ€','20','0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0','1'),('12','default','é»˜è®¤ä¸»é¢˜','theme','ä¸»é¢˜æ–¹æ¡ˆ','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('13','cerulean','å¤©è“ä¸»é¢˜','theme','ä¸»é¢˜æ–¹æ¡ˆ','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('14','readable','æ©™è‰²ä¸»é¢˜','theme','ä¸»é¢˜æ–¹æ¡ˆ','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('15','united','çº¢è‰²ä¸»é¢˜','theme','ä¸»é¢˜æ–¹æ¡ˆ','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('16','flat','Flatä¸»é¢˜','theme','ä¸»é¢˜æ–¹æ¡ˆ','60','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('17','1','å›½å®¶','sys_area_type','åŒºåŸŸç±»å‹','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('18','2','çœä»½ã€ç›´è¾–å¸‚','sys_area_type','åŒºåŸŸç±»å‹','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('19','3','åœ°å¸‚','sys_area_type','åŒºåŸŸç±»å‹','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('1f1bb10d0c484586804905fe6e5df940','30','å¤æ£€ä¸åˆæ ¼','examination_record_status','å¤æ£€ä¸åˆæ ¼','4','0','1','2018-04-14 17:59:03','1','2018-04-20 12:49:55','','0','1'),('2','1','åˆ é™¤','del_flag','åˆ é™¤æ ‡è®°','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('20','4','åŒºå¿','sys_area_type','åŒºåŸŸç±»å‹','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('21','1','å…¬å¸','sys_office_type','æœºæ„ç±»å‹','60','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('22','2','éƒ¨é—¨','sys_office_type','æœºæ„ç±»å‹','70','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('23','3','å°ç»„','sys_office_type','æœºæ„ç±»å‹','80','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('24','4','å…¶å®ƒ','sys_office_type','æœºæ„ç±»å‹','90','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('25','1','ç»¼åˆéƒ¨','sys_office_common','å¿«æ·é€šç”¨éƒ¨é—¨','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('26','2','å¼€å‘éƒ¨','sys_office_common','å¿«æ·é€šç”¨éƒ¨é—¨','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('27','3','äººåŠ›éƒ¨','sys_office_common','å¿«æ·é€šç”¨éƒ¨é—¨','50','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('28','1','ä¸€çº§','sys_office_grade','æœºæ„ç­‰çº§','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('29','2','äºŒçº§','sys_office_grade','æœºæ„ç­‰çº§','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('3','1','æ˜¾ç¤º','show_hide','æ˜¾ç¤º/éšè—','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('30','3','ä¸‰çº§','sys_office_grade','æœºæ„ç­‰çº§','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('31','4','å››çº§','sys_office_grade','æœºæ„ç­‰çº§','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('32','1','æ‰€æœ‰æ•°æ®','sys_data_scope','æ•°æ®èŒƒå›´','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('33','2','æ‰€åœ¨å…¬å¸åŠä»¥ä¸‹æ•°æ®','sys_data_scope','æ•°æ®èŒƒå›´','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('34','3','æ‰€åœ¨å…¬å¸æ•°æ®','sys_data_scope','æ•°æ®èŒƒå›´','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('35','4','æ‰€åœ¨éƒ¨é—¨åŠä»¥ä¸‹æ•°æ®','sys_data_scope','æ•°æ®èŒƒå›´','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('36','5','æ‰€åœ¨éƒ¨é—¨æ•°æ®','sys_data_scope','æ•°æ®èŒƒå›´','50','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('37','8','ä»…æœ¬äººæ•°æ®','sys_data_scope','æ•°æ®èŒƒå›´','90','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('38','9','æŒ‰æ˜ç»†è®¾ç½®','sys_data_scope','æ•°æ®èŒƒå›´','100','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('39','1','ç³»ç»Ÿç®¡ç†','sys_user_type','ç”¨æˆ·ç±»å‹','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('4','0','éšè—','show_hide','æ˜¾ç¤º/éšè—','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('40','2','éƒ¨é—¨ç»ç†','sys_user_type','ç”¨æˆ·ç±»å‹','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('41','3','æ™®é€šç”¨æˆ·','sys_user_type','ç”¨æˆ·ç±»å‹','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('42','basic','åŸºç¡€ä¸»é¢˜','cms_theme','ç«™ç‚¹ä¸»é¢˜','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('43','blue','è“è‰²ä¸»é¢˜','cms_theme','ç«™ç‚¹ä¸»é¢˜','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1','1'),('44','red','çº¢è‰²ä¸»é¢˜','cms_theme','ç«™ç‚¹ä¸»é¢˜','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1','1'),('45','article','æ–‡ç« æ¨¡å‹','cms_module','æ ç›®æ¨¡å‹','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('46','picture','å›¾ç‰‡æ¨¡å‹','cms_module','æ ç›®æ¨¡å‹','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1','1'),('47','download','ä¸‹è½½æ¨¡å‹','cms_module','æ ç›®æ¨¡å‹','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1','1'),('48','link','é“¾æ¥æ¨¡å‹','cms_module','æ ç›®æ¨¡å‹','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('49','special','ä¸“é¢˜æ¨¡å‹','cms_module','æ ç›®æ¨¡å‹','50','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1','1'),('5','1','æ˜¯','yes_no','æ˜¯/å¦','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('50','0','é»˜è®¤å±•ç°æ–¹å¼','cms_show_modes','å±•ç°æ–¹å¼','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('5048f50a293e4218b1988e953d7e4aa7','20','åˆæ£€ä¸åˆæ ¼','examination_record_status','ä½“æ£€çŠ¶æ€','3','0','1','2018-03-13 11:24:35','1','2018-04-20 12:45:47','','0','1'),('51','1','é¦–æ ç›®å†…å®¹åˆ—è¡¨','cms_show_modes','å±•ç°æ–¹å¼','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('52','2','æ ç›®ç¬¬ä¸€æ¡å†…å®¹','cms_show_modes','å±•ç°æ–¹å¼','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('53','0','å‘å¸ƒ','cms_del_flag','å†…å®¹çŠ¶æ€','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('54','1','åˆ é™¤','cms_del_flag','å†…å®¹çŠ¶æ€','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('55','2','å®¡æ ¸','cms_del_flag','å†…å®¹çŠ¶æ€','15','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('56','1','é¦–é¡µç„¦ç‚¹å›¾','cms_posid','æ¨èä½','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('57','2','æ ç›®é¡µæ–‡ç« æ¨è','cms_posid','æ¨èä½','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('57849b0370ee4d4589dc3b34da97de15','50','å·²åˆ¶è¯','examination_record_status','å·²åˆ¶è¯','10','0','1','2018-04-14 17:59:43','1','2018-04-14 17:59:43','','0','1'),('58','1','å’¨è¯¢','cms_guestbook','ç•™è¨€æ¿åˆ†ç±»','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('59','2','å»ºè®®','cms_guestbook','ç•™è¨€æ¿åˆ†ç±»','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('6','0','å¦','yes_no','æ˜¯/å¦','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('60','3','æŠ•è¯‰','cms_guestbook','ç•™è¨€æ¿åˆ†ç±»','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('61','4','å…¶å®ƒ','cms_guestbook','ç•™è¨€æ¿åˆ†ç±»','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('62','1','å…¬ä¼‘','oa_leave_type','è¯·å‡ç±»å‹','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('63','2','ç—…å‡','oa_leave_type','è¯·å‡ç±»å‹','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('64','3','äº‹å‡','oa_leave_type','è¯·å‡ç±»å‹','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('65','4','è°ƒä¼‘','oa_leave_type','è¯·å‡ç±»å‹','40','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('66','5','å©šå‡','oa_leave_type','è¯·å‡ç±»å‹','60','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('67','1','æ¥å…¥æ—¥å¿—','sys_log_type','æ—¥å¿—ç±»å‹','30','0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0','1'),('68','2','å¼‚å¸¸æ—¥å¿—','sys_log_type','æ—¥å¿—ç±»å‹','40','0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0','1'),('69','leave','è¯·å‡æµç¨‹','act_type','æµç¨‹ç±»å‹','10','0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0','1'),('6e7995624b0c49f584c29f23afe9e9db','10','æœªä½“æ£€å®Œ','examination_record_status','ä½“æ£€çŠ¶æ€','2','0','1','2018-03-13 11:24:17','1','2018-04-14 17:58:14','','0','1'),('7','red','çº¢è‰²','color','é¢œè‰²å€¼','10','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('70','test_audit','å®¡æ‰¹æµ‹è¯•æµç¨‹','act_type','æµç¨‹ç±»å‹','20','0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0','1'),('71','1','åˆ†ç±»1','act_category','æµç¨‹åˆ†ç±»','10','0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0','1'),('71e164665d834b40a7b53c8ca3be7ac3','45','å¤æ£€åˆæ ¼å¯åˆ¶å¡','examination_record_status','å¤æ£€åˆæ ¼å¯åˆ¶è¯','6','0','1','2018-04-20 12:46:44','1','2018-04-20 12:47:22','','0','1'),('72','2','åˆ†ç±»2','act_category','æµç¨‹åˆ†ç±»','20','0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0','1'),('73','crud','å¢åˆ æ”¹æŸ¥','gen_category','ä»£ç ç”Ÿæˆåˆ†ç±»','10','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('74','crud_many','å¢åˆ æ”¹æŸ¥ï¼ˆåŒ…å«ä»è¡¨ï¼‰','gen_category','ä»£ç ç”Ÿæˆåˆ†ç±»','20','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('75','tree','æ ‘ç»“æ„','gen_category','ä»£ç ç”Ÿæˆåˆ†ç±»','30','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('76','=','=','gen_query_type','æŸ¥è¯¢æ–¹å¼','10','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('77','!=','!=','gen_query_type','æŸ¥è¯¢æ–¹å¼','20','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('78','&gt;','&gt;','gen_query_type','æŸ¥è¯¢æ–¹å¼','30','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('79','&lt;','&lt;','gen_query_type','æŸ¥è¯¢æ–¹å¼','40','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('8','green','ç»¿è‰²','color','é¢œè‰²å€¼','20','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('80','between','Between','gen_query_type','æŸ¥è¯¢æ–¹å¼','50','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('81','like','Like','gen_query_type','æŸ¥è¯¢æ–¹å¼','60','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('82','left_like','Left Like','gen_query_type','æŸ¥è¯¢æ–¹å¼','70','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('83','right_like','Right Like','gen_query_type','æŸ¥è¯¢æ–¹å¼','80','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('84','input','æ–‡æœ¬æ¡†','gen_show_type','å­—æ®µç”Ÿæˆæ–¹æ¡ˆ','10','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('85','textarea','æ–‡æœ¬åŸŸ','gen_show_type','å­—æ®µç”Ÿæˆæ–¹æ¡ˆ','20','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('86','select','ä¸‹æ‹‰æ¡†','gen_show_type','å­—æ®µç”Ÿæˆæ–¹æ¡ˆ','30','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('87','checkbox','å¤é€‰æ¡†','gen_show_type','å­—æ®µç”Ÿæˆæ–¹æ¡ˆ','40','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('88','radiobox','å•é€‰æ¡†','gen_show_type','å­—æ®µç”Ÿæˆæ–¹æ¡ˆ','50','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('89','dateselect','æ—¥æœŸé€‰æ‹©','gen_show_type','å­—æ®µç”Ÿæˆæ–¹æ¡ˆ','60','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('9','blue','è“è‰²','color','é¢œè‰²å€¼','30','0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0','1'),('90','userselect','äººå‘˜é€‰æ‹©\0','gen_show_type','å­—æ®µç”Ÿæˆæ–¹æ¡ˆ','70','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('91','officeselect','éƒ¨é—¨é€‰æ‹©','gen_show_type','å­—æ®µç”Ÿæˆæ–¹æ¡ˆ','80','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('92','areaselect','åŒºåŸŸé€‰æ‹©','gen_show_type','å­—æ®µç”Ÿæˆæ–¹æ¡ˆ','90','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('93','String','String','gen_java_type','Javaç±»å‹','10','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('94','Long','Long','gen_java_type','Javaç±»å‹','20','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('95','dao','ä»…æŒä¹…å±‚','gen_category','ä»£ç ç”Ÿæˆåˆ†ç±»\0\0\0\0\0\0','40','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('96','1','ç”·','sex','æ€§åˆ«','10','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'0','1'),('97','2','å¥³','sex','æ€§åˆ«','20','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'0','1'),('98','Integer','Integer','gen_java_type','Javaç±»å‹\0\0','30','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('99','Double','Double','gen_java_type','Javaç±»å‹\0\0','40','0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1','1'),('f24ac6e8515f42b3855bfcb463956b49','0','æœªä½“æ£€','examination_record_status','ä½“æ£€çŠ¶æ€','1','0','1','2018-04-18 20:09:11','1','2018-04-18 20:09:39','','0','1'),('f92ccb9da1a24f70ad77f95364a1252d','0','æœªä½“æ£€','examination_record_status','ä½“æ£€çŠ¶æ€','1','0','1','2018-03-13 11:23:48','1','2018-04-14 17:57:19','','1','1');

/*Table structure for table `sys_log` */

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `type` char(1) DEFAULT '1' COMMENT 'æ—¥å¿—ç±»å‹',
  `title` varchar(255) DEFAULT '' COMMENT 'æ—¥å¿—æ ‡é¢˜',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `remote_addr` varchar(255) DEFAULT NULL COMMENT 'æ“ä½œIPåœ°å€',
  `user_agent` varchar(255) DEFAULT NULL COMMENT 'ç”¨æˆ·ä»£ç†',
  `request_uri` varchar(255) DEFAULT NULL COMMENT 'è¯·æ±‚URI',
  `method` varchar(5) DEFAULT NULL COMMENT 'æ“ä½œæ–¹å¼',
  `params` text COMMENT 'æ“ä½œæäº¤çš„æ•°æ®',
  `exception` text COMMENT 'å¼‚å¸¸ä¿¡æ¯',
  PRIMARY KEY (`id`),
  KEY `sys_log_create_by` (`create_by`),
  KEY `sys_log_request_uri` (`request_uri`),
  KEY `sys_log_type` (`type`),
  KEY `sys_log_create_date` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ—¥å¿—è¡¨';

/*Data for the table `sys_log` */

/*Table structure for table `sys_mdict` */

DROP TABLE IF EXISTS `sys_mdict`;

CREATE TABLE `sys_mdict` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `parent_id` varchar(64) NOT NULL COMMENT 'çˆ¶çº§ç¼–å·',
  `parent_ids` varchar(2000) NOT NULL COMMENT 'æ‰€æœ‰çˆ¶çº§ç¼–å·',
  `name` varchar(100) NOT NULL COMMENT 'åç§°',
  `sort` decimal(10,0) NOT NULL COMMENT 'æ’åº',
  `description` varchar(100) DEFAULT NULL COMMENT 'æè¿°',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `sys_mdict_parent_id` (`parent_id`),
  KEY `sys_mdict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='å¤šçº§å­—å…¸è¡¨';

/*Data for the table `sys_mdict` */

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `parent_id` varchar(64) NOT NULL COMMENT 'çˆ¶çº§ç¼–å·',
  `parent_ids` varchar(2000) NOT NULL COMMENT 'æ‰€æœ‰çˆ¶çº§ç¼–å·',
  `name` varchar(100) NOT NULL COMMENT 'åç§°',
  `sort` decimal(10,0) NOT NULL COMMENT 'æ’åº',
  `href` varchar(2000) DEFAULT NULL COMMENT 'é“¾æ¥',
  `target` varchar(20) DEFAULT NULL COMMENT 'ç›®æ ‡',
  `icon` varchar(100) DEFAULT NULL COMMENT 'å›¾æ ‡',
  `is_show` char(1) NOT NULL COMMENT 'æ˜¯å¦åœ¨èœå•ä¸­æ˜¾ç¤º',
  `permission` varchar(200) DEFAULT NULL COMMENT 'æƒé™æ ‡è¯†',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `sys_menu_parent_id` (`parent_id`),
  KEY `sys_menu_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='èœå•è¡¨';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`id`,`parent_id`,`parent_ids`,`name`,`sort`,`href`,`target`,`icon`,`is_show`,`permission`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('053d3ddee6f048f69a3e8b73b41787a5','1efc52de37db406ba9be7dd3f06859b7','0,1,1efc52de37db406ba9be7dd3f06859b7,','ä½“æ£€æµç¨‹','20','','','share-alt','1','','1','2018-03-12 12:07:58','1','2018-04-16 10:50:59','','0'),('0b2ebd4d639e4c2b83c2dd0764522f24','ba8092291b40482db8fe7fc006ea3d76','0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,','ç¼–è¾‘','60','','','','0','test:testData:edit','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('0c59995d6e91463db215118bca49a1c9','053d3ddee6f048f69a3e8b73b41787a5','0,1,1efc52de37db406ba9be7dd3f06859b7,053d3ddee6f048f69a3e8b73b41787a5,','ä½“æ£€ç»“æœå½•å…¥','50','/wshbj/examinationRecord/inputResult','','','0','wshbj:examinationRecord:inputResult','1','2018-03-25 14:02:33','1','2018-04-23 02:37:27','','0'),('0ca004d6b1bf4bcab9670a5060d82a55','3c92c17886944d0687e73e286cada573','0,1,79,3c92c17886944d0687e73e286cada573,','æ ‘ç»“æ„','90','/test/testTree','','','1','','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('1','0','0,','åŠŸèƒ½èœå•','0',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','3','0,1,2,3,','å­—å…¸ç®¡ç†','60','/sys/dict/',NULL,'th-list','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('11','10','0,1,2,3,10,','æŸ¥çœ‹','30',NULL,NULL,NULL,'0','sys:dict:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('12','10','0,1,2,3,10,','ä¿®æ”¹','40',NULL,NULL,NULL,'0','sys:dict:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13','2','0,1,2,','æœºæ„ç”¨æˆ·','970',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13549f076c454f92baaeac590b118990','9032a8d00f7d42b197f5a7a47b6830dd','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,','è¡Œä¸šç®¡ç†','7','/wshbj/industry/listByCenter','','','1','wshbj:industry:viewByCenter','1','2018-03-06 13:01:37','1','2018-03-10 11:18:21','','0'),('14','13','0,1,2,13,','åŒºåŸŸç®¡ç†','50','/sys/area/',NULL,'th','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('15','14','0,1,2,13,14,','æŸ¥çœ‹','30',NULL,NULL,NULL,'0','sys:area:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('16','14','0,1,2,13,14,','ä¿®æ”¹','40',NULL,NULL,NULL,'0','sys:area:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('1603769af8384a84897a412a529d7934','fa8240e7b03b4f0993ab73c048e2cfbe','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,fa8240e7b03b4f0993ab73c048e2cfbe,','ç¼–è¾‘','30','','','','0','wshbj:examinationItem:assigning','1','2018-03-22 20:24:03','1','2018-03-22 20:24:03','','0'),('17','13','0,1,2,13,','æœºæ„ç®¡ç†','40','/sys/office/',NULL,'th-large','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('18','17','0,1,2,13,17,','æŸ¥çœ‹','30',NULL,NULL,NULL,'0','sys:office:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('19','17','0,1,2,13,17,','ä¿®æ”¹','40',NULL,NULL,NULL,'0','sys:office:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('19b0ae33a47e437196b41b664c95a34d','1','0,1,','è¾…åŠ©ä¿¡æ¯','2','','','','1','','1','2018-03-07 16:57:21','1','2018-03-10 11:25:27','','0'),('1efc52de37db406ba9be7dd3f06859b7','1','0,1,','ä½“æ£€æ•°æ®','1','','','','1','','1','2018-03-12 12:00:46','1','2018-03-12 12:57:57','','0'),('2','1','0,1,','ç³»ç»Ÿè®¾ç½®','900',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('20','13','0,1,2,13,','ç”¨æˆ·ç®¡ç†','30','/sys/user/index',NULL,'user','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('21','20','0,1,2,13,20,','æŸ¥çœ‹','30',NULL,NULL,NULL,'0','sys:user:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2115345503a44f02b2e6a4032faa910e','9032a8d00f7d42b197f5a7a47b6830dd','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,','æ ‡æœ¬ç®¡ç†','6','/wshbj/specimen/listByCenter','','','1','wshbj:specimen:viewByCenter','1','2018-03-10 11:20:32','1','2018-03-11 00:21:21','','0'),('22','20','0,1,2,13,20,','ä¿®æ”¹','40',NULL,NULL,NULL,'0','sys:user:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('23','2','0,1,2,','å…³äºå¸®åŠ©','990',NULL,NULL,NULL,'0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('236cec99b7f841c9879d396dd1c08ff7','3','0,1,2,3,','å…¨å±€è®¾ç½®','5030','/sys/globalSet/form','','wrench','1','sys:globalSet:view,sys:globalSet:edit','1','2018-04-18 12:01:49','1','2018-04-18 13:02:52','','0'),('24','23','0,1,2,23','å®˜æ–¹é¦–é¡µ','30','http://jeesite.com','_blank',NULL,'0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2497901541794f699d496773d8397d1a','eaf34e221ac44d6f87dda25f5d2976d1','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,eaf34e221ac44d6f87dda25f5d2976d1,','æŸ¥çœ‹','1','','','','0','wshbj:jobPost:viewByCenter','1','2018-03-10 11:23:31','1','2018-03-10 11:23:31','','0'),('25','23','0,1,2,23','é¡¹ç›®æ”¯æŒ','50','http://jeesite.com/donation.html','_blank',NULL,'0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('26','23','0,1,2,23','è®ºå›äº¤æµ','80','http://bbs.jeesite.com','_blank',NULL,'0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('264ea3ea128d4be294c44b94a98a41b9','ca6f2c5432294cb28b8c9fd8d26558c5','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,ca6f2c5432294cb28b8c9fd8d26558c5,','ç¼–è¾‘','2','','','','0','wshbj:examinationItem:edit','1','2018-03-10 20:56:15','1','2018-03-10 20:56:15','','0'),('27','1','0,1,','æˆ‘çš„é¢æ¿','100',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('28','27','0,1,27,','ä¸ªäººä¿¡æ¯','30','','','','1','','1','2013-05-27 08:00:00','1','2018-03-03 13:03:02','','0'),('29','28','0,1,27,28,','ä¸ªäººä¿¡æ¯','30','/sys/user/info','','user-md','1','','1','2013-05-27 08:00:00','1','2018-03-02 21:45:42','','0'),('29c75b07c3454e489be6a62a76ec1094','9032a8d00f7d42b197f5a7a47b6830dd','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,','æ£€æŸ¥ç±»åˆ«','1','/wshbj/examinationCategory/listByCenter','','','1','wshbj:examinationCategory:viewByCenter','1','2018-03-07 16:55:54','1','2018-03-10 11:24:41','','0'),('29d5c1f1f6904bdb9ee44a3c439a13f5','e5bcc15b76f8477195762c7248cc04aa','0,1,1efc52de37db406ba9be7dd3f06859b7,053d3ddee6f048f69a3e8b73b41787a5,e5bcc15b76f8477195762c7248cc04aa,','æŸ¥çœ‹','1','','','','0','wshbj:examinationRecord:view','1','2018-03-12 12:02:38','1','2018-03-12 12:02:38','','0'),('2b1c4c7103204d57bc540f0a1e9ba0f5','f4780696ac6f4ac48122dec79e9ce519','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,f4780696ac6f4ac48122dec79e9ce519,','ç¼–è¾‘','30','','','','0','wshbj:examinationItemType:editByCenter','1','2018-03-10 11:02:03','1','2018-03-11 15:25:59','','0'),('2c12a52a000841968083929aead0fe50','574a258f0ffc435faaaa557bcb421490','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,574a258f0ffc435faaaa557bcb421490,','æŸ¥çœ‹','1','','','','0','wshbj:specimen:view','1','2018-03-11 00:21:26','1','2018-03-11 00:21:26','','0'),('2d890d8458e24bb9a753da8c36c42c08','55fc8176b2f74ee1a9bd8112ea93ba75','0,1,1efc52de37db406ba9be7dd3f06859b7,053d3ddee6f048f69a3e8b73b41787a5,55fc8176b2f74ee1a9bd8112ea93ba75,','é‡‡é›†','30','','','beaker','0','wshbj:examinationRecordItem:edit','1','2018-04-01 10:21:12','1','2018-04-21 14:21:17','','0'),('3','2','0,1,2,','ç³»ç»Ÿè®¾ç½®','980',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('30','28','0,1,27,28,','ä¿®æ”¹å¯†ç ','40','/sys/user/modifyPwd',NULL,'lock','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('30919dfb6532461d9e982662bdb9fabc','f3ee9c9fe5b948f0be57ceb0ffbd3082','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,f3ee9c9fe5b948f0be57ceb0ffbd3082,','ç¼–è¾‘','2','','','','0','wshbj:examinationDept:edit','1','2018-03-11 15:58:43','1','2018-03-11 15:58:43','','0'),('31','1','0,1,','å†…å®¹ç®¡ç†','500',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('32','31','0,1,31,','æ ç›®è®¾ç½®','990',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('33','32','0,1,31,32','æ ç›®ç®¡ç†','30','/cms/category/',NULL,'align-justify','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('34','33','0,1,31,32,33,','æŸ¥çœ‹','30',NULL,NULL,NULL,'0','cms:category:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('35','33','0,1,31,32,33,','ä¿®æ”¹','40',NULL,NULL,NULL,'0','cms:category:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('36','32','0,1,31,32','ç«™ç‚¹è®¾ç½®','40','/cms/site/',NULL,'certificate','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3628fdf639cd4f9aa5251702edea6e7b','3c92c17886944d0687e73e286cada573','0,1,79,3c92c17886944d0687e73e286cada573,','æµ‹è¯•1','12','/test1/test1','','asterisk','1','test1:test1:view,test1:test1:edit','1','2018-03-03 02:35:18','1','2018-03-03 02:35:18','','1'),('37','36','0,1,31,32,36,','æŸ¥çœ‹','30',NULL,NULL,NULL,'0','cms:site:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('38','36','0,1,31,32,36,','ä¿®æ”¹','40',NULL,NULL,NULL,'0','cms:site:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('39','32','0,1,31,32','åˆ‡æ¢ç«™ç‚¹','50','/cms/site/select',NULL,'retweet','1','cms:site:select','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3b49c381c07641f7a249a5d31bca19b8','da445992999a4a13b749a7cc00ed4b7d','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,','æ£€æŸ¥ç±»åˆ«','1','/wshbj/examinationCategory/list','','','1','wshbj:examinationCategory:view','1','2018-03-07 16:58:09','1','2018-03-10 11:25:06','','0'),('3c92c17886944d0687e73e286cada573','79','0,1,79,','ç”Ÿæˆç¤ºä¾‹','120','','','','1','','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('4','3','0,1,2,3,','èœå•ç®¡ç†','30','/sys/menu/',NULL,'list-alt','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('40','31','0,1,31,','å†…å®¹ç®¡ç†','500',NULL,NULL,NULL,'1','cms:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('41','40','0,1,31,40,','å†…å®¹å‘å¸ƒ','30','/cms/',NULL,'briefcase','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('42','41','0,1,31,40,41,','æ–‡ç« æ¨¡å‹','40','/cms/article/',NULL,'file','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('429e899b63fa4a9896544a3b3e5a7c43','3b49c381c07641f7a249a5d31bca19b8','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,3b49c381c07641f7a249a5d31bca19b8,','ç¼–è¾‘','2','','','','0','wshbj:examinationCategory:edit','1','2018-03-10 11:26:53','1','2018-03-10 11:26:53','','0'),('43','42','0,1,31,40,41,42,','æŸ¥çœ‹','30',NULL,NULL,NULL,'0','cms:article:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('44','42','0,1,31,40,41,42,','ä¿®æ”¹','40',NULL,NULL,NULL,'0','cms:article:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('45','42','0,1,31,40,41,42,','å®¡æ ¸','50',NULL,NULL,NULL,'0','cms:article:audit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('46','41','0,1,31,40,41,','é“¾æ¥æ¨¡å‹','60','/cms/link/',NULL,'random','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('46205ec931f44dbb8dda804b05284e3d','29c75b07c3454e489be6a62a76ec1094','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,29c75b07c3454e489be6a62a76ec1094,','ç¼–è¾‘','2','','','','0','wshbj:examinationCategory:editByCenter','1','2018-03-07 17:30:53','1','2018-03-10 11:13:13','','0'),('47','46','0,1,31,40,41,46,','æŸ¥çœ‹','30',NULL,NULL,NULL,'0','cms:link:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('48','46','0,1,31,40,41,46,','ä¿®æ”¹','40',NULL,NULL,NULL,'0','cms:link:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4855cf3b25c244fb8500a380db189d97','b1f6d1b86ba24365bae7fd86c5082317','0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,','æŸ¥çœ‹','30','','','','0','test:testDataMain:view','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('48b5f7ff7ce44a519d2185fb8b1a92b1','b90dae451d4341f09e6e5493a8df017c','0,1,1efc52de37db406ba9be7dd3f06859b7,053d3ddee6f048f69a3e8b73b41787a5,b90dae451d4341f09e6e5493a8df017c,','æŸ¥çœ‹','1','','','','0','wshbj:certRecord:view','1','2018-03-25 18:50:13','1','2018-03-25 18:50:13','','0'),('49','46','0,1,31,40,41,46,','å®¡æ ¸','50',NULL,NULL,NULL,'0','cms:link:audit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4c454c20042542cebe3cee0a6279c4b8','053d3ddee6f048f69a3e8b73b41787a5','0,1,1efc52de37db406ba9be7dd3f06859b7,053d3ddee6f048f69a3e8b73b41787a5,','æ ·æœ¬ç»“æœ','40','/wshbj/examinationRecord/inputSamplesResult','','','0','wshbj:examinationRecord:inputSamplesResult','1','2018-03-22 21:16:41','1','2018-04-23 02:37:20','','0'),('5','4','0,1,2,3,4,','æŸ¥çœ‹','30',NULL,NULL,NULL,'0','sys:menu:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('50','40','0,1,31,40,','è¯„è®ºç®¡ç†','40','/cms/comment/?status=2',NULL,'comment','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('51','50','0,1,31,40,50,','æŸ¥çœ‹','30',NULL,NULL,NULL,'0','cms:comment:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('52','50','0,1,31,40,50,','å®¡æ ¸','40',NULL,NULL,NULL,'0','cms:comment:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('52127cbc635144d393530ea86e0d9b3b','574a258f0ffc435faaaa557bcb421490','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,574a258f0ffc435faaaa557bcb421490,','ç¼–è¾‘','2','','','','0','wshbj:specimen:edit','1','2018-03-11 00:21:45','1','2018-03-11 00:21:45','','0'),('53','40','0,1,31,40,','å…¬å…±ç•™è¨€','80','/cms/guestbook/?status=2',NULL,'glass','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('54','53','0,1,31,40,53,','æŸ¥çœ‹','30',NULL,NULL,NULL,'0','cms:guestbook:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('55','53','0,1,31,40,53,','å®¡æ ¸','40',NULL,NULL,NULL,'0','cms:guestbook:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('55fc8176b2f74ee1a9bd8112ea93ba75','053d3ddee6f048f69a3e8b73b41787a5','0,1,1efc52de37db406ba9be7dd3f06859b7,053d3ddee6f048f69a3e8b73b41787a5,','æ ·æœ¬é‡‡é›†','30','/wshbj/examinationSamples/form','','beaker','1','wshbj:examinationRecordItem:edit','1','2018-03-19 10:10:31','1','2018-04-21 21:34:17','','0'),('56','71','0,1,27,71,','æ–‡ä»¶ç®¡ç†','90','/../static/ckfinder/ckfinder.html',NULL,'folder-open','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('57','56','0,1,27,40,56,','æŸ¥çœ‹','30',NULL,NULL,NULL,'0','cms:ckfinder:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('574a258f0ffc435faaaa557bcb421490','da445992999a4a13b749a7cc00ed4b7d','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,','æ ‡æœ¬ç®¡ç†','6','/wshbj/specimen/list','','','1','wshbj:specimen:view','1','2018-03-11 00:21:04','1','2018-03-11 00:21:04','','0'),('57e4a401ceca4b7a923494ac93d0c558','9032a8d00f7d42b197f5a7a47b6830dd','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,','é¡¹ç›®åˆ†ç±»','2','/wshbj/examinationItemCategory/listByCenter','','','1','wshbj:examinationItemCategory:viewByCenter','1','2018-03-10 10:53:02','1','2018-03-11 00:42:04','','0'),('58','56','0,1,27,40,56,','ä¸Šä¼ ','40',NULL,NULL,NULL,'0','cms:ckfinder:upload','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('586f7fa09f424462b65c02274fabef53','7f002e5edc524aa19a3bb3cabf0c1a17','0,1,1efc52de37db406ba9be7dd3f06859b7,679841c6cfbd4ab0b61592b738baddc9,7f002e5edc524aa19a3bb3cabf0c1a17,','æŸ¥çœ‹','1','','','','0','wshbj:examinationUser:view','1','2018-03-12 12:05:00','1','2018-03-12 12:05:00','','0'),('59','56','0,1,27,40,56,','ä¿®æ”¹','50',NULL,NULL,NULL,'0','cms:ckfinder:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5bf62f84f476436bb901a6aa5f5a717b','9032a8d00f7d42b197f5a7a47b6830dd','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,','æ£€æŸ¥é¡¹ç›®','4','/wshbj/examinationItem/listByCenter','','','1','wshbj:examinationItem:viewByCenter','1','2018-03-10 11:05:11','1','2018-03-10 11:05:24','','0'),('5c79380c225b41368264552635e3cbcb','2115345503a44f02b2e6a4032faa910e','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,2115345503a44f02b2e6a4032faa910e,','ç¼–è¾‘','2','','','','0','wshbj:specimen:editByCenter','1','2018-03-10 11:21:46','1','2018-03-12 09:09:16','','0'),('6','4','0,1,2,3,4,','ä¿®æ”¹','40',NULL,NULL,NULL,'0','sys:menu:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('60','31','0,1,31,','ç»Ÿè®¡åˆ†æ','600',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('61','60','0,1,31,60,','ä¿¡æ¯é‡ç»Ÿè®¡','30','/cms/stats/article',NULL,'tasks','1','cms:stats:article','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('62','1','0,1,','åœ¨çº¿åŠå…¬','200','','','','0','','1','2013-05-27 08:00:00','1','2018-04-16 09:11:58','','0'),('63','62','0,1,62,','ä¸ªäººåŠå…¬','30',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('639f401e930a4cdfa4d863818297e817','e18d31899efa41059d5b15e34b2a2cd0','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,e18d31899efa41059d5b15e34b2a2cd0,','æŸ¥çœ‹','1','','','','0','wshbj:industry:view','1','2018-03-11 00:24:56','1','2018-03-11 00:24:56','','0'),('64','63','0,1,62,63,','è¯·å‡åŠç†','300','/oa/leave',NULL,'leaf','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('65','64','0,1,62,63,64,','æŸ¥çœ‹','30',NULL,NULL,NULL,'0','oa:leave:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('65db10286d984e22828e0e2d09f25e8d','df5844e85fb64ba3b16851fe062b443b','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,df5844e85fb64ba3b16851fe062b443b,','ç¼–è¾‘','2','','','','0','wshbj:examinationResultDict:editByCenter','1','2018-03-10 11:10:22','1','2018-03-10 11:10:22','','0'),('66','64','0,1,62,63,64,','ä¿®æ”¹','40',NULL,NULL,NULL,'0','oa:leave:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('67','2','0,1,2,','æ—¥å¿—æŸ¥è¯¢','985',NULL,NULL,NULL,'1',NULL,'1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('679841c6cfbd4ab0b61592b738baddc9','1efc52de37db406ba9be7dd3f06859b7','0,1,1efc52de37db406ba9be7dd3f06859b7,','ä½“æ£€äºº','30','','','hand-right','1','','1','2018-04-16 10:14:09','1','2018-04-16 10:14:21','','0'),('68','67','0,1,2,67,','æ—¥å¿—æŸ¥è¯¢','30','/sys/log',NULL,'pencil','1','sys:log:view','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('69','62','0,1,62,','æµç¨‹ç®¡ç†','300',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6d29e488517c4f8eb7a1c946760249f3','a85d1e78223646bfa5b16108c51c057d','0,1,c6f7ff36458f417f855ed1f523f84c83,a85d1e78223646bfa5b16108c51c057d,','ç¼–è¾‘','2','','','','0','wshbj:examinationForm:edit','1','2018-03-15 09:55:23','1','2018-03-15 09:56:16','','0'),('7','3','0,1,2,3,','è§’è‰²ç®¡ç†','50','/sys/role/',NULL,'lock','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('70','69','0,1,62,69,','æµç¨‹ç®¡ç†','50','/act/process',NULL,'road','1','act:process:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('71','27','0,1,27,','æ–‡ä»¶ç®¡ç†','90',NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('72','69','0,1,62,69,','æ¨¡å‹ç®¡ç†','100','/act/model',NULL,'road','1','act:model:edit','1','2013-09-20 08:00:00','1','2013-09-20 08:00:00',NULL,'0'),('72ad2c4c721849119353081b73e2700c','1efc52de37db406ba9be7dd3f06859b7','0,1,1efc52de37db406ba9be7dd3f06859b7,','å¯¼èˆª','10','','','home','1','','1','2018-04-16 10:12:45','1','2018-04-16 10:12:45','','0'),('72e0fea5017a409d80094df9e82c66a2','7b4af83064964e2e9bf6f4f1232b6d04','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,7b4af83064964e2e9bf6f4f1232b6d04,','æŸ¥çœ‹','1','','','','0','wshbj:examinationItemType:view','1','2018-03-10 20:57:46','1','2018-03-10 20:57:46','','0'),('73','63','0,1,62,63,','æˆ‘çš„ä»»åŠ¡','50','/act/task/todo/',NULL,'tasks','1',NULL,'1','2013-09-24 08:00:00','1','2013-09-24 08:00:00',NULL,'0'),('74','63','0,1,62,63,','å®¡æ‰¹æµ‹è¯•','100','/oa/testAudit',NULL,NULL,'1','oa:testAudit:view,oa:testAudit:edit','1','2013-09-24 08:00:00','1','2013-09-24 08:00:00',NULL,'0'),('75','1','0,1,','åœ¨çº¿æ¼”ç¤º','3000',NULL,NULL,NULL,'1',NULL,'1','2013-10-08 08:00:00','1','2013-10-08 08:00:00',NULL,'1'),('79','1','0,1,','ä»£ç ç”Ÿæˆ','5000',NULL,NULL,NULL,'1',NULL,'1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),('7b4af83064964e2e9bf6f4f1232b6d04','da445992999a4a13b749a7cc00ed4b7d','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,','é¡¹ç›®ç±»å‹','3','/wshbj/examinationItemType/list','','','1','wshbj:examinationItemType:view','1','2018-03-10 20:57:31','1','2018-03-10 20:57:31','','0'),('7c29a315b29942d290ed2367a67ca319','053d3ddee6f048f69a3e8b73b41787a5','0,1,1efc52de37db406ba9be7dd3f06859b7,053d3ddee6f048f69a3e8b73b41787a5,','å¾…å½•ç»“æœé¡¹ç›®','37','/wshbj/examinationRecordItem/list_no_result','','calendar','1','wshbj:examinationRecordItem:view','1','2018-04-21 23:07:53','1','2018-04-21 23:53:30','','0'),('7c2a5804ccc448b88fd589f1249c52ca','1efc52de37db406ba9be7dd3f06859b7','0,1,1efc52de37db406ba9be7dd3f06859b7,','åŸºç¡€æ•°æ®','40','','','asterisk','1','','1','2018-04-16 10:48:51','1','2018-04-16 10:48:51','','0'),('7e6aa5d1f2db491085183115922e67ee','29c75b07c3454e489be6a62a76ec1094','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,29c75b07c3454e489be6a62a76ec1094,','æŸ¥çœ‹','1','','','','0','wshbj:examinationCategory:viewByCenter','1','2018-03-10 11:13:40','1','2018-03-10 11:13:40','','0'),('7f002e5edc524aa19a3bb3cabf0c1a17','679841c6cfbd4ab0b61592b738baddc9','0,1,1efc52de37db406ba9be7dd3f06859b7,679841c6cfbd4ab0b61592b738baddc9,','ä½“æ£€ç”¨æˆ·','10','/wshbj/examinationUser/list','','user','1','wshbj:examinationUser:view','1','2018-03-12 12:04:27','1','2018-04-16 10:14:34','','0'),('7fa72032991e45bab16053c5f6bf15b1','9032a8d00f7d42b197f5a7a47b6830dd','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,','æ£€æŸ¥éƒ¨é—¨','9','/wshbj/examinationDept/listByCenter','','','1','wshbj:examinationDept:viewByCenter','1','2018-03-11 15:56:44','1','2018-03-11 15:56:44','','0'),('8','7','0,1,2,3,7,','æŸ¥çœ‹','30',NULL,NULL,NULL,'0','sys:role:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('80','79','0,1,79,','ä»£ç ç”Ÿæˆ','50',NULL,NULL,NULL,'1',NULL,'1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),('800fd80a27aa4505ba8df8951aa7866b','eaf34e221ac44d6f87dda25f5d2976d1','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,eaf34e221ac44d6f87dda25f5d2976d1,','ç¼–è¾‘','2','','','','0','wshbj:jobPost:editByCenter','1','2018-03-10 11:24:03','1','2018-03-10 11:24:03','','0'),('81','80','0,1,79,80,','ç”Ÿæˆæ–¹æ¡ˆé…ç½®','30','/gen/genScheme',NULL,NULL,'1','gen:genScheme:view,gen:genScheme:edit','1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),('82','80','0,1,79,80,','ä¸šåŠ¡è¡¨é…ç½®','20','/gen/genTable',NULL,NULL,'1','gen:genTable:view,gen:genTable:edit,gen:genTableColumn:view,gen:genTableColumn:edit','1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),('83','80','0,1,79,80,','ä»£ç æ¨¡æ¿ç®¡ç†','90','/gen/genTemplate',NULL,NULL,'1','gen:genTemplate:view,gen:genTemplate:edit','1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'1'),('83ca127bffa14dd09b72fd0428cfe748','7f002e5edc524aa19a3bb3cabf0c1a17','0,1,1efc52de37db406ba9be7dd3f06859b7,679841c6cfbd4ab0b61592b738baddc9,7f002e5edc524aa19a3bb3cabf0c1a17,','æ·»åŠ ','2','','','','0','wshbj:examinationUser:edit','1','2018-03-12 12:05:24','1','2018-03-12 12:05:24','','0'),('84','67','0,1,2,67,','è¿æ¥æ± ç›‘è§†','40','/../druid',NULL,NULL,'1',NULL,'1','2013-10-18 08:00:00','1','2013-10-18 08:00:00',NULL,'0'),('85','76','0,1,75,76,','è¡Œæ”¿åŒºåŸŸ','80','/../static/map/map-city.html',NULL,NULL,'1',NULL,'1','2013-10-22 08:00:00','1','2013-10-22 08:00:00',NULL,'0'),('86','75','0,1,75,','ç»„ä»¶æ¼”ç¤º','50',NULL,NULL,NULL,'1',NULL,'1','2013-10-22 08:00:00','1','2013-10-22 08:00:00',NULL,'1'),('860c8008a2ac44b990f8695278537a35','bc3665202c5140f7a5703b1272b4c5cd','0,1,1efc52de37db406ba9be7dd3f06859b7,679841c6cfbd4ab0b61592b738baddc9,bc3665202c5140f7a5703b1272b4c5cd,','æ·»åŠ ','2','','','','0','wshbj:organ:edit','1','2018-03-12 12:15:55','1','2018-03-12 12:15:55','','0'),('87','86','0,1,75,86,','ç»„ä»¶æ¼”ç¤º','30','/test/test/form',NULL,NULL,'1','test:test:view,test:test:edit','1','2013-10-22 08:00:00','1','2013-10-22 08:00:00',NULL,'1'),('88','62','0,1,62,','é€šçŸ¥é€šå‘Š','20','','','','1','','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('89','88','0,1,62,88,','æˆ‘çš„é€šå‘Š','30','/oa/oaNotify/self','','','1','','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('8b1e81ede9744ca29271e21bc7b9a300','f1ef203de0b54cf3a7f3637f5eaf482c','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,f1ef203de0b54cf3a7f3637f5eaf482c,','æŸ¥çœ‹','1','','','','0','wshbj:examinationResultDict:view','1','2018-03-11 00:19:34','1','2018-03-11 00:19:34','','0'),('8d29454fbb4f4c04b8ae00b052d8a2e3','7fa72032991e45bab16053c5f6bf15b1','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,7fa72032991e45bab16053c5f6bf15b1,','æŸ¥çœ‹','1','','','','0','wshbj:examinationDept:viewByCenter','1','2018-03-11 15:57:05','1','2018-03-11 15:57:05','','0'),('9','7','0,1,2,3,7,','ä¿®æ”¹','40',NULL,NULL,NULL,'0','sys:role:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('90','88','0,1,62,88,','é€šå‘Šç®¡ç†','50','/oa/oaNotify','','','1','oa:oaNotify:view,oa:oaNotify:edit','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('9032a8d00f7d42b197f5a7a47b6830dd','c6f7ff36458f417f855ed1f523f84c83','0,1,c6f7ff36458f417f855ed1f523f84c83,','åŸºç¡€æ”¯æ’‘','1','','','','1','','1','2018-03-06 12:58:43','1','2018-03-10 10:40:27','','0'),('927d6756e2974c58ade07742b74b05a1','df5844e85fb64ba3b16851fe062b443b','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,df5844e85fb64ba3b16851fe062b443b,','æŸ¥çœ‹','1','','','','0','wshbj:examinationResultDict:viewByCenter','1','2018-03-10 11:09:29','1','2018-03-12 10:57:08','','0'),('9301ade5de3143d798a0bc77f4e731c5','7b4af83064964e2e9bf6f4f1232b6d04','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,7b4af83064964e2e9bf6f4f1232b6d04,','ç¼–è¾‘','2','','','','0','wshbj:examinationItemType:edit','1','2018-03-10 20:58:05','1','2018-03-10 20:58:05','','0'),('94a46fdc598a48f78f726bcb5a55ab90','3b49c381c07641f7a249a5d31bca19b8','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,3b49c381c07641f7a249a5d31bca19b8,','æŸ¥çœ‹','1','','','','0','wshbj:examinationCategory:view','1','2018-03-07 17:29:46','1','2018-03-10 11:26:34','','0'),('96c3d73e685b483fa82b11ca0cfffc22','2115345503a44f02b2e6a4032faa910e','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,2115345503a44f02b2e6a4032faa910e,','æŸ¥çœ‹','1','','','','0','wshbj:specimen:viewByCenter','1','2018-03-10 11:21:16','1','2018-03-10 11:21:16','','0'),('98c867d6168948be877d1694836f15e5','57e4a401ceca4b7a923494ac93d0c558','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,57e4a401ceca4b7a923494ac93d0c558,','ç¼–è¾‘','2','','','','0','wshbj:examinationItemCategory:editByCenter','1','2018-03-10 10:54:23','1','2018-03-10 11:11:37','','0'),('9ab09ab112b642bdaf68996b366449e0','c9f1ca975a0e46e4ab2b9b6f007199e9','0,1,1efc52de37db406ba9be7dd3f06859b7,7c2a5804ccc448b88fd589f1249c52ca,c9f1ca975a0e46e4ab2b9b6f007199e9,','ç¼–è¾‘','2','','','','0','wshbj:examinationPackage:edit','1','2018-03-12 15:16:59','1','2018-03-12 15:16:59','','0'),('a08a70b711d84470bde6b408af118467','5bf62f84f476436bb901a6aa5f5a717b','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,5bf62f84f476436bb901a6aa5f5a717b,','ç¼–è¾‘','2','','','','0','wshbj:examinationItem:editByCenter','1','2018-03-10 11:07:38','1','2018-03-10 11:07:38','','0'),('a15153de146e4b639a88c6cef3700fbd','053d3ddee6f048f69a3e8b73b41787a5','0,1,1efc52de37db406ba9be7dd3f06859b7,053d3ddee6f048f69a3e8b73b41787a5,','å¾…é‡‡é›†æ ·æœ¬','35','/wshbj/examinationRecordItem/list_need_sample_nodo','','film','1','wshbj:examinationRecordItem:view','1','2018-04-21 21:34:08','1','2018-04-21 23:05:25','','0'),('a1ad8e2c138a45679274b0983de5f8b5','e5bcc15b76f8477195762c7248cc04aa','0,1,1efc52de37db406ba9be7dd3f06859b7,053d3ddee6f048f69a3e8b73b41787a5,e5bcc15b76f8477195762c7248cc04aa,','æ·»åŠ ','2','','','','0','wshbj:examinationRecord:edit','1','2018-03-12 12:03:01','1','2018-03-12 12:03:45','','0'),('a1e776ccaa8445b4bc488d5f07fa7f89','ca6f2c5432294cb28b8c9fd8d26558c5','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,ca6f2c5432294cb28b8c9fd8d26558c5,','æŸ¥çœ‹','1','','','','0','wshbj:examinationItem:view','1','2018-03-10 20:55:56','1','2018-03-10 20:55:56','','0'),('a299f4c8d9b24b2d9e37819d08be8492','f4780696ac6f4ac48122dec79e9ce519','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,f4780696ac6f4ac48122dec79e9ce519,','æŸ¥çœ‹','1','','','','0','wshbj:examinationItemType:viewByCenter','1','2018-03-10 11:02:58','1','2018-03-10 11:03:25','','0'),('a2cae1b7dbfa4336af96ec6409d02b12','13549f076c454f92baaeac590b118990','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,13549f076c454f92baaeac590b118990,','æŸ¥çœ‹','1','','','','0','wshbj:industry:viewByCenter','1','2018-03-10 11:19:01','1','2018-03-10 11:19:01','','0'),('a707f252e00749f7ae613e0eef24a6dd','053d3ddee6f048f69a3e8b73b41787a5','0,1,1efc52de37db406ba9be7dd3f06859b7,053d3ddee6f048f69a3e8b73b41787a5,','ä¿¡æ¯ç™»è®°','20','/wshbj/examinationRecord/form','','edit','1','wshbj:examinationRecord:edit','1','2018-03-19 10:07:45','1','2018-04-19 11:50:55','','0'),('a85d1e78223646bfa5b16108c51c057d','c6f7ff36458f417f855ed1f523f84c83','0,1,c6f7ff36458f417f855ed1f523f84c83,','æµç¨‹è¡¨æ¨¡æ¿','2','/wshbj/examinationForm/list','','','1','wshbj:examinationForm:view','1','2018-03-15 09:54:17','1','2018-03-15 09:54:17','','0'),('a922363504e84b1783a4dbedd5ee4885','da445992999a4a13b749a7cc00ed4b7d','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,','å²—ä½ç®¡ç†','8','/wshbj/jobPost/list','','','1','wshbj:jobPost:view','1','2018-03-11 00:26:15','1','2018-03-11 00:26:15','','0'),('a9e51d0b6f35491d9e5e2d7f2a874551','053d3ddee6f048f69a3e8b73b41787a5','0,1,1efc52de37db406ba9be7dd3f06859b7,053d3ddee6f048f69a3e8b73b41787a5,','ä½“æ£€è®°å½•åˆ—è¡¨','25','/wshbj/examinationRecord/list','','group','1','wshbj:examinationRecord:view','1','2018-04-19 11:50:17','1','2018-04-19 11:50:17','','0'),('abc0a0f01041452f9c233b5fd3d835dd','13549f076c454f92baaeac590b118990','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,13549f076c454f92baaeac590b118990,','ç¼–è¾‘','2','','','','0','wshbj:industry:editByCenter','1','2018-03-06 13:41:12','1','2018-03-10 11:17:03','','0'),('af9ad6cfe1e741e3a68632cc2e8c359b','7fa72032991e45bab16053c5f6bf15b1','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,7fa72032991e45bab16053c5f6bf15b1,','ç¼–è¾‘','2','','','','0','wshbj:examinationDept:editByCenter','1','2018-03-11 15:57:26','1','2018-03-11 15:57:26','','0'),('afab2db430e2457f9cf3a11feaa8b869','0ca004d6b1bf4bcab9670a5060d82a55','0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,','ç¼–è¾‘','60','','','','0','test:testTree:edit','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('b076c39f152a42f6bbbbe29600754648','a85d1e78223646bfa5b16108c51c057d','0,1,c6f7ff36458f417f855ed1f523f84c83,a85d1e78223646bfa5b16108c51c057d,','æŸ¥çœ‹','1','','','','0','wshbj:examinationForm:view','1','2018-03-15 09:54:55','1','2018-03-15 09:54:55','','0'),('b1f6d1b86ba24365bae7fd86c5082317','3c92c17886944d0687e73e286cada573','0,1,79,3c92c17886944d0687e73e286cada573,','ä¸»å­è¡¨','60','/test/testDataMain','','','1','','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('b25a79da91ab4698a92a94920abbb06b','a922363504e84b1783a4dbedd5ee4885','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,a922363504e84b1783a4dbedd5ee4885,','æŸ¥çœ‹','1','','','','0','wshbj:jobPost:view','1','2018-03-11 00:26:36','1','2018-03-11 00:26:36','','0'),('b90dae451d4341f09e6e5493a8df017c','053d3ddee6f048f69a3e8b73b41787a5','0,1,1efc52de37db406ba9be7dd3f06859b7,053d3ddee6f048f69a3e8b73b41787a5,','åˆ¶å¡','60','/wshbj/certRecord/form','','','0','wshbj:certRecord:edit','1','2018-03-25 18:48:37','1','2018-04-23 02:37:33','','0'),('ba15c2232943412dae72e1758a78c68b','e18d31899efa41059d5b15e34b2a2cd0','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,e18d31899efa41059d5b15e34b2a2cd0,','ç¼–è¾‘','2','','','','0','wshbj:industry:edit','1','2018-03-11 00:25:15','1','2018-03-11 00:25:15','','0'),('ba8092291b40482db8fe7fc006ea3d76','3c92c17886944d0687e73e286cada573','0,1,79,3c92c17886944d0687e73e286cada573,','å•è¡¨','30','/test/testData','','','1','','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('bc017b79d82c40bebaa825bd486a0143','c6f7ff36458f417f855ed1f523f84c83','0,1,c6f7ff36458f417f855ed1f523f84c83,','å¥—é¤ç®¡ç†','3','','','','1','','1','2018-03-10 10:41:03','1','2018-03-10 10:41:15','','0'),('bc3665202c5140f7a5703b1272b4c5cd','679841c6cfbd4ab0b61592b738baddc9','0,1,1efc52de37db406ba9be7dd3f06859b7,679841c6cfbd4ab0b61592b738baddc9,','ä½“æ£€å•ä½','20','/wshbj/organ/list','','group','1','wshbj:organ:view','1','2018-03-12 12:14:21','1','2018-04-16 10:14:49','','0'),('c2c2be8854454a52892ea2315ce6146c','bc3665202c5140f7a5703b1272b4c5cd','0,1,1efc52de37db406ba9be7dd3f06859b7,679841c6cfbd4ab0b61592b738baddc9,bc3665202c5140f7a5703b1272b4c5cd,','æŸ¥çœ‹','1','','','','0','wshbj:organ:view','1','2018-03-12 12:15:27','1','2018-03-12 12:15:27','','0'),('c2e4d9082a0b4386884a0b203afe2c5c','0ca004d6b1bf4bcab9670a5060d82a55','0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,','æŸ¥çœ‹','30','','','','0','test:testTree:view','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('c2fd2e0661e94db8b3713f1eb445d71f','c9f1ca975a0e46e4ab2b9b6f007199e9','0,1,1efc52de37db406ba9be7dd3f06859b7,7c2a5804ccc448b88fd589f1249c52ca,c9f1ca975a0e46e4ab2b9b6f007199e9,','æŸ¥çœ‹','1','','','','0','wshbj:examinationPackage:view','1','2018-03-12 15:16:40','1','2018-03-12 15:16:40','','0'),('c6f7ff36458f417f855ed1f523f84c83','1','0,1,','è¿è¥æ•°æ®','1','','','','0','','1','2018-03-06 12:55:27','1','2018-04-16 09:11:44','','0'),('c9f1ca975a0e46e4ab2b9b6f007199e9','7c2a5804ccc448b88fd589f1249c52ca','0,1,1efc52de37db406ba9be7dd3f06859b7,7c2a5804ccc448b88fd589f1249c52ca,','ä½“æ£€å¥—é¤','40','/wshbj/examinationPackage/list','','gift','1','wshbj:examinationPackage:view','1','2018-03-12 15:16:10','1','2018-04-16 10:49:57','','0'),('ca6f2c5432294cb28b8c9fd8d26558c5','da445992999a4a13b749a7cc00ed4b7d','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,','æ£€æŸ¥é¡¹ç›®','4','/wshbj/examinationItem/list','','','1','wshbj:examinationItem:view','1','2018-03-10 20:55:35','1','2018-03-10 20:56:46','','0'),('cb9663b6a7d846f7916943ec12170444','7c2a5804ccc448b88fd589f1249c52ca','0,1,1efc52de37db406ba9be7dd3f06859b7,7c2a5804ccc448b88fd589f1249c52ca,','æ ·æœ¬ç¼–å·åº“','70','/wshbj/sampleCodesPack/list','','barcode','1','wshbj:sampleCodes:view,wshbj:sampleCodes:edit','1','2018-04-20 17:13:26','1','2018-04-20 17:13:26','','0'),('d15ec45a4c5449c3bbd7a61d5f9dd1d2','b1f6d1b86ba24365bae7fd86c5082317','0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,','ç¼–è¾‘','60','','','','0','test:testDataMain:edit','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('d799ec8d21fd491e8c07df78005c4f27','da445992999a4a13b749a7cc00ed4b7d','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,','é¡¹ç›®åˆ†ç±»','2','/wshbj/examinationItemCategory/list','','','1','wshbj:examinationItemCategory:view','1','2018-03-10 20:53:13','1','2018-03-11 00:29:54','','0'),('d9017557f5204f1b89c477cc1ac86214','5bf62f84f476436bb901a6aa5f5a717b','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,5bf62f84f476436bb901a6aa5f5a717b,','æŸ¥çœ‹','1','','','','0','wshbj:examinationItem:viewByCenter','1','2018-03-10 11:06:58','1','2018-03-10 11:06:58','','0'),('da445992999a4a13b749a7cc00ed4b7d','19b0ae33a47e437196b41b664c95a34d','0,1,19b0ae33a47e437196b41b664c95a34d,','åŸºç¡€æ”¯æ’‘','1','','','','1','','1','2018-03-07 16:57:35','1','2018-03-10 11:29:32','','0'),('dc717662e50c48479f8f8bb1a4650f07','57e4a401ceca4b7a923494ac93d0c558','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,57e4a401ceca4b7a923494ac93d0c558,','æŸ¥çœ‹','1','','','','0','wshbj:examinationItemCategory:viewByCenter','1','2018-03-10 11:12:29','1','2018-03-10 11:12:29','','0'),('deedabfad028491db224ac83cbeffa66','f1ef203de0b54cf3a7f3637f5eaf482c','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,f1ef203de0b54cf3a7f3637f5eaf482c,','ç¼–è¾‘','2','','','','0','wshbj:examinationResultDict:edit','1','2018-03-11 00:19:56','1','2018-03-11 00:19:56','','0'),('df5844e85fb64ba3b16851fe062b443b','9032a8d00f7d42b197f5a7a47b6830dd','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,','é¡¹ç›®ç»“æœ','5','/wshbj/examinationResultDict/listByCenter','','','1','wshbj:examinationResultDict:viewByCenter','1','2018-03-10 11:08:56','1','2018-03-10 11:08:56','','0'),('df794afd30504b97bcaaff5e5fb27adb','a922363504e84b1783a4dbedd5ee4885','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,a922363504e84b1783a4dbedd5ee4885,','ç¼–è¾‘','2','','','','0','wshbj:jobPost:edit','1','2018-03-11 00:27:00','1','2018-03-11 00:27:00','','0'),('df7ce823c5b24ff9bada43d992f373e2','ba8092291b40482db8fe7fc006ea3d76','0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,','æŸ¥çœ‹','30','','','','0','test:testData:view','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('e18d31899efa41059d5b15e34b2a2cd0','da445992999a4a13b749a7cc00ed4b7d','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,','è¡Œä¸šç®¡ç†','7','/wshbj/industry/list','','','1','wshbj:industry:view','1','2018-03-11 00:23:34','1','2018-03-11 00:23:34','','0'),('e1f432af20e3476696937361afcd540e','d799ec8d21fd491e8c07df78005c4f27','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,d799ec8d21fd491e8c07df78005c4f27,','ç¼–è¾‘','2','','','','0','wshbj:examinationItemCategory:edit','1','2018-03-10 20:54:47','1','2018-03-11 12:01:23','','0'),('e5bcc15b76f8477195762c7248cc04aa','053d3ddee6f048f69a3e8b73b41787a5','0,1,1efc52de37db406ba9be7dd3f06859b7,053d3ddee6f048f69a3e8b73b41787a5,','ä½“æ£€è®°å½•','70','/wshbj/examinationRecord/list','','','0','wshbj:examinationRecord:view','1','2018-03-12 12:02:09','1','2018-04-23 02:37:44','','0'),('eaf34e221ac44d6f87dda25f5d2976d1','9032a8d00f7d42b197f5a7a47b6830dd','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,','å²—ä½ç®¡ç†','8','/wshbj/jobPost/listByCenter','','','1','wshbj:jobPost:viewByCenter','1','2018-03-10 11:22:47','1','2018-03-10 11:22:58','','0'),('ed70f9bf857444ffaa24346217ac761f','d799ec8d21fd491e8c07df78005c4f27','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,d799ec8d21fd491e8c07df78005c4f27,','æŸ¥çœ‹','1','','','','0','wshbj:examinationItemCategory:view','1','2018-03-10 20:54:11','1','2018-03-10 20:54:25','','0'),('f1ef203de0b54cf3a7f3637f5eaf482c','da445992999a4a13b749a7cc00ed4b7d','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,','é¡¹ç›®ç»“æœ','5','/wshbj/examinationResultDict/list','','','1','wshbj:examinationResultDict:view','1','2018-03-10 20:59:32','1','2018-03-10 20:59:32','','0'),('f35b9e880fad4aafb907fcf9948a334c','72ad2c4c721849119353081b73e2700c','0,1,1efc52de37db406ba9be7dd3f06859b7,72ad2c4c721849119353081b73e2700c,','ä½“æ£€å¯¼èˆª','5','/wshbj/home/index','','sitemap','1','','1','2018-04-16 09:07:48','1','2018-04-16 10:13:13','','0'),('f3ee9c9fe5b948f0be57ceb0ffbd3082','da445992999a4a13b749a7cc00ed4b7d','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,','æ£€æŸ¥éƒ¨é—¨','9','/wshbj/examinationDept/list','','','1','wshbj:examinationDept:view','1','2018-03-11 15:58:06','1','2018-03-11 15:58:06','','0'),('f4780696ac6f4ac48122dec79e9ce519','9032a8d00f7d42b197f5a7a47b6830dd','0,1,c6f7ff36458f417f855ed1f523f84c83,9032a8d00f7d42b197f5a7a47b6830dd,','é¡¹ç›®ç±»å‹','3','/wshbj/examinationItemType/listByCenter','','','1','wshbj:examinationItemType:viewByCenter','1','2018-03-10 10:59:54','1','2018-03-11 15:11:18','','0'),('f483df5f2eb649e1a355d8b99d38bfdb','3c92c17886944d0687e73e286cada573','0,1,79,3c92c17886944d0687e73e286cada573,','æµ‹è¯•1','80','/test1/test1','','','1','test1:test1:view,test1:test1:edit','1','2018-03-03 00:51:50','1','2018-03-03 01:33:34','','1'),('f9219c50dd1c40d2a50f47cd7274dfb2','f3ee9c9fe5b948f0be57ceb0ffbd3082','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,f3ee9c9fe5b948f0be57ceb0ffbd3082,','æŸ¥çœ‹','1','','','','0','wshbj:examinationDept:view','1','2018-03-11 15:58:23','1','2018-03-11 15:58:23','','0'),('fa8240e7b03b4f0993ab73c048e2cfbe','da445992999a4a13b749a7cc00ed4b7d','0,1,19b0ae33a47e437196b41b664c95a34d,da445992999a4a13b749a7cc00ed4b7d,','é¡¹ç›®åˆ†é…','10','/wshbj/examinationItem/assigning','','','1','wshbj:examinationItem:assigning','1','2018-03-20 19:26:51','1','2018-03-20 19:26:51','','0');

/*Table structure for table `sys_office` */

DROP TABLE IF EXISTS `sys_office`;

CREATE TABLE `sys_office` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `parent_id` varchar(64) NOT NULL COMMENT 'çˆ¶çº§ç¼–å·',
  `parent_ids` varchar(2000) NOT NULL COMMENT 'æ‰€æœ‰çˆ¶çº§ç¼–å·',
  `name` varchar(100) NOT NULL COMMENT 'åç§°',
  `sort` decimal(10,0) NOT NULL COMMENT 'æ’åº',
  `area_id` varchar(64) NOT NULL COMMENT 'å½’å±åŒºåŸŸ',
  `code` varchar(100) DEFAULT NULL COMMENT 'åŒºåŸŸç¼–ç ',
  `type` char(1) NOT NULL COMMENT 'æœºæ„ç±»å‹',
  `grade` char(1) NOT NULL COMMENT 'æœºæ„ç­‰çº§',
  `address` varchar(255) DEFAULT NULL COMMENT 'è”ç³»åœ°å€',
  `zip_code` varchar(100) DEFAULT NULL COMMENT 'é‚®æ”¿ç¼–ç ',
  `master` varchar(100) DEFAULT NULL COMMENT 'è´Ÿè´£äºº',
  `phone` varchar(200) DEFAULT NULL COMMENT 'ç”µè¯',
  `fax` varchar(200) DEFAULT NULL COMMENT 'ä¼ çœŸ',
  `email` varchar(200) DEFAULT NULL COMMENT 'é‚®ç®±',
  `USEABLE` varchar(64) DEFAULT NULL COMMENT 'æ˜¯å¦å¯ç”¨',
  `PRIMARY_PERSON` varchar(64) DEFAULT NULL COMMENT 'ä¸»è´Ÿè´£äºº',
  `DEPUTY_PERSON` varchar(64) DEFAULT NULL COMMENT 'å‰¯è´Ÿè´£äºº',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `default_record` char(1) NOT NULL DEFAULT '0' COMMENT 'æ˜¯å¦ç¼ºçœè®°å½•',
  PRIMARY KEY (`id`),
  KEY `sys_office_parent_id` (`parent_id`),
  KEY `sys_office_del_flag` (`del_flag`),
  KEY `sys_office_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æœºæ„è¡¨';

/*Data for the table `sys_office` */

insert  into `sys_office`(`id`,`parent_id`,`parent_ids`,`name`,`sort`,`area_id`,`code`,`type`,`grade`,`address`,`zip_code`,`master`,`phone`,`fax`,`email`,`USEABLE`,`PRIMARY_PERSON`,`DEPUTY_PERSON`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`,`default_record`) values ('22cdf43b3cf64706923b2bdc7bdd32ba','2fc3fe35040548bfa17281fe0e504fe7','0,2fc3fe35040548bfa17281fe0e504fe7,','ä½“æ£€ä¸­å¿ƒ','30','ff194b1d2f404810a45001f836a6348d','002','1','2','','','','','','','1','','','1','2018-03-07 17:12:07','1','2018-03-07 17:15:20','','0','1'),('2fc3fe35040548bfa17281fe0e504fe7','0','0,','å«ç”Ÿä¿å¥ç®¡ç†ç³»ç»Ÿ','30','8cc21c3cd6564faca50bafb92424926b','','1','1','','','','','','','1','','','1','2018-03-07 17:09:51','1','2018-03-07 17:13:56','','0','1'),('3df93034ae954ec8b0df054c33a1c561','f2d694c5e8544169a129a5354c8d4a7a','0,2fc3fe35040548bfa17281fe0e504fe7,22cdf43b3cf64706923b2bdc7bdd32ba,f2d694c5e8544169a129a5354c8d4a7a,','ä½“æ£€éƒ¨','30','ff194b1d2f404810a45001f836a6348d','002001001','2','2','','','','','','','1','','','1','2018-03-07 17:20:09','1','2018-03-07 17:20:09','','0','0'),('f2d694c5e8544169a129a5354c8d4a7a','22cdf43b3cf64706923b2bdc7bdd32ba','0,2fc3fe35040548bfa17281fe0e504fe7,22cdf43b3cf64706923b2bdc7bdd32ba,','é•¿åŸä½“æ£€ä¸­å¿ƒ','30','ff194b1d2f404810a45001f836a6348d','002001','1','3','','','','','','','1','','','1','2018-03-07 17:13:02','1','2018-03-07 17:13:02','','0','0');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `office_id` varchar(64) DEFAULT NULL COMMENT 'å½’å±æœºæ„',
  `name` varchar(100) NOT NULL COMMENT 'è§’è‰²åç§°',
  `enname` varchar(255) DEFAULT NULL COMMENT 'è‹±æ–‡åç§°',
  `role_type` varchar(255) DEFAULT NULL COMMENT 'è§’è‰²ç±»å‹',
  `data_scope` char(1) DEFAULT NULL COMMENT 'æ•°æ®èŒƒå›´',
  `is_sys` varchar(64) DEFAULT NULL COMMENT 'æ˜¯å¦ç³»ç»Ÿæ•°æ®',
  `useable` varchar(64) DEFAULT NULL COMMENT 'æ˜¯å¦å¯ç”¨',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `sys_role_del_flag` (`del_flag`),
  KEY `sys_role_enname` (`enname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è§’è‰²è¡¨';

/*Data for the table `sys_role` */

insert  into `sys_role`(`id`,`office_id`,`name`,`enname`,`role_type`,`data_scope`,`is_sys`,`useable`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('7cb57c34857a4b79a632bcb986af9c43','f2d694c5e8544169a129a5354c8d4a7a','æŠ¤å£«','nurse','user','8','0','1','1','2018-03-22 18:42:25','1','2018-03-22 19:54:04','','0'),('911ede1fedd74dcaada1dc9b0ceef051','f2d694c5e8544169a129a5354c8d4a7a','è¿è¥ç®¡ç†å‘˜','yyadmin','assignment','8','1','1','1','2018-03-07 17:23:54','1','2018-04-18 12:28:03','','0'),('f624ff7878b34fbe8645afdaf9cb8133','f2d694c5e8544169a129a5354c8d4a7a','ä½“æ£€ä¸­å¿ƒäººå‘˜','tjzxry','assignment','8','1','1','1','2018-03-07 17:25:26','1','2018-04-01 10:21:28','','0');

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `role_id` varchar(64) NOT NULL COMMENT 'è§’è‰²ç¼–å·',
  `menu_id` varchar(64) NOT NULL COMMENT 'èœå•ç¼–å·',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è§’è‰²-èœå•';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`role_id`,`menu_id`) values ('1','1'),('1','10'),('1','11'),('1','12'),('1','13'),('1','14'),('1','15'),('1','16'),('1','17'),('1','18'),('1','19'),('1','2'),('1','20'),('1','21'),('1','22'),('1','23'),('1','24'),('1','27'),('1','28'),('1','29'),('1','3'),('1','30'),('1','31'),('1','32'),('1','33'),('1','34'),('1','35'),('1','36'),('1','37'),('1','38'),('1','39'),('1','4'),('1','40'),('1','41'),('1','42'),('1','43'),('1','44'),('1','45'),('1','46'),('1','47'),('1','48'),('1','49'),('1','5'),('1','50'),('1','51'),('1','52'),('1','53'),('1','54'),('1','55'),('1','56'),('1','57'),('1','58'),('1','59'),('1','6'),('1','60'),('1','61'),('1','62'),('1','63'),('1','64'),('1','65'),('1','66'),('1','67'),('1','68'),('1','69'),('1','7'),('1','70'),('1','71'),('1','72'),('1','73'),('1','74'),('1','79'),('1','8'),('1','80'),('1','81'),('1','82'),('1','84'),('1','85'),('1','88'),('1','89'),('1','9'),('1','90'),('2','1'),('2','10'),('2','11'),('2','12'),('2','13'),('2','14'),('2','15'),('2','16'),('2','17'),('2','18'),('2','19'),('2','2'),('2','20'),('2','21'),('2','22'),('2','23'),('2','24'),('2','25'),('2','26'),('2','27'),('2','28'),('2','29'),('2','3'),('2','30'),('2','31'),('2','32'),('2','33'),('2','34'),('2','35'),('2','36'),('2','37'),('2','38'),('2','39'),('2','4'),('2','40'),('2','41'),('2','42'),('2','43'),('2','44'),('2','45'),('2','46'),('2','47'),('2','48'),('2','49'),('2','5'),('2','50'),('2','51'),('2','52'),('2','53'),('2','54'),('2','55'),('2','56'),('2','57'),('2','58'),('2','59'),('2','6'),('2','60'),('2','61'),('2','62'),('2','63'),('2','64'),('2','65'),('2','66'),('2','67'),('2','68'),('2','69'),('2','7'),('2','70'),('2','71'),('2','72'),('2','73'),('2','74'),('2','75'),('2','76'),('2','77'),('2','78'),('2','79'),('2','8'),('2','80'),('2','81'),('2','82'),('2','83'),('2','84'),('2','85'),('2','86'),('2','87'),('2','88'),('2','89'),('2','9'),('2','90'),('3','1'),('3','10'),('3','11'),('3','12'),('3','13'),('3','14'),('3','15'),('3','16'),('3','17'),('3','18'),('3','19'),('3','2'),('3','20'),('3','21'),('3','22'),('3','23'),('3','24'),('3','25'),('3','26'),('3','27'),('3','28'),('3','29'),('3','3'),('3','30'),('3','31'),('3','32'),('3','33'),('3','34'),('3','35'),('3','36'),('3','37'),('3','38'),('3','39'),('3','4'),('3','40'),('3','41'),('3','42'),('3','43'),('3','44'),('3','45'),('3','46'),('3','47'),('3','48'),('3','49'),('3','5'),('3','50'),('3','51'),('3','52'),('3','53'),('3','54'),('3','55'),('3','56'),('3','57'),('3','58'),('3','59'),('3','6'),('3','60'),('3','61'),('3','62'),('3','63'),('3','64'),('3','65'),('3','66'),('3','67'),('3','68'),('3','69'),('3','7'),('3','70'),('3','71'),('3','72'),('3','73'),('3','74'),('3','75'),('3','76'),('3','77'),('3','78'),('3','79'),('3','8'),('3','80'),('3','81'),('3','82'),('3','83'),('3','84'),('3','85'),('3','86'),('3','87'),('3','88'),('3','89'),('3','9'),('3','90'),('7cb57c34857a4b79a632bcb986af9c43','053d3ddee6f048f69a3e8b73b41787a5'),('7cb57c34857a4b79a632bcb986af9c43','1'),('7cb57c34857a4b79a632bcb986af9c43','19b0ae33a47e437196b41b664c95a34d'),('7cb57c34857a4b79a632bcb986af9c43','1efc52de37db406ba9be7dd3f06859b7'),('7cb57c34857a4b79a632bcb986af9c43','264ea3ea128d4be294c44b94a98a41b9'),('7cb57c34857a4b79a632bcb986af9c43','27'),('7cb57c34857a4b79a632bcb986af9c43','28'),('7cb57c34857a4b79a632bcb986af9c43','29'),('7cb57c34857a4b79a632bcb986af9c43','29d5c1f1f6904bdb9ee44a3c439a13f5'),('7cb57c34857a4b79a632bcb986af9c43','2c12a52a000841968083929aead0fe50'),('7cb57c34857a4b79a632bcb986af9c43','30'),('7cb57c34857a4b79a632bcb986af9c43','30919dfb6532461d9e982662bdb9fabc'),('7cb57c34857a4b79a632bcb986af9c43','3b49c381c07641f7a249a5d31bca19b8'),('7cb57c34857a4b79a632bcb986af9c43','429e899b63fa4a9896544a3b3e5a7c43'),('7cb57c34857a4b79a632bcb986af9c43','52127cbc635144d393530ea86e0d9b3b'),('7cb57c34857a4b79a632bcb986af9c43','55fc8176b2f74ee1a9bd8112ea93ba75'),('7cb57c34857a4b79a632bcb986af9c43','574a258f0ffc435faaaa557bcb421490'),('7cb57c34857a4b79a632bcb986af9c43','586f7fa09f424462b65c02274fabef53'),('7cb57c34857a4b79a632bcb986af9c43','639f401e930a4cdfa4d863818297e817'),('7cb57c34857a4b79a632bcb986af9c43','72e0fea5017a409d80094df9e82c66a2'),('7cb57c34857a4b79a632bcb986af9c43','7b4af83064964e2e9bf6f4f1232b6d04'),('7cb57c34857a4b79a632bcb986af9c43','7f002e5edc524aa19a3bb3cabf0c1a17'),('7cb57c34857a4b79a632bcb986af9c43','83ca127bffa14dd09b72fd0428cfe748'),('7cb57c34857a4b79a632bcb986af9c43','860c8008a2ac44b990f8695278537a35'),('7cb57c34857a4b79a632bcb986af9c43','8b1e81ede9744ca29271e21bc7b9a300'),('7cb57c34857a4b79a632bcb986af9c43','9301ade5de3143d798a0bc77f4e731c5'),('7cb57c34857a4b79a632bcb986af9c43','94a46fdc598a48f78f726bcb5a55ab90'),('7cb57c34857a4b79a632bcb986af9c43','9ab09ab112b642bdaf68996b366449e0'),('7cb57c34857a4b79a632bcb986af9c43','a1ad8e2c138a45679274b0983de5f8b5'),('7cb57c34857a4b79a632bcb986af9c43','a1e776ccaa8445b4bc488d5f07fa7f89'),('7cb57c34857a4b79a632bcb986af9c43','a707f252e00749f7ae613e0eef24a6dd'),('7cb57c34857a4b79a632bcb986af9c43','a922363504e84b1783a4dbedd5ee4885'),('7cb57c34857a4b79a632bcb986af9c43','b25a79da91ab4698a92a94920abbb06b'),('7cb57c34857a4b79a632bcb986af9c43','ba15c2232943412dae72e1758a78c68b'),('7cb57c34857a4b79a632bcb986af9c43','bc3665202c5140f7a5703b1272b4c5cd'),('7cb57c34857a4b79a632bcb986af9c43','c2c2be8854454a52892ea2315ce6146c'),('7cb57c34857a4b79a632bcb986af9c43','c2fd2e0661e94db8b3713f1eb445d71f'),('7cb57c34857a4b79a632bcb986af9c43','c9f1ca975a0e46e4ab2b9b6f007199e9'),('7cb57c34857a4b79a632bcb986af9c43','ca6f2c5432294cb28b8c9fd8d26558c5'),('7cb57c34857a4b79a632bcb986af9c43','d799ec8d21fd491e8c07df78005c4f27'),('7cb57c34857a4b79a632bcb986af9c43','da445992999a4a13b749a7cc00ed4b7d'),('7cb57c34857a4b79a632bcb986af9c43','deedabfad028491db224ac83cbeffa66'),('7cb57c34857a4b79a632bcb986af9c43','df794afd30504b97bcaaff5e5fb27adb'),('7cb57c34857a4b79a632bcb986af9c43','e18d31899efa41059d5b15e34b2a2cd0'),('7cb57c34857a4b79a632bcb986af9c43','e1f432af20e3476696937361afcd540e'),('7cb57c34857a4b79a632bcb986af9c43','e5bcc15b76f8477195762c7248cc04aa'),('7cb57c34857a4b79a632bcb986af9c43','ed70f9bf857444ffaa24346217ac761f'),('7cb57c34857a4b79a632bcb986af9c43','f1ef203de0b54cf3a7f3637f5eaf482c'),('7cb57c34857a4b79a632bcb986af9c43','f3ee9c9fe5b948f0be57ceb0ffbd3082'),('7cb57c34857a4b79a632bcb986af9c43','f9219c50dd1c40d2a50f47cd7274dfb2'),('7cb57c34857a4b79a632bcb986af9c43','fa8240e7b03b4f0993ab73c048e2cfbe'),('911ede1fedd74dcaada1dc9b0ceef051','1'),('911ede1fedd74dcaada1dc9b0ceef051','13'),('911ede1fedd74dcaada1dc9b0ceef051','13549f076c454f92baaeac590b118990'),('911ede1fedd74dcaada1dc9b0ceef051','14'),('911ede1fedd74dcaada1dc9b0ceef051','15'),('911ede1fedd74dcaada1dc9b0ceef051','16'),('911ede1fedd74dcaada1dc9b0ceef051','17'),('911ede1fedd74dcaada1dc9b0ceef051','18'),('911ede1fedd74dcaada1dc9b0ceef051','19'),('911ede1fedd74dcaada1dc9b0ceef051','2'),('911ede1fedd74dcaada1dc9b0ceef051','20'),('911ede1fedd74dcaada1dc9b0ceef051','21'),('911ede1fedd74dcaada1dc9b0ceef051','2115345503a44f02b2e6a4032faa910e'),('911ede1fedd74dcaada1dc9b0ceef051','22'),('911ede1fedd74dcaada1dc9b0ceef051','2497901541794f699d496773d8397d1a'),('911ede1fedd74dcaada1dc9b0ceef051','27'),('911ede1fedd74dcaada1dc9b0ceef051','28'),('911ede1fedd74dcaada1dc9b0ceef051','29'),('911ede1fedd74dcaada1dc9b0ceef051','29c75b07c3454e489be6a62a76ec1094'),('911ede1fedd74dcaada1dc9b0ceef051','2b1c4c7103204d57bc540f0a1e9ba0f5'),('911ede1fedd74dcaada1dc9b0ceef051','30'),('911ede1fedd74dcaada1dc9b0ceef051','31'),('911ede1fedd74dcaada1dc9b0ceef051','32'),('911ede1fedd74dcaada1dc9b0ceef051','33'),('911ede1fedd74dcaada1dc9b0ceef051','34'),('911ede1fedd74dcaada1dc9b0ceef051','35'),('911ede1fedd74dcaada1dc9b0ceef051','36'),('911ede1fedd74dcaada1dc9b0ceef051','37'),('911ede1fedd74dcaada1dc9b0ceef051','38'),('911ede1fedd74dcaada1dc9b0ceef051','39'),('911ede1fedd74dcaada1dc9b0ceef051','40'),('911ede1fedd74dcaada1dc9b0ceef051','41'),('911ede1fedd74dcaada1dc9b0ceef051','42'),('911ede1fedd74dcaada1dc9b0ceef051','43'),('911ede1fedd74dcaada1dc9b0ceef051','44'),('911ede1fedd74dcaada1dc9b0ceef051','45'),('911ede1fedd74dcaada1dc9b0ceef051','46'),('911ede1fedd74dcaada1dc9b0ceef051','46205ec931f44dbb8dda804b05284e3d'),('911ede1fedd74dcaada1dc9b0ceef051','47'),('911ede1fedd74dcaada1dc9b0ceef051','48'),('911ede1fedd74dcaada1dc9b0ceef051','49'),('911ede1fedd74dcaada1dc9b0ceef051','50'),('911ede1fedd74dcaada1dc9b0ceef051','51'),('911ede1fedd74dcaada1dc9b0ceef051','52'),('911ede1fedd74dcaada1dc9b0ceef051','53'),('911ede1fedd74dcaada1dc9b0ceef051','54'),('911ede1fedd74dcaada1dc9b0ceef051','55'),('911ede1fedd74dcaada1dc9b0ceef051','56'),('911ede1fedd74dcaada1dc9b0ceef051','57'),('911ede1fedd74dcaada1dc9b0ceef051','57e4a401ceca4b7a923494ac93d0c558'),('911ede1fedd74dcaada1dc9b0ceef051','58'),('911ede1fedd74dcaada1dc9b0ceef051','59'),('911ede1fedd74dcaada1dc9b0ceef051','5bf62f84f476436bb901a6aa5f5a717b'),('911ede1fedd74dcaada1dc9b0ceef051','5c79380c225b41368264552635e3cbcb'),('911ede1fedd74dcaada1dc9b0ceef051','60'),('911ede1fedd74dcaada1dc9b0ceef051','61'),('911ede1fedd74dcaada1dc9b0ceef051','62'),('911ede1fedd74dcaada1dc9b0ceef051','63'),('911ede1fedd74dcaada1dc9b0ceef051','64'),('911ede1fedd74dcaada1dc9b0ceef051','65'),('911ede1fedd74dcaada1dc9b0ceef051','65db10286d984e22828e0e2d09f25e8d'),('911ede1fedd74dcaada1dc9b0ceef051','66'),('911ede1fedd74dcaada1dc9b0ceef051','69'),('911ede1fedd74dcaada1dc9b0ceef051','70'),('911ede1fedd74dcaada1dc9b0ceef051','71'),('911ede1fedd74dcaada1dc9b0ceef051','72'),('911ede1fedd74dcaada1dc9b0ceef051','73'),('911ede1fedd74dcaada1dc9b0ceef051','74'),('911ede1fedd74dcaada1dc9b0ceef051','7e6aa5d1f2db491085183115922e67ee'),('911ede1fedd74dcaada1dc9b0ceef051','7fa72032991e45bab16053c5f6bf15b1'),('911ede1fedd74dcaada1dc9b0ceef051','800fd80a27aa4505ba8df8951aa7866b'),('911ede1fedd74dcaada1dc9b0ceef051','88'),('911ede1fedd74dcaada1dc9b0ceef051','89'),('911ede1fedd74dcaada1dc9b0ceef051','8d29454fbb4f4c04b8ae00b052d8a2e3'),('911ede1fedd74dcaada1dc9b0ceef051','90'),('911ede1fedd74dcaada1dc9b0ceef051','9032a8d00f7d42b197f5a7a47b6830dd'),('911ede1fedd74dcaada1dc9b0ceef051','927d6756e2974c58ade07742b74b05a1'),('911ede1fedd74dcaada1dc9b0ceef051','96c3d73e685b483fa82b11ca0cfffc22'),('911ede1fedd74dcaada1dc9b0ceef051','98c867d6168948be877d1694836f15e5'),('911ede1fedd74dcaada1dc9b0ceef051','a08a70b711d84470bde6b408af118467'),('911ede1fedd74dcaada1dc9b0ceef051','a299f4c8d9b24b2d9e37819d08be8492'),('911ede1fedd74dcaada1dc9b0ceef051','a2cae1b7dbfa4336af96ec6409d02b12'),('911ede1fedd74dcaada1dc9b0ceef051','abc0a0f01041452f9c233b5fd3d835dd'),('911ede1fedd74dcaada1dc9b0ceef051','af9ad6cfe1e741e3a68632cc2e8c359b'),('911ede1fedd74dcaada1dc9b0ceef051','bc017b79d82c40bebaa825bd486a0143'),('911ede1fedd74dcaada1dc9b0ceef051','c6f7ff36458f417f855ed1f523f84c83'),('911ede1fedd74dcaada1dc9b0ceef051','d9017557f5204f1b89c477cc1ac86214'),('911ede1fedd74dcaada1dc9b0ceef051','dc717662e50c48479f8f8bb1a4650f07'),('911ede1fedd74dcaada1dc9b0ceef051','df5844e85fb64ba3b16851fe062b443b'),('911ede1fedd74dcaada1dc9b0ceef051','eaf34e221ac44d6f87dda25f5d2976d1'),('911ede1fedd74dcaada1dc9b0ceef051','f4780696ac6f4ac48122dec79e9ce519'),('f624ff7878b34fbe8645afdaf9cb8133','053d3ddee6f048f69a3e8b73b41787a5'),('f624ff7878b34fbe8645afdaf9cb8133','0c59995d6e91463db215118bca49a1c9'),('f624ff7878b34fbe8645afdaf9cb8133','1'),('f624ff7878b34fbe8645afdaf9cb8133','1603769af8384a84897a412a529d7934'),('f624ff7878b34fbe8645afdaf9cb8133','19b0ae33a47e437196b41b664c95a34d'),('f624ff7878b34fbe8645afdaf9cb8133','1efc52de37db406ba9be7dd3f06859b7'),('f624ff7878b34fbe8645afdaf9cb8133','264ea3ea128d4be294c44b94a98a41b9'),('f624ff7878b34fbe8645afdaf9cb8133','27'),('f624ff7878b34fbe8645afdaf9cb8133','28'),('f624ff7878b34fbe8645afdaf9cb8133','29'),('f624ff7878b34fbe8645afdaf9cb8133','29d5c1f1f6904bdb9ee44a3c439a13f5'),('f624ff7878b34fbe8645afdaf9cb8133','2c12a52a000841968083929aead0fe50'),('f624ff7878b34fbe8645afdaf9cb8133','2d890d8458e24bb9a753da8c36c42c08'),('f624ff7878b34fbe8645afdaf9cb8133','30'),('f624ff7878b34fbe8645afdaf9cb8133','30919dfb6532461d9e982662bdb9fabc'),('f624ff7878b34fbe8645afdaf9cb8133','31'),('f624ff7878b34fbe8645afdaf9cb8133','3b49c381c07641f7a249a5d31bca19b8'),('f624ff7878b34fbe8645afdaf9cb8133','40'),('f624ff7878b34fbe8645afdaf9cb8133','41'),('f624ff7878b34fbe8645afdaf9cb8133','42'),('f624ff7878b34fbe8645afdaf9cb8133','429e899b63fa4a9896544a3b3e5a7c43'),('f624ff7878b34fbe8645afdaf9cb8133','43'),('f624ff7878b34fbe8645afdaf9cb8133','48b5f7ff7ce44a519d2185fb8b1a92b1'),('f624ff7878b34fbe8645afdaf9cb8133','4c454c20042542cebe3cee0a6279c4b8'),('f624ff7878b34fbe8645afdaf9cb8133','50'),('f624ff7878b34fbe8645afdaf9cb8133','51'),('f624ff7878b34fbe8645afdaf9cb8133','52127cbc635144d393530ea86e0d9b3b'),('f624ff7878b34fbe8645afdaf9cb8133','53'),('f624ff7878b34fbe8645afdaf9cb8133','54'),('f624ff7878b34fbe8645afdaf9cb8133','55fc8176b2f74ee1a9bd8112ea93ba75'),('f624ff7878b34fbe8645afdaf9cb8133','56'),('f624ff7878b34fbe8645afdaf9cb8133','57'),('f624ff7878b34fbe8645afdaf9cb8133','574a258f0ffc435faaaa557bcb421490'),('f624ff7878b34fbe8645afdaf9cb8133','58'),('f624ff7878b34fbe8645afdaf9cb8133','586f7fa09f424462b65c02274fabef53'),('f624ff7878b34fbe8645afdaf9cb8133','59'),('f624ff7878b34fbe8645afdaf9cb8133','62'),('f624ff7878b34fbe8645afdaf9cb8133','63'),('f624ff7878b34fbe8645afdaf9cb8133','639f401e930a4cdfa4d863818297e817'),('f624ff7878b34fbe8645afdaf9cb8133','64'),('f624ff7878b34fbe8645afdaf9cb8133','65'),('f624ff7878b34fbe8645afdaf9cb8133','66'),('f624ff7878b34fbe8645afdaf9cb8133','71'),('f624ff7878b34fbe8645afdaf9cb8133','72e0fea5017a409d80094df9e82c66a2'),('f624ff7878b34fbe8645afdaf9cb8133','73'),('f624ff7878b34fbe8645afdaf9cb8133','7b4af83064964e2e9bf6f4f1232b6d04'),('f624ff7878b34fbe8645afdaf9cb8133','7f002e5edc524aa19a3bb3cabf0c1a17'),('f624ff7878b34fbe8645afdaf9cb8133','83ca127bffa14dd09b72fd0428cfe748'),('f624ff7878b34fbe8645afdaf9cb8133','860c8008a2ac44b990f8695278537a35'),('f624ff7878b34fbe8645afdaf9cb8133','88'),('f624ff7878b34fbe8645afdaf9cb8133','89'),('f624ff7878b34fbe8645afdaf9cb8133','8b1e81ede9744ca29271e21bc7b9a300'),('f624ff7878b34fbe8645afdaf9cb8133','9301ade5de3143d798a0bc77f4e731c5'),('f624ff7878b34fbe8645afdaf9cb8133','94a46fdc598a48f78f726bcb5a55ab90'),('f624ff7878b34fbe8645afdaf9cb8133','9ab09ab112b642bdaf68996b366449e0'),('f624ff7878b34fbe8645afdaf9cb8133','a1ad8e2c138a45679274b0983de5f8b5'),('f624ff7878b34fbe8645afdaf9cb8133','a1e776ccaa8445b4bc488d5f07fa7f89'),('f624ff7878b34fbe8645afdaf9cb8133','a707f252e00749f7ae613e0eef24a6dd'),('f624ff7878b34fbe8645afdaf9cb8133','a922363504e84b1783a4dbedd5ee4885'),('f624ff7878b34fbe8645afdaf9cb8133','b25a79da91ab4698a92a94920abbb06b'),('f624ff7878b34fbe8645afdaf9cb8133','b90dae451d4341f09e6e5493a8df017c'),('f624ff7878b34fbe8645afdaf9cb8133','ba15c2232943412dae72e1758a78c68b'),('f624ff7878b34fbe8645afdaf9cb8133','bc3665202c5140f7a5703b1272b4c5cd'),('f624ff7878b34fbe8645afdaf9cb8133','c2c2be8854454a52892ea2315ce6146c'),('f624ff7878b34fbe8645afdaf9cb8133','c2fd2e0661e94db8b3713f1eb445d71f'),('f624ff7878b34fbe8645afdaf9cb8133','c9f1ca975a0e46e4ab2b9b6f007199e9'),('f624ff7878b34fbe8645afdaf9cb8133','ca6f2c5432294cb28b8c9fd8d26558c5'),('f624ff7878b34fbe8645afdaf9cb8133','d799ec8d21fd491e8c07df78005c4f27'),('f624ff7878b34fbe8645afdaf9cb8133','da445992999a4a13b749a7cc00ed4b7d'),('f624ff7878b34fbe8645afdaf9cb8133','deedabfad028491db224ac83cbeffa66'),('f624ff7878b34fbe8645afdaf9cb8133','df794afd30504b97bcaaff5e5fb27adb'),('f624ff7878b34fbe8645afdaf9cb8133','e18d31899efa41059d5b15e34b2a2cd0'),('f624ff7878b34fbe8645afdaf9cb8133','e1f432af20e3476696937361afcd540e'),('f624ff7878b34fbe8645afdaf9cb8133','e5bcc15b76f8477195762c7248cc04aa'),('f624ff7878b34fbe8645afdaf9cb8133','ed70f9bf857444ffaa24346217ac761f'),('f624ff7878b34fbe8645afdaf9cb8133','f1ef203de0b54cf3a7f3637f5eaf482c'),('f624ff7878b34fbe8645afdaf9cb8133','f3ee9c9fe5b948f0be57ceb0ffbd3082'),('f624ff7878b34fbe8645afdaf9cb8133','f9219c50dd1c40d2a50f47cd7274dfb2'),('f624ff7878b34fbe8645afdaf9cb8133','fa8240e7b03b4f0993ab73c048e2cfbe');

/*Table structure for table `sys_role_office` */

DROP TABLE IF EXISTS `sys_role_office`;

CREATE TABLE `sys_role_office` (
  `role_id` varchar(64) NOT NULL COMMENT 'è§’è‰²ç¼–å·',
  `office_id` varchar(64) NOT NULL COMMENT 'æœºæ„ç¼–å·',
  PRIMARY KEY (`role_id`,`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è§’è‰²-æœºæ„';

/*Data for the table `sys_role_office` */

insert  into `sys_role_office`(`role_id`,`office_id`) values ('7','10'),('7','11'),('7','12'),('7','13'),('7','14'),('7','15'),('7','16'),('7','17'),('7','18'),('7','19'),('7','20'),('7','21'),('7','22'),('7','23'),('7','24'),('7','25'),('7','26'),('7','7'),('7','8'),('7','9');

/*Table structure for table `sys_sequence` */

DROP TABLE IF EXISTS `sys_sequence`;

CREATE TABLE `sys_sequence` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `express` varchar(64) NOT NULL COMMENT 'è¡¨è¾¾å¼å­—ç¬¦ä¸²',
  `seq_temp` varchar(64) NOT NULL COMMENT 'è¡¨è¾¾å¼æ¨¡æ¿,åªæ›¿æ¢æ¨¡æ¿ä¸­çš„{d6}ä¸­çš„æ–‡å­—',
  `seq_val` varchar(64) NOT NULL DEFAULT '1' COMMENT 'é¡ºåºå·',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_sequence_seq_temp` (`seq_temp`),
  KEY `sys_sequence_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='åºåˆ—è¡¨';

/*Data for the table `sys_sequence` */

insert  into `sys_sequence`(`id`,`express`,`seq_temp`,`seq_val`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('1d25739bbe834f8fbbfb79a8ecf17636','GW{yyyy}[3]','GW2018[3]','3','1','2018-04-23 01:19:57','1','2018-04-23 01:20:12',NULL,'0'),('331bbc857d7c4dacaae779893b3140e0','TJJL{yyyyMMmm}[5]','TJJL20180402[5]','2','1','2018-04-18 18:02:52','1','2018-04-18 18:02:52',NULL,'0'),('333fccd02c67402ba6b570d892272384','BBLX{yyyy}[3]','BBLX2018[3]','2','1','2018-04-23 01:20:43','1','2018-04-23 01:20:43',NULL,'0'),('33ec133874c2469ead1dae2b46d19562','XMFL{YYYY}[3]','XMFL[3]','2','1','2018-04-23 00:49:18','1','2018-04-23 00:49:18',NULL,'0'),('4ac0ad5b668f48fa8091ed44f0ddf13d','JCXM{yyyy}[4]','JCXM2018[4]','2','1','2018-04-23 01:00:35','1','2018-04-23 01:00:35',NULL,'0'),('54c1d3d4e6694002b2b26547a121ff0a','EU{yyMMdd}[4]','EU180422[4]','8','1','2018-04-22 18:25:35','1','2018-04-22 22:28:53',NULL,'0'),('5c11f3875d564a6698ec176e76ed103e','YB{yyyyMMdd}[4]','YB20180424[4]','101','1','2018-04-24 16:08:23','1','2018-04-24 16:08:24',NULL,'0'),('6b91c5c7d9ac49f6a0768f4a254fba5c','TJJL{yyyyMMmm}[5]','TJJL20180443[5]','3','1','2018-04-18 16:43:38','1','2018-04-18 16:43:48',NULL,'0'),('6c261cf0837240aa8a92f59dae274e55','10{yyyyMMdd}[4]','1020180419[4]','2','1','2018-04-19 18:18:49','1','2018-04-19 18:18:49',NULL,'0'),('7eccb8e3ffca4b48a984dadfd7219eb9','TJJL{yyyyMMmm}[5]','TJJL20180458[5]','2','1','2018-04-18 17:58:30','1','2018-04-18 17:58:30',NULL,'0'),('8fdc5faf75c5494ab171f23adde58857','21{yyyy}[4]','212018[4]','6','1','2018-04-23 00:38:15','1','2018-04-23 00:39:24',NULL,'0'),('931c7e5018c8455ab968e4c152f2bbaf','JCLB{yyyy}[3]','JCLB2018[3]','2','1','2018-04-23 00:49:04','1','2018-04-23 00:49:04',NULL,'0'),('93c74922dd5640a286bf6b9469908ada','10{yyyyMMdd}[4]','1020180428[4]','2','1','2018-04-28 08:59:59','1','2018-04-28 08:59:59',NULL,'0'),('a629355657ce469eb9a9beea3c9002f7','10{yyyyMMdd}[4]','1020180424[4]','2','1','2018-04-24 16:11:50','1','2018-04-24 16:11:50',NULL,'0'),('b9c78180969d4bd0a73419de7d11aa77','YB{yyyyMMdd}[4]','YB20180423[4]','101','1','2018-04-23 16:11:26','1','2018-04-23 16:11:26',NULL,'0'),('baa9c288baf940a1bf2d060058b2823b','EC{yyyy}[4]','EC2018[4]','8','1','2018-04-14 14:35:59','1','2018-04-18 16:33:29',NULL,'0'),('cd7d87089fd44c15ac8dff3c48ebed34','HY{yyyy}[3]','HY2018[3]','2','1','2018-04-23 01:19:42','1','2018-04-23 01:19:42',NULL,'0'),('d0146745d7b3443c9dd8e13fa3f23fe7','{yyyyMMdd}[4]','20180420[4]','131','1','2018-04-20 18:35:01','1','2018-04-20 19:21:52',NULL,'0'),('ec320071b3264c559e4a4fc938b6bb85','10{yyyyMMdd}[4]','1020180422[4]','11','1','2018-04-22 11:44:31','1','2018-04-22 23:21:58',NULL,'0'),('f94b9f2820d44175b6f51c2abdb09ff2','10{yyyyMMdd}[4]','1020180421[4]','3','1','2018-04-21 11:25:59','1','2018-04-21 21:05:07',NULL,'0'),('fb57b209dc2049ac8c9ca0c397015392','XMLX{yyyy}[3]','XMLX2018[3]','2','1','2018-04-23 00:47:47','1','2018-04-23 00:47:47',NULL,'0'),('fd86f1f5f5ab494fad1cd2ee08129a1b','TJJL{yyyyMMmm}[5]','TJJL20180411[5]','2','1','2018-04-18 18:11:24','1','2018-04-18 18:11:24',NULL,'0');

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `company_id` varchar(64) NOT NULL COMMENT 'å½’å±å…¬å¸',
  `office_id` varchar(64) NOT NULL COMMENT 'å½’å±éƒ¨é—¨',
  `login_name` varchar(100) NOT NULL COMMENT 'ç™»å½•å',
  `password` varchar(100) NOT NULL COMMENT 'å¯†ç ',
  `no` varchar(100) DEFAULT NULL COMMENT 'å·¥å·',
  `name` varchar(100) NOT NULL COMMENT 'å§“å',
  `email` varchar(200) DEFAULT NULL COMMENT 'é‚®ç®±',
  `phone` varchar(200) DEFAULT NULL COMMENT 'ç”µè¯',
  `mobile` varchar(200) DEFAULT NULL COMMENT 'æ‰‹æœº',
  `user_type` char(1) DEFAULT NULL COMMENT 'ç”¨æˆ·ç±»å‹',
  `photo` varchar(1000) DEFAULT NULL COMMENT 'ç”¨æˆ·å¤´åƒ',
  `login_ip` varchar(100) DEFAULT NULL COMMENT 'æœ€åç™»é™†IP',
  `login_date` datetime DEFAULT NULL COMMENT 'æœ€åç™»é™†æ—¶é—´',
  `login_flag` varchar(64) DEFAULT NULL COMMENT 'æ˜¯å¦å¯ç™»å½•',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  `default_record` char(1) NOT NULL DEFAULT '0' COMMENT 'é»˜è®¤è®°å½•ï¼Œä¸å…è®¸åˆ é™¤',
  PRIMARY KEY (`id`),
  KEY `sys_user_office_id` (`office_id`),
  KEY `sys_user_login_name` (`login_name`),
  KEY `sys_user_company_id` (`company_id`),
  KEY `sys_user_update_date` (`update_date`),
  KEY `sys_user_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ç”¨æˆ·è¡¨';

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`company_id`,`office_id`,`login_name`,`password`,`no`,`name`,`email`,`phone`,`mobile`,`user_type`,`photo`,`login_ip`,`login_date`,`login_flag`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`,`default_record`) values ('1','f2d694c5e8544169a129a5354c8d4a7a','3df93034ae954ec8b0df054c33a1c561','thinkgem','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0001','ç³»ç»Ÿç®¡ç†å‘˜','thinkgem@163.com','8675','8675','','/jeesite/userfiles/1/images/photo/2018/03/_DSC0026.JPG','27.184.64.37','2018-04-28 08:52:39','1','1','2013-05-27 08:00:00','1','2018-04-18 11:58:34','æœ€é«˜ç®¡ç†å‘˜','0','1'),('92e9531b7c5d4fa2b13997b98d601000','f2d694c5e8544169a129a5354c8d4a7a','3df93034ae954ec8b0df054c33a1c561','yyadmin','8540c6f1e3859161e5e849704228cd6e6d9a0f40d93086512291d2dc','0001','è¿è¥ç®¡ç†å‘˜','','','','','','0:0:0:0:0:0:0:1','2018-04-14 17:56:25','1','1','2018-03-07 17:22:17','1','2018-04-18 11:58:13','è€é’±','0','0'),('dbd1c02859f8434aad548bbd09cd74b5','f2d694c5e8544169a129a5354c8d4a7a','3df93034ae954ec8b0df054c33a1c561','tjy1','c3d7d6d82d83a3037df6c38474ed4145c45913120db5150d9e4b167f','0001','ä½“æ£€å‘˜1','','','','','','0:0:0:0:0:0:0:1','2018-04-21 10:03:00','1','1','2018-03-07 17:26:51','1','2018-03-07 17:26:51','å­™å­','0','0');

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` varchar(64) NOT NULL COMMENT 'ç”¨æˆ·ç¼–å·',
  `role_id` varchar(64) NOT NULL COMMENT 'è§’è‰²ç¼–å·',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ç”¨æˆ·-è§’è‰²';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`user_id`,`role_id`) values ('1','911ede1fedd74dcaada1dc9b0ceef051'),('10','2'),('11','3'),('12','4'),('13','5'),('14','6'),('2','1'),('3','2'),('4','3'),('5','4'),('6','5'),('7','2'),('7','7'),('8','2'),('9','1'),('92e9531b7c5d4fa2b13997b98d601000','911ede1fedd74dcaada1dc9b0ceef051'),('dbd1c02859f8434aad548bbd09cd74b5','f624ff7878b34fbe8645afdaf9cb8133');

/*Table structure for table `test1` */

DROP TABLE IF EXISTS `test1`;

CREATE TABLE `test1` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `title` varchar(128) DEFAULT NULL COMMENT 'æ ‡é¢˜',
  `content` varchar(20000) DEFAULT NULL COMMENT 'å†…å®¹',
  `auth_id` varchar(64) NOT NULL,
  `auth_name` varchar(64) DEFAULT NULL COMMENT 'ä½œè€…',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `test_data_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æµ‹è¯•è¡¨1';

/*Data for the table `test1` */

insert  into `test1`(`id`,`title`,`content`,`auth_id`,`auth_name`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('0ef88801e7e34328b06554d26e9ffeb5','æ ‡é¢˜1 æ ‡é¢˜2','&lt;p&gt;\r\n	Swagger æ˜¯ä¸€ç³»åˆ—å¯¹ RESTful æ¥å£è¿›è¡Œè§„èŒƒæè¿°å’Œé¡µé¢å±•ç¤ºçš„å·¥å…·. é€šè¿‡ springfox-swagger å°† Swagger ä¸ Spring-MVC æ•´åˆ, å¯ä»ä»£ç ä¸­çš„æ³¨è§£è·å–ä¿¡æ¯, å¹¶ç”Ÿæˆç›¸åº”çš„æ–‡æ¡£. æ•ˆæœå¦‚ä¸‹æ‰€ç¤º.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&amp;nbsp;&lt;img alt=&quot;&quot; src=&quot;/jeesite/userfiles/1/images/test1/2018/03/_DSC0008.JPG&quot; style=&quot;width: 1024px; height: 683px;&quot; /&gt;&lt;br /&gt;\r\n	ç›®å‰ Swagger çš„ api ç‰ˆæœ¬è§„èŒƒå·²ç»æ›´æ–°åˆ° 2.0 ç‰ˆæœ¬, ä¸­æ–‡ç½‘ç»œä¸ŠåŸºæœ¬ä¸Šéƒ½æ˜¯ 1.0 çš„ api ç‰ˆæœ¬è§„èŒƒçš„æ•™ç¨‹. æ£é¼“äº†ä¸€å¤©ç»ˆäºæå®šäº†, è¿™ä¸¤è€…åŒºåˆ«è¿˜æ˜¯æœ‰çš„.&lt;/p&gt;\r\n&lt;p&gt;\r\n	æ³¨: æœ¬æ–‡çš„ä»£ç è§&amp;nbsp;&lt;a href=&quot;https://github.com/Frank-Hust/SpringAndStagger&quot; target=&quot;_blank&quot;&gt;https://github.com/Frank-Hust/SpringAndStagger&lt;/a&gt;, ç›´æ¥ gitclone ä¸‹æ¥æˆ–è€…ä¸‹è½½åœ¨ IDEA ä¸­å°±èƒ½è¿è¡Œäº†.&lt;/p&gt;\r\n&lt;h2 id=&quot;å…ˆæ·»åŠ ä¾èµ–&quot;&gt;\r\n	å…ˆæ·»åŠ ä¾èµ–&lt;/h2&gt;','','å´”é¹','1','2018-03-03 01:36:08','1','2018-03-03 02:37:45','æ·±åˆ»çš„ç§¯åˆ† \r\nå¡ä¸Šçš„çº çº· äº†å‘æš—æ€çš„\r\né˜¿å£«å¤§å¤«æ’’','1'),('65d2d7e3f5ac43939666bddff54fcf09','sdfé˜¿æ–¯è’‚èŠ¬','&lt;p&gt;\r\n	Swagger æ˜¯ä¸€ç³»åˆ—å¯¹ RESTful æ¥å£è¿›è¡Œè§„èŒƒæè¿°å’Œé¡µé¢å±•ç¤ºçš„å·¥å…·. é€šè¿‡ springfox-swagger å°† Swagger ä¸ Spring-MVC æ•´åˆ, å¯ä»ä»£ç ä¸­çš„æ³¨è§£è·å–ä¿¡æ¯, å¹¶ç”Ÿæˆç›¸åº”çš„æ–‡æ¡£. æ•ˆæœå¦‚ä¸‹æ‰€ç¤º.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;img alt=&quot;è¿™é‡Œå†™å›¾ç‰‡æè¿°&quot; src=&quot;http://img.blog.csdn.net/20160929165251897&quot; title=&quot;&quot; /&gt;&amp;nbsp;&lt;br /&gt;\r\n	ç›®å‰ Swagger çš„ api ç‰ˆæœ¬è§„èŒƒå·²ç»æ›´æ–°åˆ° 2.0 ç‰ˆæœ¬, ä¸­æ–‡ç½‘ç»œä¸ŠåŸºæœ¬ä¸Šéƒ½æ˜¯ 1.0 çš„ api ç‰ˆæœ¬è§„èŒƒçš„æ•™ç¨‹. æ£é¼“äº†ä¸€å¤©ç»ˆäºæå®šäº†, è¿™ä¸¤è€…åŒºåˆ«è¿˜æ˜¯æœ‰çš„.&lt;/p&gt;\r\n&lt;p&gt;\r\n	æ³¨: æœ¬æ–‡çš„ä»£ç è§&amp;nbsp;&lt;a href=&quot;https://github.com/Frank-Hust/SpringAndStagger&quot; target=&quot;_blank&quot;&gt;https://github.com/Frank-Hust/SpringAndStagger&lt;/a&gt;, ç›´æ¥ gitclone ä¸‹æ¥æˆ–è€…ä¸‹è½½åœ¨ IDEA ä¸­å°±èƒ½è¿è¡Œäº†.&lt;/p&gt;\r\n&lt;h2 id=&quot;å…ˆæ·»åŠ ä¾èµ–&quot;&gt;\r\n	&lt;a name=&quot;t0&quot; style=&quot;box-sizing: border-box; color: rgb(12, 137, 207);&quot; target=&quot;_blank&quot;&gt;&lt;/a&gt;å…ˆæ·»åŠ ä¾èµ–&lt;/h2&gt;','','é˜¿è¨å¾·','1','2018-03-03 02:09:35','1','2018-03-03 02:10:21','èƒœå¤šè´Ÿå°‘','0');

/*Table structure for table `test_data` */

DROP TABLE IF EXISTS `test_data`;

CREATE TABLE `test_data` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `user_id` varchar(64) DEFAULT NULL COMMENT 'å½’å±ç”¨æˆ·',
  `office_id` varchar(64) DEFAULT NULL COMMENT 'å½’å±éƒ¨é—¨',
  `area_id` varchar(64) DEFAULT NULL COMMENT 'å½’å±åŒºåŸŸ',
  `name` varchar(100) DEFAULT NULL COMMENT 'åç§°',
  `sex` char(1) DEFAULT NULL COMMENT 'æ€§åˆ«',
  `in_date` date DEFAULT NULL COMMENT 'åŠ å…¥æ—¥æœŸ',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `test_data_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä¸šåŠ¡æ•°æ®è¡¨';

/*Data for the table `test_data` */

insert  into `test_data`(`id`,`user_id`,`office_id`,`area_id`,`name`,`sex`,`in_date`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('67af42ec8f024999bce2fc62b9825d55','3','3','5','tstestæµ‹è¯•ä¸€ä¸‹','1','2018-01-30','1','2018-03-03 01:02:53','1','2018-03-07 11:05:08','æ‰§è¡Œä¸€ä¸‹ï¼Œçœ‹çœ‹','0');

/*Table structure for table `test_data_child` */

DROP TABLE IF EXISTS `test_data_child`;

CREATE TABLE `test_data_child` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `test_data_main_id` varchar(64) DEFAULT NULL COMMENT 'ä¸šåŠ¡ä¸»è¡¨ID',
  `name` varchar(100) DEFAULT NULL COMMENT 'åç§°',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `test_data_child_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä¸šåŠ¡æ•°æ®å­è¡¨';

/*Data for the table `test_data_child` */

insert  into `test_data_child`(`id`,`test_data_main_id`,`name`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('8bfc4d20bdd04c0ba1f7acff89de2d65','ddd601f39f004a2e8b6bb672bc6af17b','222','1','2018-03-12 14:17:33','1','2018-03-12 14:17:33','222','0'),('d99738b79c7e4f98ac7dbafefd368b0c','ddd601f39f004a2e8b6bb672bc6af17b','11','1','2018-03-12 14:17:33','1','2018-03-12 14:17:33','111','0');

/*Table structure for table `test_data_main` */

DROP TABLE IF EXISTS `test_data_main`;

CREATE TABLE `test_data_main` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `user_id` varchar(64) DEFAULT NULL COMMENT 'å½’å±ç”¨æˆ·',
  `office_id` varchar(64) DEFAULT NULL COMMENT 'å½’å±éƒ¨é—¨',
  `area_id` varchar(64) DEFAULT NULL COMMENT 'å½’å±åŒºåŸŸ',
  `name` varchar(100) DEFAULT NULL COMMENT 'åç§°',
  `sex` char(1) DEFAULT NULL COMMENT 'æ€§åˆ«',
  `in_date` date DEFAULT NULL COMMENT 'åŠ å…¥æ—¥æœŸ',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `test_data_main_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä¸šåŠ¡æ•°æ®è¡¨';

/*Data for the table `test_data_main` */

insert  into `test_data_main`(`id`,`user_id`,`office_id`,`area_id`,`name`,`sex`,`in_date`,`create_by`,`create_date`,`update_by`,`update_date`,`remarks`,`del_flag`) values ('ddd601f39f004a2e8b6bb672bc6af17b','','','','test','',NULL,'1','2018-03-12 14:17:32','1','2018-03-12 14:17:32','','0');

/*Table structure for table `test_tree` */

DROP TABLE IF EXISTS `test_tree`;

CREATE TABLE `test_tree` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `parent_id` varchar(64) NOT NULL COMMENT 'çˆ¶çº§ç¼–å·',
  `parent_ids` varchar(2000) NOT NULL COMMENT 'æ‰€æœ‰çˆ¶çº§ç¼–å·',
  `name` varchar(100) NOT NULL COMMENT 'åç§°',
  `sort` decimal(10,0) NOT NULL COMMENT 'æ’åº',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `test_tree_del_flag` (`del_flag`),
  KEY `test_data_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ ‘ç»“æ„è¡¨';

/*Data for the table `test_tree` */

/* Function  structure for function  `gen_seq_number` */

/*!50003 DROP FUNCTION IF EXISTS `gen_seq_number` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`cuipy`@`%` FUNCTION `gen_seq_number`(keyCode varchar(32),addCount int) RETURNS int(11)
BEGIN
  declare val int;
  declare rowCount int;
  
  
  if keyCode is null or length(keyCode)>32 then
    SIGNAL SQLSTATE 'HY611' SET MESSAGE_TEXT = 'keyCodeä¸èƒ½ä¸ºç©ºï¼Œä¸”æœ€å¤§ä¸º32ä½å­—ç¬¦ä¸²';
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
