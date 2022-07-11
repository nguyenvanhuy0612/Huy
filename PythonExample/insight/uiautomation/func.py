import comtypes
from uiautomation import PropertyIdNames


def info(control):
    print('\n', control)
    print('Control:----')
    for i in sorted([it for it in dir(control) if not it.startswith('_')]):
        print(i)

    print('\n', control.Element)
    print('Control.Element:----')
    for i in sorted([it for it in dir(control.Element) if not it.startswith('_')]):
        print(i)

    lp = control.GetLegacyIAccessiblePattern()
    print('\n', lp)
    print('Control.LegacyIAccessiblePattern:----')
    for i in sorted([it for it in dir(lp.pattern) if not it.startswith('_')]):
        print(i)

    print('\nControl.Properties:----')
    for k, v in PropertyIdNames.items():
        try:
            value = control.GetPropertyValue(k)
            print('GetPropertyValue, {} = {}, type: {}'.format(v, value, type(value)))
        except (KeyError, comtypes.COMError) as ex:
            print('GetPropertyValue, {}, error'.format(v))

    children = control.GetChildren()
    print('\n control children:----', len(children))
    for c in control.GetChildren():
        print(c)