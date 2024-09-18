// Copyright (C) 2019 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

import QtQuick
// import QtQuick3D
import QtQuick.Controls
import QtQuick.Dialogs
import QtQuick.Scene3D // 2.0

Window {
    visible: true
    width: 1280
    height: 720
    title: "3D Viewer"

    // 2D UI layer for the button
    Rectangle {
        anchors.fill: parent
        color: "transparent" // Ensure it's transparent to see the 3D content behind

        Scene3D {
            id: scene3d
            anchors.fill: parent
            anchors.margins: 10
            focus: true
            aspects: ["input", "logic"]
            cameraAspectRatioMode: Scene3D.AutomaticAspectRatio

            //Loading ThreeDimensionalScene.qml for better code style
            ThreeDimensionalScene{
                id: threeDScene
            }
        }

        // Button to open file dialog
        Button {
            text: "Open OBJ File"
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: fileDialog.open()
        }
    }

    // FileDialog to select .obj file
    FileDialog {
        id: fileDialog
        title: "Select an OBJ file"
        nameFilters: ["Wavefront OBJ (*.obj)"]
        onAccepted: {
            loadModel(selectedFile)
        }
    }

    // Function to dynamically load the model
    function loadModel(selectedFile) {
        var component = Qt.createComponent("DynamicModel.qml");

        if (component.status === Component.Ready) {
            // TODO
            // `threeDScene.sceneRoot` not work.
            var dynamicModel = component.createObject(threeDScene.sceneRoot);

            if (dynamicModel === null) {
                console.log("Error creating dynamic model");
                return;
            }

            // TODO
            // `dynamicModel.source` not work.
            dynamicModel.source = selectedFile;

            // console.log("Model loaded successfully:", selectedFile);
            console.log("Model found successfully:", selectedFile);
        } else if (component.status === Component.Error) {
            console.log("Error loading component:", component.errorString());
        }
    }
}
