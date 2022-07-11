*** Settings ***
Documentation    Lab 78/185 resources for test

*** Variables ***

${DOMAIN}       AACCACCS


###################################################################################
##############################    CCMA    #########################################
###################################################################################
${CCMA_URL}     https://win-pcr45vulbnc.AACCACCS.TMA.COM
${CCMA_USER}    webadmin
${CCMA_PASS}    1_Abc_123



#########################    CCMA - Configuration    #############################

# todo CCMA - Config - Activity Code

&{NRD}  DEFAULT_CODE=Not_Ready_Default_Reason_Code



###################################################################################
#############################    CUSTOMER     #####################################
###################################################################################

##############################     CUSTOMER 1     #################################
@{CUST1_INFO}    WS_CUSTOMER1    ${CUST1_EMAIL}    WC_oanh1
${CUST1_NAME}         WS_CUSTOMER1
${CUST1_EMAIL}        WS_CUSTOMER1@acc7dc.com    #WS_EM_customer1@automation.tma.com
${CUST1_PHONE}          6500719   #3307        #61141      #51015
${CUST1_PHONE_PASSWORD}     12345678
${CUST1_PHONE_IP_SERVER}    100.30.6.150    #10.30.4.28      #10.128.228.166
${CUST1_DOMAIN}             AACCACCS.TMA.COM    #${DOMAIN.URI}    #auracc8.com
#${CUST1_URI}              sip:${CUST1_PHONE}@${CUST1_DOMAIN}
${CUST1_URI}              tel:${CUST1_PHONE};phone-context=dialstring       #tel:${CUST1_PHONE};phone-context=dialstring
${CUST1_URI_CDN}              sip:+${CUST1_PHONE}@${CUST1_DOMAIN}
&{CUST1}                NAME=WS_CUSTOMER1       EMAIL=WS_CUSTOMER1@acc7dc.com       PHONE=6500719
...                     PHONE_PASSWORD=12345678     PHONE_IP_SERVER=100.30.6.150    DOMAIN=AACCACCS.TMA.COM


##############################     CUSTOMER 2     #################################
@{CUST2_INFO}    WS_CUSTOMER2    WS_CUSTOMER2@acc7dc.com     WC_oanh1
${CUST2_NAME}         WS_CUSTOMER2
${CUST2_EMAIL}        WS_CUSTOMER2@acc7dc.com   #WS_EM_customer2@automation.tma.com
${CUST2_PHONE}          6500772        #61141      #51015
${CUST2_PHONE_PASSWORD}     12345678
${CUST2_PHONE_IP_SERVER}    100.30.6.150    #10.30.4.28      #10.128.228.166
${CUST2_DOMAIN}             auracc8.com
#${CUST1_URI}              sip:${CUST2_PHONE}@${CUST2_DOMAIN}
${CUST2_URI}              tel:${CUST2_PHONE};phone-context=auracc8.com        #tel:${CUST1_PHONE};phone-context=dialstring
${CUST2_URI_CDN}      sip:+${CUST2_PHONE}@${CUST2_DOMAIN}

##############################     CUSTOMER 3     #################################
@{CUST3_INFO}    cust_name_3    WS_EM_CUSTOMER3@automation.tma.com    WC_oanh1
${CUST3_NAME}         cust_name_3
${CUST3_EMAIL}        WS_EM_CUSTOMER3@automation.tma.com
${CUST3_PHONE}          3307        #61141      #51015
${CUST3_PHONE_PASSWORD}     12345678
${CUST3_PHONE_IP_SERVER}    100.30.6.150    #10.30.4.28      #10.128.228.166
${CUST3_DOMAIN}             auracc8.com
#${CUST1_URI}          sip:${CUST1_PHONE}@${CUST1_DOMAIN}
${CUST3_URI}           tel:${CUST3_PHONE};phone-context=auracc8.com        #tel:${CUST1_PHONE};phone-context=dialstring
${CUST3_URI_CDN}       sip:${CUST3_PHONE}@${CUST3_DOMAIN}

##############################     CUSTOMER 4     #################################
@{CUST4_INFO}    cust_name_4    WS_EM_customer4444@automation.tma.com    WC_oanh1
${CUST4_NAME}         cust_name_4
${CUST4_EMAIL}        WS_EM_customer4444@automation.tma.com
${CUST4_PHONE}          3307        #61141      #51015
${CUST4_PHONE_PASSWORD}     12345678
${CUST4_PHONE_IP_SERVER}    100.30.6.150    #10.30.4.28      #10.128.228.166
${CUST4_DOMAIN}             auracc8.com
#${CUST1_URI}          sip:${CUST1_PHONE}@${CUST1_DOMAIN}
${CUST4_URI}           tel:${CUST4_PHONE};phone-context=auracc8.com        #tel:${CUST1_PHONE};phone-context=dialstring
${CUST4_URI_CDN}       sip:${CUST4_PHONE}@${CUST4_DOMAIN}

