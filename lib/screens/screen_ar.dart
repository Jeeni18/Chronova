import 'package:ar_flutter_plugin_updated/datatypes/config_planedetection.dart';
import 'package:ar_flutter_plugin_updated/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin_updated/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin_updated/models/ar_hittest_result.dart';
import 'package:flutter/material.dart';
import 'package:ar_flutter_plugin_updated/widgets/ar_view.dart';
import 'package:ar_flutter_plugin_updated/datatypes/node_types.dart';
import 'package:ar_flutter_plugin_updated/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin_updated/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin_updated/models/ar_node.dart';
import 'package:vector_math/vector_math_64.dart' as vector;


class SimpleARScreen extends StatefulWidget {
  const SimpleARScreen({super.key});

  @override
  State<SimpleARScreen> createState() => _SimpleARScreenState();
}

class _SimpleARScreenState extends State<SimpleARScreen> {
  late ARSessionManager arSessionManager;
  late ARObjectManager arObjectManager;
  ARNode? placedNode;

  @override
  void dispose() {
    arSessionManager.dispose();
    super.dispose();
  }

  void onARViewCreated(
    ARSessionManager sessionManager,
    ARObjectManager objectManager,
    ARAnchorManager anchorManager,
    ARLocationManager locationManager,
  ) {
    arSessionManager = sessionManager;
    arObjectManager = objectManager;

    arSessionManager.onInitialize(
      showFeaturePoints: true,
      showAnimatedGuide: true,
      showPlanes: true,
      handleTaps: true,
      handlePans: true,      // Enable move
      handleRotation: true,  // Enable rotate
      
    );

    arSessionManager.onPlaneOrPointTap = _onPlaneTapped;
  }

  Future<void> _onPlaneTapped(List<ARHitTestResult> hitTestResults) async {
    if (hitTestResults.isEmpty) return;

    // Remove previous node
    if (placedNode != null) {
      await arObjectManager.removeNode(placedNode!);
    }

    // Online 3D model (Duck GLB)
   const modelUrls = "https://jauhhihsmjrnbcmyezkr.supabase.co/storage/v1/object/public/chronova//stone_inscription_at_bhaktapur_durbar_square.glb";
  const myGirl = "https://jauhhihsmjrnbcmyezkr.supabase.co/storage/v1/object/public/chronova//stone_inscription_at_bhaktapur_durbar_square.glb";

    final newNode = ARNode(
      type: NodeType.webGLB,
      uri: myGirl, // Use local asset for simplicity
      scale: vector.Vector3.all(0.5),
      position: hitTestResults.first.worldTransform.getTranslation(),
    );

    final success = await arObjectManager.addNode(newNode);
    if (success == true) {
      setState(() => placedNode = newNode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(12),
      child: Stack(
        children: [
          ARView(
            onARViewCreated: onARViewCreated,
            planeDetectionConfig: PlaneDetectionConfig.horizontalAndVertical,
          ),
          if (placedNode == null)
            const Center(
              child: Text(
                "Point at the surface for AR experience!",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
        ],
      ),
    );
  }
}