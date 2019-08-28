import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../../Base"
import "../../utils.js" as Utils

HColumnLayout {
    readonly property int progress: accountInfo.importing_key

    onProgressChanged: iconAnimation.restart()


    HRowLayout {
        HIcon {
            id: icon
            svgName: "import-keys"

            Layout.margins: currentSpacing

            SequentialAnimation {
                id: iconAnimation

                HNumberAnimation { target: icon; property: "opacity"; to: 0.6 }
                HNumberAnimation { target: icon; property: "opacity"; to: 1 }
            }
        }

        HLabel {
            text: qsTr("Importing decryption keys...")
            elide: Text.ElideRight

            Layout.fillWidth: true
            Layout.margins: currentSpacing
            Layout.leftMargin: 0
            Layout.rightMargin: 0
        }

        HLabel {
            text: qsTr("%1/%2")
                  .arg(Math.ceil(progressBar.value)).arg(progressBar.to)

            Layout.margins: currentSpacing
        }
    }

    ProgressBar {
        id: progressBar
        from: 0
        value: progress
        to: accountInfo.total_keys_to_import

        Behavior on value { HNumberAnimation { factor: 5 } }

        Layout.fillWidth: true
    }
}
