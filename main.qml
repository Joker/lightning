import QtQuick 1.1
import "letter"

Item {
    id: main

    width:  screenSize.width
    height: screenSize.height
//    width:  1920
//    height: 1200

    property int stage
    property string src: "kde1.png"

    onStageChanged: {
        if (stage == 1) {
            k.opacity = 1
        }
        if (stage == 2) {
            k.opacity = 0.1
            d.opacity = 1
        }
        if (stage == 3) {
            k.opacity = 0.2
            d.opacity = 0.2
            e.opacity = 1
        }
        if (stage == 4) {
            k.opacity = 1
            d.opacity = 0.5
            e.opacity = 0.1
        }
        if (stage == 5) {
            five.running = true
        }
        if (stage == 6) {
            src = "kde3.png"
            black.visible = true
            spark.visible = true
            six.running   = true
        }
    }

    SequentialAnimation {
        id:five
        running: false

        ParallelAnimation {
            NumberAnimation { target: k; property:"opacity"; to: 0; duration: 1000; }
            NumberAnimation { target: d; property:"opacity"; to: 0; duration: 1000; }
            NumberAnimation { target: e; property:"opacity"; to: 0; duration: 1000; }
        }

        ScriptAction    { script: {src = "kde2.png"} }
        PauseAnimation  { duration: 100 }

        ParallelAnimation {
            NumberAnimation { target: k; property:"opacity"; to: 1; duration: 1000; }
            NumberAnimation { target: d; property:"opacity"; to: 1; duration: 1000; }
            NumberAnimation { target: e; property:"opacity"; to: 1; duration: 1000; }
        }
    }
    ParallelAnimation {
        id: six
        running: false

        NumberAnimation { target: k; property:"opacity"; to: 0.4; duration: 1000; easing.type: Easing.InOutBounce}
        NumberAnimation { target: d; property:"opacity"; to: 0.4; duration: 1000; easing.type: Easing.InOutBounce}
        NumberAnimation { target: e; property:"opacity"; to: 0.4; duration: 1000; easing.type: Easing.InOutBounce}

        SequentialAnimation {
            PauseAnimation  { duration: 100 }
            NumberAnimation { target: spark; property: "opacity"; from:1; to: 0; duration: 5 }
            PauseAnimation  { duration: 200 }
            NumberAnimation { target: spark; property: "opacity"; from:0; to: 1; duration: 20 }
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

        AnimatedImage { id: light; source: "lighning.gif"; }

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
        source: "spark.png"
    }

    Letter { id:k; width: 140; lx: -21;  anchors.horizontalCenterOffset: -122 }
    Letter { id:d; width: 110; lx: -170; }
    Letter { id:e; width: 120; lx: -298; anchors.horizontalCenterOffset:  115 }


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

  
