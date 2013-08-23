import QtQuick 1.1


Rectangle {
    property alias lx : lr.x

    height: 150
    color: "transparent"
    clip: true
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter:   parent.verticalCenter

    Image {
        id: lr
        y: -19
        source: main.src
    }

    opacity: 0
    Behavior on opacity { NumberAnimation { duration: 1000; easing.type: Easing.InOutBounce  } }
}
