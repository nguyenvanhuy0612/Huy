LOC_WEBSTATISTIC_BTN_SORT = "xpath://button[@id='webstat_sort_icon']"
LOC_WEBSTATISTIC_BTN_CHART = "xpath://button[@id='webstat_chart_type_icon']"
CLASS_BTN_CHART = "neo-btn neo-btn--ghost neo-icon-{}-chart"
LOC_WEBSTATISTIC_BTN_REFRESH = "xpath://button[@id='refreshButtonId']"
LOC_WEBSTATISTIC_CHECKBOX_ALERT = "xpath://md-checkbox[@aria-label='Alert']"
LOC_WEBSTATISTIC_SELECT_SKILLSET = "xpath://li//*[contains(text(),'{}')]"
LOC_WEBSTATISTIC_SKILLSET_VIEW = "xpath://div[@class='skillsetView']//*[@id='{}']"  # skillsetname     serviceLevel    maxWait
LOC_WEBSTATISTIC_SERVICE_LEVEL = "xpath://span[@id='serviceLevel']"
LOC_WEBSTATISTIC_MAX_WALT_TIME = "xpath://span[@id='maxWait']"
LOC_WEBSTATISTIC_CHART_AGENT = "xpath://canvas[@id='agentsChart']"
LOC_WEBSTATISTIC_CHART_CONTACT = "xpath://canvas[@id='contactsChart']"
LOC_WEBSTATISTIC_ALERT = "xpath://md-checkbox[@aria-label='Alert']"
LOC_WEBSTATISTIC_ALERT_DIALOG = "xpath://span[contains(text(),'Service Level Exceeded: {}')]"

LOC_WEBSTATISTIC_WARNING_SIGN = "xpath://li[@class='neo-tabs__item selectedSkillset']//span[@class='neo-icons__value neo-icon-error-filled notice-error']"


def DownloadChart(ccsIDElement, filetosave: str):
    import base64
    from robot.libraries.BuiltIn import BuiltIn
    driver = BuiltIn().get_library_instance("Selenium2Library").driver

    canvas = driver.find_element_by_css_selector("#"+ccsIDElement)

    # get the canvas as a PNG base64 string
    canvas_base64 = driver.execute_script("return arguments[0].toDataURL('image/png').substring(21);", canvas)

    # decode
    canvas_png = base64.b64decode(canvas_base64)

    # save to a file
    with open(filetosave, 'wb') as f:
        f.write(canvas_png)

def compare_images(a,b):
    from PIL import Image, ImageChops
    import numpy as np
    img1 = Image.open(a)
    img2 = Image.open(b)
    diff = ImageChops.difference(img1, img2)
    if diff.getbbox():
        diff.show()
    result = not np.any(diff)
    return result
