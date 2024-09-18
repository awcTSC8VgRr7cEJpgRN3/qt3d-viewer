import Qt3D.Core
import Qt3D.Extras
import Qt3D.Render

Entity {
    id: h3Elephant

    PhongMaterial {
        id: h3ElephantMaterial
    }

    Mesh {
        id: h3ElephantMesh
        source: "qrc:/assets/obj/Halo 3 Elephant_obj.obj"
    }

    components: [
        h3ElephantMesh,
        h3ElephantMaterial
    ]
}
