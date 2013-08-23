import QtQuick 1.1

Item {
    id: main

//    width:  screenSize.width
//    height: screenSize.height
    width:  1920
    height: 1200
    property int stage
    property string src: "images/lighning2.gif"

    onStageChanged: {
        if (stage == 1) {
            k.opacity = 1
        }
        if (stage == 2) {
            k.opacity = 0.2
            d.opacity = 1
        }
        if (stage == 3) {
            k.opacity = 0.2
            d.opacity = 0.2
            e.opacity = 1
        }
        if (stage == 4) {
            k.opacity = 1
            d.opacity = 1
            e.opacity = 1
        }
        if (stage == 5) {
            k.opacity = 0.5
            d.opacity = 0.5
            e.opacity = 0.5
        }
        if (stage == 6) {
            black.visible = true
            spark.visible = true
            run.running   = true
        }
    }

    Rectangle {
        id: background
        color: "#000000"
        anchors.fill: parent
    }

    


    Rectangle {
        id: light_base
        width: light.width;
        height: light.height

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        AnimatedImage { id: light; source: src; }

        Rectangle {
            id: black
            visible: false;
            color: "#000000"
            width:  parent.width;
            height: parent.height
        }
    }
    Image {
        id: spark
        anchors.verticalCenterOffset: 45
        anchors.horizontalCenterOffset: 90
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        visible: false
        opacity: 1
        source: "images/spark.png"

        SequentialAnimation {
            id: run
            running: true
            NumberAnimation { target: spark; property: "opacity"; to: 0; duration: 5 }
            PauseAnimation { duration: 200 }
            NumberAnimation { target: spark; property: "opacity"; to: 1; duration: 10 }
        }
    }


    Image {
        id: k

        height: 150
        width: 140
        smooth: true

        x: (parent.width - width) / 2
        y: (parent.height - height) / 2 + 70

        source: "images/k1.png"

        opacity: 0
        Behavior on opacity { NumberAnimation { duration: 1000; easing { type: Easing.InOutQuad } } }


    }
    Image {
        id: d

        height: 150
        width: 110
        smooth: true

        x: 120 + (parent.width - width) / 2
        y: (parent.height - height) / 2 + 70

        source: "images/d1.png"

        opacity: 0
        Behavior on opacity { NumberAnimation { duration: 1000; easing { type: Easing.InOutQuad } } }


    }
    Image {
        id: e

        height: 150
        width: 120
        smooth: true

        x: 230 + (parent.width - width) / 2
        y: (parent.height - height) / 2 + 70

        source: "images/e1.png"

        opacity: 0
        Behavior on opacity { NumberAnimation { duration: 1000; easing { type: Easing.InOutQuad } } }


    }



    states: [
        State {
            name: "end"
            when: light.currentFrame == 147
            onCompleted: {light.mirror = !light.mirror;}
        },
        State {
            name: "nj"
            when: light.currentFrame == 0
            onCompleted: {light_base.anchors.horizontalCenterOffset += 50; light_base.anchors.verticalCenterOffset += 20}
        }
    ]

}

  