##############################     CUSTOMER 5     #################################
@{CUST5_INFO}    cust_name_5    WS5@automation.tma.com    WC_oanh1
${CUST5_NAME}         cust_name_5
${CUST5_EMAIL}        WS5@automation.tma.com
${CUST5_PHONE}          3307        #61141      #51015
${CUST5_PHONE_PASSWORD}     12345678
${CUST5_PHONE_IP_SERVER}    100.30.6.150    #10.30.4.28      #10.128.228.166
${CUST5_DOMAIN}             auracc8.com
#${CUST1_URI}          sip:${CUST1_PHONE}@${CUST1_DOMAIN}
${CUST5_URI}           tel:${CUST5_PHONE};phone-context=auracc8.com        #tel:${CUST1_PHONE};phone-context=dialstring
${CUST5_URI_CDN}       sip:${CUST5_PHONE}@${CUST5_DOMAIN}

##############################     CUSTOMER 6     #################################
@{CUST6_INFO}    oanhho_cust6    oanhho_cust6@automation.tma.com    WC_oanh1
${CUST6_NAME}         oanhho_cust6
${CUST6_EMAIL}        oanhho_cust6@automation.tma.com
${CUST6_PHONE}          3307        #61141      #51015
${CUST6_PHONE_PASSWORD}     12345678
${CUST6_PHONE_IP_SERVER}    100.30.6.150    #10.30.4.28      #10.128.228.166
${CUST6_DOMAIN}             auracc8.com
#${CUST1_URI}          sip:${CUST1_PHONE}@${CUST1_DOMAIN}
${CUST6_URI}           tel:${CUST6_PHONE};phone-context=auracc8.com        #tel:${CUST1_PHONE};phone-context=dialstring
${CUST6_URI_CDN}       sip:${CUST6_PHONE}@${CUST6_DOMAIN}
&{CUST6}    URI_CDN=sip:3307@auracc8.com        URI=tel:3307;phone-context=auracc8.com      DOMAIN=auracc8.com
...         PHONE_IP_SERVER=100.30.6.150        PHONE_PASSWORD=12345678 PHONE=3307
...         EMAIL=oanhho_cust6@automation.tma.com           NAME=oanhho_cust6

##############################     CUSTOMER 7     #################################
@{CUST7_INFO}    ${EMPTY}    oanhho_cust7@automation.tma.com    WC_oanh1
${CUST7_NAME}         ${EMPTY}
${CUST7_EMAIL}        oanhho_cust7@automation.tma.com
${CUST7_PHONE}          3307        #61141      #51015
${CUST7_PHONE_PASSWORD}     12345678
${CUST7_PHONE_IP_SERVER}    100.30.6.150    #10.30.4.28      #10.128.228.166
${CUST7_DOMAIN}             auracc8.com
#${CUST1_URI}          sip:${CUST1_PHONE}@${CUST1_DOMAIN}
${CUST7_URI}           tel:${CUST7_PHONE};phone-context=auracc8.com        #tel:${CUST1_PHONE};phone-context=dialstring
${CUST7_URI_CDN}       sip:+${CUST7_PHONE}@${CUST7_DOMAIN}

##############################     CUSTOMER 8     #################################
@{CUST8_INFO}    ${EMPTY}    oanhho_cust7@automation.tma.com    WC_oanh1
${CUST8_NAME}         ${EMPTY}
${CUST8_EMAIL}        oanhho_cust7@automation.tma.com
${CUST8_PHONE}          3307        #61141      #51015
${CUST8_PHONE_PASSWORD}     12345678
${CUST8_PHONE_IP_SERVER}    100.30.6.150    #10.30.4.28      #10.128.228.166
${CUST8_DOMAIN}             auracc8.com
#${CUST1_URI}          sip:${CUST1_PHONE}@${CUST1_DOMAIN}
${CUST8_URI}           tel:${CUST7_PHONE};phone-context=auracc8.com        #tel:${CUST1_PHONE};phone-context=dialstring
${CUST8_URI_CDN}       sip:+${CUST7_PHONE}@${CUST7_DOMAIN}
# (Dividing data to several rows)


