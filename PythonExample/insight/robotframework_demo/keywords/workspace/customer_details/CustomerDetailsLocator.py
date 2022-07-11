#   ============== CUSTOMER DETAILS =============
# EMAIL_VAR = "XXX"
WORKCARD_ID_VAR = "${WORKCARD_ID}"
LOC_CUSTOMER_DETAIL_LINE_EMAIL = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//a[@title='Open link in external email client']"
# LOC_CUSTOMER_DETAIL_LINE_EMAIL = "xpath://a[@ng-href='mailto:" + EMAIL_VAR +"']"
LOC_CUSTOMER_DETAIL_BTN_MORE_INFO = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR + "']//button[@class='more-information-button md-button md-ink-ripple']"


#   ====== INTERACTION DETAILS ======
LOC_CUSTOMER_DETAIL_CHANEL_TYPE = "xpath://tr[@ng-if='context.channel']/td[2]"
LOC_CUSTOMER_DETAIL_SERVICE = "xpath://tr[@ng-if='context.topic']/td[2]"
LOC_CUSTOMER_DETAIL_DIRECTION = "xpath://tr[@ng-if='context.direction']/td[2]"
LOC_CUSTOMER_DETAIL_ORIGINAL_ADDRESS = "xpath://div[@class='widget widget--interaction-details']//*[@ng-if='context.originatingAddress']//td[2]"
# LOC_CUSTOMER_DETAIL_ORIGINAL_ADDRESS = "xpath://html/body/div[1]/div/div[1]/context-canvas/div[2]/div[1]/div[1]/div[2]/div/div/table/tbody/tr[7]/td[2]"

LOC_CUSTOMER_DETAIL_DESTINATION = "xpath://div[@class='widget__content--indented ps ps--active-x ps--active-y']//tr[@ng-if='context.destinationAddress']//td[2]"
# LOC_CUSTOMER_DETAIL_DIRECTION = "xpath://tr[@ng-if='context.direction']/td[2]"

#   ====== INTRINSICS ======
LOC_CUSTOMER_DETAIL_INTRINSIC_NAME = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR +"']//div[@ng-if='isIntrinsicPopulated']//table//tbody//tr//td[1]"
LOC_CUSTOMER_DETAIL_INTRINSIC_VALUE = "xpath://div[@interaction-id='" + WORKCARD_ID_VAR +"']//div[@ng-if='isIntrinsicPopulated']//table//tbody//tr//td[2]"
LOC_CUSTOMER_DETAIL_CONTACT_ID = "xpath://div[@ng-if='isIntrinsicPopulated']//table//tbody//tr[1]//td[2]"
LOC_CUSTOMER_DETAIL_CONTACT_TYPE = "xpath://div[@ng-if='isIntrinsicPopulated']//table//tbody//tr[2]//td[2]"
LOC_CUSTOMER_DETAIL_CONTACT_SIP_REQUEST_URI = "xpath://div[@ng-if='isIntrinsicPopulated']//table//tbody//tr[3]//td[2]"
LOC_CUSTOMER_DETAIL_AD_CDN = "xpath://div[@ng-if='isIntrinsicPopulated']//table//tbody//tr[4]//td[2]"
LOC_CUSTOMER_DETAIL_SIP_TO_ADDRESS = "xpath://div[@ng-if='isIntrinsicPopulated']//table//tbody//tr[5]//td[2]"
LOC_CUSTOMER_DETAIL_SIP_DIALED_DN = "xpath://div[@ng-if='isIntrinsicPopulated']//table//tbody//tr[7]//td[2]"
LOC_CUSTOMER_DETAIL_SIP_FROM_ADDRESS = "xpath://div[@ng-if='isIntrinsicPopulated']//table//tbody//tr[14]//td[2]"
# LOC_CUSTOMER_DETAIL_SIP_FROM_ADDRESS = "xpath://div[contains(@class,'active')]//tbody//tr//td[contains(text(),'FROMADDRESS:')]"
LOC_CUSTOMER_DETAIL_AD_CLID = "xpath://div[@ng-if='isIntrinsicPopulated']//table//tbody//tr[15]//td[2]"

LOC_CUSTOMER_DETAIL_WIDGET_CONTENT = "xpath://div[@class='widget widget--interaction-details']"
LOC_CUSTOMER_DETAIL_WIDGET_HEADER = "xpath://h5[@class='widget__header aoc-interaction-details']"

