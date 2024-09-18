import Qt3D.Core
import Qt3D.Extras
import Qt3D.Render

Entity {
    id: dynamicModel

    property alias source: mesh.source

    components: [
        Mesh {
            id: mesh
            source: "qrc:/assets/obj/Halo 3 Elephant_obj.obj"
        },
        PhongMaterial {}
    ]
}