&{CUST8}        PHONE=6500338                   PHONE_PASSWORD=12345678         SERVER_INFO=10.128.228.162,5061,aaccaccs.tma.com
...             URI=tel:6500338;phone-context=dialstring                        isPhoneBarred=${False}
...             PHONE_E164=+6500338             isURIDefault=${False}           URI=sip:6500338@AACCACCS.TMA.COM
...             isPhoneDefault=${True}
...             Number=6500338                  Area=${EMPTY}                   Intl=${EMPTY}
...             phoneType=Business              Email=cust8@AACCACCS.TMA.COM
...             isEmailDefault=${True}          isRestricted=${False}           Firstname=cust8 firstname
...             Lastname=CUST8 lastname         Title=CUST8 title

&{NEW CUST8}    isURIDefault=${False}           URI=sip:1026@AACCACCS.TMA.COM   isPhoneBarred=${False}
...             isPhoneDefault=${True}
...             Number=1026                     Area=${EMPTY}                   Intl=${EMPTY}
...             phoneType=Business              Email=newcust8_26@AACCACCS.TMA.COM
...             isEmailDefault=${True}          isRestricted=${False}           Firstname=cust8
...             Lastname=CUST8                  Title=CUST 8


###################################################################################
#################################    CUSTOMER   ###################################
###################################################################################
# This customer for create new customer on workspaces

&{NEW CUST1}    isURIDefault=${False}           URI=sip:1000001@AACCACCS.TMA.COM             isPhoneBarred=${False}
...             isPhoneDefault=${True}
...             Number=1000001                  Area=+84                            Intl=70
...             phoneType=Home                  Email=new_cust1@AACCACCS.TMA.COM             # ${phoneType} accept only data [Unknown, Home, Business, Fax, Mobile, Other]
...             isEmailDefault=${True}          isRestricted=${False}               Firstname=fname cust 1
...             Lastname=lname cust 1           Title=cust 1 title

&{MODIFY CUST1}     isURIDefault=${False}       URI=sip:1000001@AACCACCS.TMA.COM             isPhoneBarred=${False}
...             isPhoneDefault=${True}
...             Number=1234567                  Area=+84                            Intl=70
...             phoneType=Business              Email=new_cust1@AACCACCS.TMA.COM             # ${phoneType} accept only data [Unknown, Home, Business, Fax, Mobile, Other]
...             isEmailDefault=${True}          isRestricted=${False}               Firstname=fname cust 1
...             Lastname=lname cust 1           Title=cust 1 title

###################################################################################
#######      Config System Dilivery Failure Rule for skillset of Agent      #######
###################################################################################

${ADMIN_EMAIL}      Administrator@automation.tma.com
${ADMIN_SUBJECT}    Undeliverable
${ADMIN_CONTENT_EMAIL}  The e-mail account does not exist at the organization this message was sent to.  Check the e-mail address, or contact the recipient directly to find out the correct address.

###################################################################################
#################################    CDN    #######################################
###################################################################################

${CDN_55087}     55087
${CDN_55048}     55048
${CDN_55086}     55086
${CDN_55088}     55088

###################################################################################
#################################    AGENT    #####################################
###################################################################################
# todo Config data for Agent

# todo Agent info

&{MM_AGENT1}    USERNAME=AACCACCS${/}AACC_MM_AGENT1     PASSWORD=1_Abc_123          FIRSTNAME=AACC_MM_AGENT1
...             LASTNAME=AACC_MM_AGENT1                 FULLNAME=AACC_MM_AGENT1     ID=6500321
...             VOICE_URI=sip:6500321@AACCACCS.TMA.COM  PHONE_NUMBER=${EMPTY}       PHONE_E164=${EMPTY}
...             SUP=${EMPTY}
...             MAIL1=WS_SANITY1@acc7dc.com             MAIL2=${EMPTY}              MAIL=WS_SANITY1@acc7dc.com
...             SKILLSET_VOICE1=${EMPTY}                SKILLSET_VOICE2=${EMPTY}                SKILLSET_VOICE3=${EMPTY}
...             SKILLSET_EM1=EM_SKILLSET_FOR_SANITY1    SKILLSET_EM2=EM_SKILLSET_FOR_SANITY2    SKILLSET_EM3=${EMPTY}
...             SKILLSET_WC1=WC_SKILLSET_FOR_SANITY1    SKILLSET_WC2=WC_SKILLSET_FOR_SANITY2    SKILLSET_WC3=${EMPTY}
...             SKILLSET_WC=WC_SKILLSET_FOR_SANITY1


