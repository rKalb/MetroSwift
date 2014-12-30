import QtQuick 1.1
import Entertainment 1.0
import Data 1.0
import Menu 1.0


Rectangle {
    property Data allData

    function loaded(){
        //This is a temporary menu which forwards to the current entertainment menu.
        switch (allData.entertainment.mode){
        case Entertainment.Cds:
            allData.menu.updateMenu("qml" + slash + "MetroSwift" + slash + "menus" + slash + "entertainment" + slash + "cd" + slash + "cd.menu")
            break;
        case Entertainment.Radios:
            allData.menu.updateMenu("qml" + slash + "MetroSwift" + slash + "menus" + slash + "entertainment" + slash + "radio" + slash + "radio.menu")
            break;
        case Entertainment.InvalidValue:
            break;
        }
    }

}
