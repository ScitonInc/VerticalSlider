
import QtQuick 2.0
import "Utils.js" as Utils
Item {
    id: slider; width: 40; height: 600

    // value is read/write.
    property real value: 1
    onValueChanged: updatePos();
    property real maximum: 598
    property real minimum: 2
    property int yMay: height - handle.height - 4
    onYMayChanged: updatePos();
    onMinimumChanged: updatePos();

    function updatePos() {
        if (maximum > minimum) {
            var pos = 2 + (value - minimum) * slider.yMay / (maximum - minimum);
            pos = Math.min(pos, height - handle.height - 2);
            pos = Math.max(pos, 2);
            handle.y = pos;
        } else {
            handle.y = 2;
        }
    }
    function sendEventToMCU(eventID, eventValue) {
//        if (typeof connection == 'undefined')
//            //console.log(qsTr("e%1=%2\r").arg(eventID).arg(eventValue));
//            txtEmulatorEcho.text = qsTr("e%1=%2").arg(eventID).arg(eventValue);
////            abcde = 1;
//        else
            console.log(eventID)
            connection.sendMessage(qsTr("e%1=%2").arg(eventID).arg(eventValue));

    }
    Rectangle {
        anchors.fill: parent
        border.color: "black"; border.width: 0; radius: 30
        gradient: Gradient {
            GradientStop { position: 0.0; color: "lightgreen" }
            GradientStop { position: 0.5; color: "skyblue" }
            GradientStop { position: 1.0; color: "darkblue" }
        }
    }

    Rectangle {
        id: handle;
        smooth: true
        y: 2;
        width: 40
        height:40
        radius: 30
        gradient: Gradient {
            GradientStop { position: 0.0; color: "lightblue" }
            GradientStop { position: 1.0; color: "gray" }
        }

        MouseArea {
            id: mouse
            anchors.fill: parent; drag.target: parent
            drag.axis: Drag.YAxis; drag.minimumY: 2; drag.maximumY: slider.yMay+2
            onPositionChanged: {
                value = (maximum - minimum) * (handle.y-2) / slider.yMay + minimum;
                console.log(handle.y)
                sendEventToMCU(value, "00000");
            }
        }
    }
}