&{MM_AGENT2}    USERNAME=AACCACCS${/}AACC_MM_AGENT2     PASSWORD=1_Abc_123          FIRSTNAME=AACC_MM_AGENT2
...             LASTNAME=AACC_MM_AGENT2                 FULLNAME=AACC_MM_AGENT2     ID=6500322
...             VOICE_URI=sip:6500322@AACCACCS.TMA.COM  PHONE_NUMBER=${EMPTY}       PHONE_E164=${EMPTY}
...             SUP=${EMPTY}
...             MAIL1=WS_SANITY1@acc7dc.com             MAIL2=${EMPTY}              MAIL=WS_SANITY1@acc7dc.com
...             SKILLSET_VOICE1=${EMPTY}                SKILLSET_VOICE2=${EMPTY}                SKILLSET_VOICE3=${EMPTY}
...             SKILLSET_EM1=EM_SKILLSET_FOR_SANITY1    SKILLSET_EM2=EM_SKILLSET_FOR_SANITY2    SKILLSET_EM3=${EMPTY}
...             SKILLSET_WC1=WC_SKILLSET_FOR_SANITY1    SKILLSET_WC2=WC_SKILLSET_FOR_SANITY2    SKILLSET_WC3=${EMPTY}
...             SKILLSET_WC=WC_SKILLSET_FOR_SANITY1


&{MM_AGENT3}    USERNAME=AACCACCS${/}AACC_MM_AGENT3     PASSWORD=1_Abc_123          FIRSTNAME=AACC_MM_AGENT3
...             LASTNAME=AACC_MM_AGENT3                 FULLNAME=AACC_MM_AGENT3     ID=6500323
...             VOICE_URI=sip:6500323@AACCACCS.TMA.COM  PHONE_NUMBER=${EMPTY}       PHONE_E164=${EMPTY}
...             SUP=${EMPTY}
...             MAIL1=WS_SANITY1@acc7dc.com             MAIL2=${EMPTY}
...             SKILLSET_VOICE1=${EMPTY}                SKILLSET_VOICE2=${EMPTY}                SKILLSET_VOICE3=${EMPTY}
...             SKILLSET_EM1=EM_SKILLSET_FOR_SANITY1    SKILLSET_EM2=EM_SKILLSET_FOR_SANITY2    SKILLSET_EM3=${EMPTY}
...             SKILLSET_WC1=WC_SKILLSET_FOR_SANITY1    SKILLSET_WC2=WC_SKILLSET_FOR_SANITY2    SKILLSET_WC3=${EMPTY}
...             SKILLSET_WC=WC_SKILLSET_FOR_SANITY1


&{MM_AGENT4}    USERNAME=AACCACCS${/}AACC_MM_AGENT4     PASSWORD=1_Abc_123          FIRSTNAME=AACC_MM_AGENT4
...             LASTNAME=AACC_MM_AGENT4                 FULLNAME=AACC_MM_AGENT4     ID=6500324
...             VOICE_URI=${EMPTY}						PHONE_NUMBER=${EMPTY}       PHONE_E164=${EMPTY}
...             SUP=AACC_BL_SUP1
...             MAIL1=${EMPTY}             				MAIL2=${EMPTY}              MAIL=${EMPTY}
...             SKILLSET_VOICE4=${EMPTY}                SKILLSET_VOICE5=${EMPTY}                SKILLSET_VOICE6=${EMPTY}
...             SKILLSET_EM4=EM_SKILLSET_AUTO4    		SKILLSET_EM5=EM_SKILLSET_AUTO5    		SKILLSET_EM6=EM_SKILLSET_AUTO6
...             SKILLSET_WC4=WC_SKILLSET_AUTO4    		SKILLSET_WC5=WC_SKILLSET_AUTO5   		SKILLSET_WC6=WC_SKILLSET_AUTO6


