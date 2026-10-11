import Quickshell
import Quickshell.Wayland
import QtQuick

PanelWindow {
    id: root

    anchors {
        top: true
        bottom: true
        left: true
        right: true
    }

    color: "transparent"
    focusable: true
    exclusiveZone: 0

    WlrLayershell.layer: WlrLayer.Overlay

    Item {
        anchors.fill: parent
        focus: true

        Keys.onEscapePressed: event => Qt.quit()

        Rectangle {
            id: panel
            width: 530
            height: 250
            anchors.centerIn: parent

            color: "#F0090D16"
            border.color: "#6630DDEB"
            border.width: 1

            MouseArea {
                anchors.fill: parent
                onClicked: mouse => mouse.accepted = false
                z: -1
            }

            Rectangle {
                width: parent.width
                height: 2
                anchors.top: parent.top
                color: "#27E8F4"
            }

            Text {
                x: 24
                y: 19
                text: "NEON//VOID"
                color: "#27E8F4"
                font.family: "JetBrainsMono Nerd Font"
                font.pixelSize: 17
                font.bold: true
            }

            Text {
                x: 25
                y: 43
                text: "SYSTEM CONTROL / SESSION TERMINAL"
                color: "#73899E"
                font.family: "JetBrainsMono Nerd Font"
                font.pixelSize: 9
            }

            Rectangle {
                x: 24
                y: 62
                width: parent.width - 48
                height: 1
                color: "#303947"
            }

            Grid {
                x: 25
                y: 77
                columns: 3
                spacing: 10

                Repeater {
                    model: [
                        { label: "LOCK", sub: "SESSION SECURE", color: "#27E8F4", command: ["hyprlock"] },
                        { label: "LOGOUT", sub: "END SESSION", color: "#B18AFF", command: ["hyprctl", "dispatch", "exit"] },
                        { label: "SUSPEND", sub: "SLEEP MODE", color: "#9BDFC5", command: ["systemctl", "suspend"] },
                        { label: "HIBERNATE", sub: "DEEP SLEEP", color: "#B18AFF", command: ["systemctl", "hibernate"] },
                        { label: "REBOOT", sub: "RESTART SYSTEM", color: "#F04DCE", command: ["systemctl", "reboot"] },
                        { label: "SHUTDOWN", sub: "POWER OFF", color: "#FF5277", command: ["systemctl", "poweroff"] }
                    ]

                    delegate: Rectangle {
                        id: actionButton
                        required property var modelData

                        width: 150
                        height: 60
                        property bool hovered: false

                        color: hovered ? "#252033" : "#111722"
                        border.width: 1
                        border.color: hovered ? modelData.color : "#303947"

                        Rectangle {
                            width: 3
                            height: parent.height
                            color: actionButton.modelData.color
                        }

                        Column {
                            anchors.centerIn: parent
                            spacing: 5

                            Text {
                                anchors.horizontalCenter: parent.horizontalCenter
                                text: actionButton.modelData.label
                                color: actionButton.modelData.color
                                font.family: "JetBrainsMono Nerd Font"
                                font.pixelSize: 12
                                font.bold: true
                            }

                            Text {
                                anchors.horizontalCenter: parent.horizontalCenter
                                text: actionButton.modelData.sub
                                color: "#718296"
                                font.family: "JetBrainsMono Nerd Font"
                                font.pixelSize: 8
                            }
                        }

                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onEntered: actionButton.hovered = true
                            onExited: actionButton.hovered = false

                            onClicked: {
                                console.log("Power-Aktion:", actionButton.modelData.label)
                                Quickshell.execDetached(actionButton.modelData.command)
                                Qt.quit()
                            }
                        }
                    }
                }
            }

            Text {
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 8
                anchors.horizontalCenter: parent.horizontalCenter
                text: "ESC / ABORT  •  SELECT ACTION"
                color: "#536879"
                font.family: "JetBrainsMono Nerd Font"
                font.pixelSize: 9
            }
        }
    }
}
