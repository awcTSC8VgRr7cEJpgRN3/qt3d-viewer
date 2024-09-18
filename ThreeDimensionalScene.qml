import Qt3D.Core // 2.0
import Qt3D.Render // 2.0
import Qt3D.Input // 2.0
import Qt3D.Extras // 2.0

//Creating the root scene
Entity {
    id: sceneRoot

    //Adding camera
    Camera {
        id: camera
        projectionType: CameraLens.PerspectiveProjection
        fieldOfView: 45
        nearPlane : 0.1
        farPlane : 1000.0
        position: Qt.vector3d( 0.0, 1.0, 600.0 )
        upVector: Qt.vector3d( 0.0, 1.0, 0.0 )
        viewCenter: Qt.vector3d( 0.0, 0.0, 0.0 )
    }

    FirstPersonCameraController {
        camera: camera
    }

    components: [
        RenderSettings {
            activeFrameGraph: ForwardRenderer {
                camera: camera
                clearColor: "transparent"
            }
        },
        InputSettings { }
    ]

    /*******************************************************************************/

    H3Elephant {}
}