&{MM_AGENT5}    USERNAME=AACCACCS${/}AACC_MM_AGENT5     PASSWORD=1_Abc_123          FIRSTNAME=AACC_MM_AGENT5
...             LASTNAME=AACC_MM_AGENT5                 FULLNAME=AACC_MM_AGENT5     ID=6500325
...             VOICE_URI=${EMPTY}						PHONE_NUMBER=${EMPTY}       PHONE_E164=${EMPTY}
...             SUP=AACC_BL_SUP1
...             MAIL1=${EMPTY}             				MAIL2=${EMPTY}              MAIL=${EMPTY}
...             SKILLSET_VOICE4=${EMPTY}                SKILLSET_VOICE5=${EMPTY}                SKILLSET_VOICE6=${EMPTY}
...             SKILLSET_EM4=EM_SKILLSET_AUTO4    		SKILLSET_EM5=EM_SKILLSET_AUTO5    		SKILLSET_EM6=EM_SKILLSET_AUTO6
...             SKILLSET_WC4=WC_SKILLSET_AUTO4    		SKILLSET_WC5=WC_SKILLSET_AUTO5   		SKILLSET_WC6=WC_SKILLSET_AUTO6



&{MM_AGENT6}    USERNAME=AACCACCS${/}AACC_MM_AGENT6     PASSWORD=1_Abc_123          FIRSTNAME=AACC_MM_AGENT6
...             LASTNAME=AACC_MM_AGENT6                 FULLNAME=AACC_MM_AGENT6     ID=6500326
...             VOICE_URI=${EMPTY}						PHONE_NUMBER=${EMPTY}       PHONE_E164=${EMPTY}
...             SUP=AACC_BL_SUP1
...             MAIL1=${EMPTY}             				MAIL2=${EMPTY}              MAIL=${EMPTY}
...             SKILLSET_VOICE4=${EMPTY}                SKILLSET_VOICE5=${EMPTY}                SKILLSET_VOICE6=${EMPTY}
...             SKILLSET_EM4=EM_SKILLSET_AUTO4    		SKILLSET_EM5=EM_SKILLSET_AUTO5    		SKILLSET_EM6=EM_SKILLSET_AUTO6
...             SKILLSET_WC4=WC_SKILLSET_AUTO4    		SKILLSET_WC5=WC_SKILLSET_AUTO5   		SKILLSET_WC6=WC_SKILLSET_AUTO6



&{VO_AGENT1}    USERNAME=AACCACCS${/}AACC_VO_AGENT1     PASSWORD=1_Abc_123          FIRSTNAME=AACC_VO_AGENT1
...             LASTNAME=AACC_VO_AGENT1                 FULLNAME=AACC_VO_AGENT1     ID=6500331
...             VOICE_URI=sip:6500331@AACCACCS.TMA.COM  PHONE_NUMBER=6500331        PHONE_E164=+6500331
...             SUP=${EMPTY}
...             MAIL1=${EMPTY}                          MAIL2=${EMPTY}
...             SKILLSET_VOICE1=SKILLSET_FOR_SANITY1    SKILLSET_VOICE2=SKILLSET_FOR_SANITY2    SKILLSET_VOICE3=${EMPTY}
...             SKILLSET_EM1=${EMPTY}                   SKILLSET_EM2=${EMPTY}                   SKILLSET_EM3=${EMPTY}
...             SKILLSET_WC1=${EMPTY}                   SKILLSET_WC2=${EMPTY}                   SKILLSET_WC3=${EMPTY}


&{VO_AGENT2}    USERNAME=AACCACCS${/}AACC_VO_AGENT2     PASSWORD=1_Abc_123          FIRSTNAME=AACC_VO_AGENT2
...             LASTNAME=AACC_VO_AGENT2                 FULLNAME=AACC_VO_AGENT2     ID=6500332
...             VOICE_URI=sip:6500332@AACCACCS.TMA.COM  PHONE_NUMBER=6500332        PHONE_E164=+6500332
...             SUP=${EMPTY}
...             MAIL1=${EMPTY}                          MAIL2=${EMPTY}
...             SKILLSET_VOICE1=SKILLSET_FOR_SANITY1    SKILLSET_VOICE2=SKILLSET_FOR_SANITY2    SKILLSET_VOICE3=${EMPTY}
...             SKILLSET_EM1=${EMPTY}                   SKILLSET_EM2=${EMPTY}                   SKILLSET_EM3=${EMPTY}
...             SKILLSET_WC1=${EMPTY}                   SKILLSET_WC2=${EMPTY}                   SKILLSET_WC3=${EMPTY}


