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

    // Leichte Abdunklung des Desktops hinter dem Menü
    color: "#9E050810"
    focusable: true
    exclusiveZone: 0

    WlrLayershell.layer: WlrLayer.Overlay

    Item {
        id: scope
        anchors.fill: parent
        focus: true

        property int currentIndex: 0
        readonly property int columns: 3

        readonly property var actions: [
            { label: "LOCK",      sub: "SESSION SECURE", key: "L", icon: "\uf023", color: "#27E8F4", command: ["hyprlock"] },
            { label: "LOGOUT",    sub: "END SESSION",    key: "O", icon: "\uf08b", color: "#B18AFF", command: ["hyprctl", "dispatch", "exit"] },
            { label: "SUSPEND",   sub: "SLEEP MODE",     key: "S", icon: "\uf186", color: "#9BDFC5", command: ["systemctl", "suspend"] },
            { label: "HIBERNATE", sub: "DEEP SLEEP",     key: "H", icon: "\uf236", color: "#B18AFF", command: ["systemctl", "hibernate"] },
            { label: "REBOOT",    sub: "RESTART SYSTEM", key: "R", icon: "\uf021", color: "#F04DCE", command: ["systemctl", "reboot"] },
            { label: "SHUTDOWN",  sub: "POWER OFF",      key: "P", icon: "\uf011", color: "#FF5277", command: ["systemctl", "poweroff"] }
        ]

        function run(i) {
            const a = actions[i]
            console.log("Power-Aktion:", a.label)
            Quickshell.execDetached(a.command)
            Qt.quit()
        }

        Keys.onPressed: event => {
            const n = actions.length
            switch (event.key) {
            case Qt.Key_Escape:
                Qt.quit()
                break
            case Qt.Key_Left:
                currentIndex = (currentIndex + n - 1) % n
                break
            case Qt.Key_Right:
                currentIndex = (currentIndex + 1) % n
                break
            case Qt.Key_Up:
                if (currentIndex >= columns) currentIndex -= columns
                break
            case Qt.Key_Down:
                if (currentIndex + columns < n) currentIndex += columns
                break
            case Qt.Key_Return:
            case Qt.Key_Enter:
                run(currentIndex)
                break
            default: {
                const k = event.text.toUpperCase()
                for (let i = 0; i < n; i++) {
                    if (actions[i].key === k) {
                        run(i)
                        break
                    }
                }
            }
            }
        }

        // Klick neben das Menü schließt es
        MouseArea {
            anchors.fill: parent
            onClicked: Qt.quit()
        }

        Rectangle {
            id: panel
            width: 600
            height: 336
            anchors.centerIn: parent

            color: "#EB080C14"
            border.color: "#613E5B70"
            border.width: 1

            // Fängt Klicks im Panel ab, damit es nicht schließt
            MouseArea {
                anchors.fill: parent
            }

            // Cyan oben, Magenta unten – wie Waybar und Control Center
            Rectangle {
                width: parent.width
                height: 2
                anchors.top: parent.top
                color: "#27E8F4"
            }

            Rectangle {
                width: parent.width
                height: 2
                anchors.bottom: parent.bottom
                color: "#F04DCE"
            }

            Text {
                x: 28
                y: 20
                text: "◈ NEON//VOID"
                color: "#27E8F4"
                font.family: "JetBrainsMono Nerd Font"
                font.pixelSize: 17
                font.bold: true
            }

            Text {
                x: 29
                y: 45
                text: "SYSTEM CONTROL / SESSION TERMINAL"
                color: "#71869A"
                font.family: "JetBrainsMono Nerd Font"
                font.pixelSize: 9
            }

            Rectangle {
                x: 28
                y: 68
                width: parent.width - 56
                height: 1
                color: "#613E5B70"
            }

            Grid {
                x: 28
                y: 86
                columns: scope.columns
                spacing: 14

                Repeater {
                    model: scope.actions

                    delegate: Rectangle {
                        id: actionButton
                        required property var modelData
                        required property int index

                        readonly property bool selected: scope.currentIndex === index
                        readonly property color accent: modelData.color

                        width: 172
                        height: 96

                        color: selected
                            ? Qt.rgba(accent.r, accent.g, accent.b, 0.13)
                            : "#CC0E1622"
                        border.width: 1
                        border.color: selected
                            ? Qt.rgba(accent.r, accent.g, accent.b, 0.55)
                            : "#613E5B70"

                        // Akzentleiste links
                        Rectangle {
                            width: 3
                            height: parent.height
                            color: actionButton.accent
                        }

                        // Unterkante bei Auswahl, wie beim aktiven Workspace
                        Rectangle {
                            width: parent.width
                            height: 2
                            anchors.bottom: parent.bottom
                            color: actionButton.accent
                            visible: actionButton.selected
                        }

                        Text {
                            x: 20
                            anchors.verticalCenter: parent.verticalCenter
                            text: actionButton.modelData.icon
                            color: actionButton.selected ? actionButton.accent : Qt.rgba(actionButton.accent.r, actionButton.accent.g, actionButton.accent.b, 0.75)
                            font.family: "JetBrainsMono Nerd Font"
                            font.pixelSize: 28
                        }

                        Column {
                            x: 68
                            anchors.verticalCenter: parent.verticalCenter
                            spacing: 5

                            Text {
                                text: actionButton.modelData.label
                                color: actionButton.selected ? actionButton.accent : "#D8E6F2"
                                font.family: "JetBrainsMono Nerd Font"
                                font.pixelSize: 12
                                font.bold: true
                            }

                            Text {
                                text: actionButton.modelData.sub
                                color: "#71869A"
                                font.family: "JetBrainsMono Nerd Font"
                                font.pixelSize: 8
                            }
                        }

                        // Tastenkürzel oben rechts
                        Text {
                            anchors.top: parent.top
                            anchors.right: parent.right
                            anchors.margins: 8
                            text: actionButton.modelData.key
                            color: actionButton.selected ? actionButton.accent : "#465769"
                            font.family: "JetBrainsMono Nerd Font"
                            font.pixelSize: 9
                            font.bold: true
                        }

                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onEntered: scope.currentIndex = actionButton.index
                            onClicked: scope.run(actionButton.index)
                        }
                    }
                }
            }

            Text {
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 14
                anchors.horizontalCenter: parent.horizontalCenter
                text: "←↑↓→ NAVIGIEREN   •   ⏎ AUSFÜHREN   •   ESC ABBRECHEN"
                color: "#465769"
                font.family: "JetBrainsMono Nerd Font"
                font.pixelSize: 9
            }
        }
    }
}
