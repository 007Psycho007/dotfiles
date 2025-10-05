import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

import Quickshell
import Quickshell.Hyprland
import Quickshell.Services.Mpris
import Quickshell.Services.SystemTray
import Quickshell.Services.UPower
import Quickshell.Io

PanelWindow {
    id: bar
    anchors { top: true; left: true; right: true }
    height: 40   // bar height only

    exclusiveZone: height
    aboveWindows: true
    focusable: false

    // === OneDark palette ===
    property color bg: "#282c34"
    property color fg: "#abb2bf"
    property color dim: "#5c6370"
    property color border: "#3e4451"
    property color accent: "#61afef"

    property int   pad: 8
    property string fontFamily: "JetBrainsMono Nerd Font"

    // --- Workspace icon maps (EDIT THESE) ---
    // Map by numeric ID (as strings). Example icons shown; swap as you like.
    property var wsIconById: ({
        "1": "",   // web
        "2": "",   // code
        "3": "",   // chat
        "4": "",   // music
        "5": ""    // games
        // add more: "6": "", ...
    })
    // Optional map by workspace *name* (if you name workspaces in Hyprland)
    property var wsIconByName: ({
        "web":  "",
        "code": "",
        "chat": "",
        "music":"",
        "game": ""
        // add more names here
    })
    // Helper: pick icon by name first, then ID, else fall back to the number
    function wsIconFor(ws) {
        var n = (ws.name || "").toString();
        if (n.length && wsIconByName[n] !== undefined) return wsIconByName[n];
        var k = String(ws.id);
        if (wsIconById[k] !== undefined) return wsIconById[k];
        return k; // fallback to numeric label
    }

    Process {
        id: rofiProc
        command: ["bash","-lc","rofi -show drun"]
    }

    Rectangle {
        anchors.fill: parent
        color: bg

        RowLayout {
            anchors.fill: parent
            anchors.margins: pad
            spacing: 12

            // === LEFT cluster ===
            RowLayout {
                spacing: 8
                Layout.alignment: Qt.AlignVCenter

                // launcher button (Nerd Font Arch glyph as Endeavour-ish)
                ToolButton {
                    text: ""
                    font.family: fontFamily
                    onClicked: rofiProc.running = true
                    ToolTip.text: "Launch apps (rofi)"
                    background: Rectangle { color: "transparent" }
                    contentItem: Label {
                        text: parent.text
                        font: parent.font
                        color: accent
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }

                // Workspaces — now using icons
                Repeater {
                    model: Hyprland.workspaces
                    delegate: Rectangle {
                        required property var modelData
                        height: parent ? parent.height : 20
                        radius: 6
                        color: (Hyprland.focusedWorkspace
                                && Hyprland.focusedWorkspace.id === modelData.id)
                               ? border : "transparent"
                        border.color: border
                        border.width: 1
                        implicitWidth: Math.max(28, label.implicitWidth + 14)

                        MouseArea {
                            anchors.fill: parent
                            onClicked: Hyprland.dispatch("workspace " + modelData.id)
                            hoverEnabled: true
                            ToolTip.visible: containsMouse
                            ToolTip.text: (modelData.name && modelData.name.length)
                                          ? ("WS " + modelData.id + " — " + modelData.name)
                                          : ("WS " + modelData.id)
                        }
                        Label {
                            id: label
                            anchors.centerIn: parent
                            // 🔽 icon lookup here
                            text: bar.wsIconFor(modelData)
                            color: fg
                            font.pixelSize: 12
                            font.family: fontFamily
                        }
                    }
                }
            }

            Item { Layout.fillWidth: true }

            // === center clock ===
            Label {
                id: clock
                color: fg
                font.pixelSize: 14
                font.bold: true
                font.family: fontFamily
                text: Qt.formatDateTime(new Date(), "ddd dd MMM  HH:mm")
                Layout.alignment: Qt.AlignVCenter
                Timer {
                    interval: 1000; repeat: true; running: true
                    onTriggered: clock.text = Qt.formatDateTime(new Date(), "ddd dd MMM  HH:mm")
                }
            }

            Item { Layout.fillWidth: true }

            // === right cluster ===
            RowLayout {
                spacing: 12
                Layout.alignment: Qt.AlignVCenter

                // mpris
                RowLayout {
                    spacing: 6
                    property var player: Mpris.players.length ? Mpris.players[0] : null
                    visible: player && player.canPlay

                    ToolButton { text: ""; font.family: fontFamily; onClicked: parent.player && parent.player.previous() }
                    ToolButton {
                        text: parent.player && parent.player.playbackState === Mpris.Playing ? "" : ""
                        font.family: fontFamily
                        onClicked: parent.player && parent.player.togglePlaying()
                    }
                    ToolButton { text: ""; font.family: fontFamily; onClicked: parent.player && parent.player.next() }
                    Label {
                        color: dim
                        font.pixelSize: 12
                        font.family: fontFamily
                        elide: Text.ElideRight
                        Layout.preferredWidth: 180
                        text: parent.player ? (parent.player.artist + " — " + parent.player.title) : ""
                    }
                }

                // battery
                RowLayout {
                    spacing: 6
                    visible: UPower.displayDevice.ready

                    Label {
                        color: fg
                        font.pixelSize: 14
                        font.family: fontFamily
                        text: {
                            var p = Math.round(UPower.displayDevice.percentage);
                            var charging = UPower.onBattery ? "" : "";
                            var ico = p>=90?"":p>=70?"":p>=50?"":p>=30?"":"";
                            charging + ico;
                        }
                    }
                    Label {
                        color: fg
                        font.pixelSize: 12
                        font.family: fontFamily
                        text: Math.round(UPower.displayDevice.percentage) + "%"
                    }
                }

                // tray
                RowLayout {
                    Repeater {
                        model: SystemTray.items
                        delegate: ToolButton {
                            required property var modelData
                            text: ""
                            font.family: fontFamily
                            onClicked: modelData.activate()
                            ToolTip.text: modelData.title
                        }
                    }
                }
            }
        }
    }
}