&{BL_AGENT1}    USERNAME=AACCACCS${/}AACC_BL_AGENT1     PASSWORD=1_Abc_123          FIRSTNAME=AACC_BL_AGENT1
...             LASTNAME=AACC_BL_AGENT1                 FULLNAME=AACC_BL_AGENT1     ID=6500341
...             VOICE_URI=sip:6500341@AACCACCS.TMA.COM  PHONE_NUMBER=6500341        PHONE_E164=+6500341
...             SUP=${EMPTY}
...             MAIL1=WS_SANITY1@acc7dc.com             MAIL2=${EMPTY}              MAIL=WS_SANITY1@acc7dc.com
...             SKILLSET_VOICE1=SKILLSET_FOR_SANITY1    SKILLSET_VOICE2=SKILLSET_FOR_SANITY2    SKILLSET_VOICE3=${EMPTY}
...             SKILLSET_EM1=EM_SKILLSET_FOR_SANITY1    SKILLSET_EM2=EM_SKILLSET_FOR_SANITY2    SKILLSET_EM3=${EMPTY}
...             SKILLSET_WC1=WC_SKILLSET_FOR_SANITY1    SKILLSET_WC2=WC_SKILLSET_FOR_SANITY2    SKILLSET_WC3=${EMPTY}
...             SKILLSET_WC=WC_SKILLSET_FOR_SANITY1


&{BL_AGENT2}    USERNAME=AACCACCS${/}AACC_BL_AGENT2     PASSWORD=1_Abc_123          FIRSTNAME=AACC_BL_AGENT2
...             LASTNAME=AACC_BL_AGENT2                 FULLNAME=AACC_BL_AGENT2     ID=6500342
...             VOICE_URI=sip:6500342@AACCACCS.TMA.COM  PHONE_NUMBER=6500342        PHONE_E164=+6500342
...             SUP=${EMPTY}
...             MAIL1=WS_SANITY1@acc7dc.com             MAIL2=${EMPTY}
...             SKILLSET_VOICE1=SKILLSET_FOR_SANITY1    SKILLSET_VOICE2=SKILLSET_FOR_SANITY2    SKILLSET_VOICE3=${EMPTY}
...             SKILLSET_EM1=EM_SKILLSET_FOR_SANITY1    SKILLSET_EM2=EM_SKILLSET_FOR_SANITY2    SKILLSET_EM3=${EMPTY}
...             SKILLSET_WC1=WC_SKILLSET_FOR_SANITY1    SKILLSET_WC2=WC_SKILLSET_FOR_SANITY2    SKILLSET_WC3=${EMPTY}




# todo Sup info

&{BL_SUP1}      USERNAME=AACCACCS${/}AACC_BL_SUP1       PASSWORD=1_Abc_123          FIRSTNAME=AACC_BL_SUP1
...             LASTNAME=AACC_BL_SUP1                   FULLNAME=AACC_BL_SUP1       ID=6500349
...             VOICE_URI=sip:6500349@AACCACCS.TMA.COM  PHONE_NUMBER=6500349        PHONE_E164=+6500349
...             SUP=${EMPTY}
...             MAIL1=WS_SANITY1@acc7dc.com             MAIL2=${EMPTY}
...             SKILLSET_VOICE1=SKILLSET_FOR_SANITY1    SKILLSET_VOICE2=SKILLSET_FOR_SANITY2    SKILLSET_VOICE3=Default_Skillset
...             SKILLSET_EM1=EM_SKILLSET_FOR_SANITY1    SKILLSET_EM2=EM_SKILLSET_FOR_SANITY2    SKILLSET_EM3=${EMPTY}
...             SKILLSET_WC1=WC_SKILLSET_FOR_SANITY1    SKILLSET_WC2=WC_SKILLSET_FOR_SANITY2    SKILLSET_WC3=${EMPTY}

&{MM_SUP1}      USERNAME=AACCACCS${/}AACC_MM_SUP1       PASSWORD=1_Abc_123          FIRSTNAME=AACC_MM_SUP1
...             LASTNAME=AACC_MM_SUP1                   FULLNAME=AACC_MM_SUP1       ID=
...             VOICE_URI=                              PHONE_NUMBER=               PHONE_E164=
...             SUP=${EMPTY}
...             MAIL1=WS_SANITY1@acc7dc.com             MAIL2=${EMPTY}
...             SKILLSET_VOICE1=${EMPTY}                SKILLSET_VOICE2=${EMPTY}                SKILLSET_VOICE3=${EMPTY}
...             SKILLSET_EM1=EM_SKILLSET_FOR_SANITY1    SKILLSET_EM2=EM_SKILLSET_FOR_SANITY2    SKILLSET_EM3=${EMPTY}
...             SKILLSET_WC1=WC_SKILLSET_FOR_SANITY1    SKILLSET_WC2=WC_SKILLSET_FOR_SANITY2    SKILLSET_WC3=${EMPTY}









