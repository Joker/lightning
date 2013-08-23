import QtQuick 1.1

Item {
    id: main

    width:  screenSize.width
    height: screenSize.height
//    width:  1920
//    height: 1200
    property int stage
    property string src: "images/lighning2.gif"

    onStageChanged: {
        if (stage == 1) {
            k.opacity = 1
        }
        if (stage == 2) {
            k.opacity = 0.1
            d.opacity = 1
        }
        if (stage == 3) {
            k.opacity = 0.1
            d.opacity = 0.1
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
        width: light.width; height: light.height

        anchors.verticalCenterOffset:   -70
        anchors.horizontalCenterOffset: -120
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter:   parent.verticalCenter

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

        anchors.verticalCenterOffset:   -15
        anchors.horizontalCenterOffset: -33
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter:   parent.verticalCenter

        visible: false
        opacity: 1
        source: "images/spark.png"

        SequentialAnimation {
            id: run
            running: true
            NumberAnimation { target: spark; property: "opacity"; to: 0; duration: 5 }
            PauseAnimation  { duration: 200 }
            NumberAnimation { target: spark; property: "opacity"; to: 1; duration: 20 }
        }
    }


    Image {
        id: k
        source: "images/k.png"
        height: 150; width: 140

        anchors.horizontalCenterOffset: -122
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter:   parent.verticalCenter

        opacity: 0
        Behavior on opacity { NumberAnimation { duration: 1000; easing { type: Easing.InOutQuad } } }


    }
    Image {
        id: d
        source: "images/d.png"
        height: 150; width: 110

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter:   parent.verticalCenter

        opacity: 0
        Behavior on opacity { NumberAnimation { duration: 1000; easing { type: Easing.InOutQuad } } }


    }
    Image {
        id: e
        source: "images/e.png"
        height: 150; width: 120

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter:   parent.verticalCenter
        anchors.horizontalCenterOffset: 115

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
            name: "new"
            when: light.currentFrame == 0
            onCompleted: {light_base.anchors.horizontalCenterOffset += 50; light_base.anchors.verticalCenterOffset += 20}
        }
    ]

}

  
