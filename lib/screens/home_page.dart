import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapp/coffee_model.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GoogleMapController? _controller;
  List<Marker> _allMarkers = [];
  PageController? _pageController;
  int? _prevPage;
  String? _errorMessage;
  bool _isSearchBarVisible = true;

  @override
  void initState() {
    super.initState();
    _requestPermissions();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8)
      ..addListener(_onScroll);
  }

  Future<void> _requestPermissions() async {
    final status = await Permission.location.request();
    if (status.isGranted) {
      _updateMarkers();
    } else {
      setState(() {
        _errorMessage = 'Location permission denied. Map cannot be loaded.';
      });
    }
  }

  void _updateMarkers() {
    try {
      if (coffeeShops.isEmpty) {
        setState(() {
          _errorMessage = 'No coffee shops available.';
          _allMarkers = [];
        });
        return;
      }
      setState(() {
        _allMarkers = coffeeShops.asMap().entries.map((entry) {
          final index = entry.key;
          final element = entry.value;
          return Marker(
            markerId: MarkerId(element.shopName),
            draggable: false,
            infoWindow: InfoWindow(
              title: element.shopName,
              snippet:
                  element.address.substring(0, 20) +
                  '\n' +
                  element.description.substring(
                    0,
                    30,
                  ), // Shorten and break lines
            ),
            position: element.locationCoords,
            icon: BitmapDescriptor.defaultMarkerWithHue(
              _prevPage == index
                  ? BitmapDescriptor.hueBlue
                  : BitmapDescriptor.hueRed,
            ),
            anchor: _prevPage == index
                ? const Offset(0.5, 1.0)
                : const Offset(0.5, 0.5),
            onTap: () {
              setState(() {
                _prevPage = index;
                _pageController?.jumpToPage(index);
                if (_controller != null) {
                  _controller!.showMarkerInfoWindow(MarkerId(element.shopName));
                }
              });
              _moveCamera();
              _updateMarkers();
            },
          );
        }).toList();
        _errorMessage = null;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Error updating markers: $e';
      });
    }
  }

  void _addMarkers() {
    _updateMarkers();
  }

  void _onScroll() {
    if (_pageController!.page!.toInt() != _prevPage) {
      _prevPage = _pageController!.page!.toInt();
      if (_prevPage! < coffeeShops.length) {
        _moveCamera();
        if (_controller != null) {
          _controller!.showMarkerInfoWindow(
            MarkerId(coffeeShops[_prevPage!].shopName),
          );
        }
        _updateMarkers();
      }
    }
  }

  Future<void> _moveCamera() async {
    if (_controller != null && _pageController!.page != null) {
      final index = _pageController!.page!.toInt();
      if (index < coffeeShops.length) {
        final currentZoom = await _controller!.getZoomLevel();
        _controller!.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: coffeeShops[index].locationCoords,
              zoom: currentZoom,
              //bearing: 45.0,
              //tilt: 45.0,
            ),
          ),
        );
      }
    }
  }

  Widget _coffeeShopList(int index) {
    return AnimatedBuilder(
      animation: _pageController!,
      builder: (BuildContext context, Widget? widget) {
        double value = 1;
        if (_pageController!.position.haveDimensions) {
          value = _pageController!.page! - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 125.0,
            width: Curves.easeInOut.transform(value) * 350.0,
            child: widget,
          ),
        );
      },
      child: InkWell(
        onTap: () {
          setState(() {
            _prevPage = index;
            _pageController?.jumpToPage(index);
            if (_controller != null) {
              _controller!.showMarkerInfoWindow(
                MarkerId(coffeeShops[index].shopName),
              );
            }
          });
          _moveCamera();
          _updateMarkers();
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          height: 125.0,
          width: 275.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                offset: Offset(0.0, 4.0),
                blurRadius: 10.0,
              ),
            ],
            color: Colors.white,
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                ),
                child: Container(
                  height: 125.0,
                  width: 80.0,
                  color: Colors.grey[200],
                  child: Image.network(
                    coffeeShops[index].thumbNail,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(Icons.error, color: Colors.red),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(width: 5.0),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        coffeeShops[index].shopName,
                        style: const TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        coffeeShops[index].address,
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Flexible(
                        child: Text(
                          coffeeShops[index].description,
                          style: const TextStyle(
                            fontSize: 11.0,
                            fontWeight: FontWeight.w300,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_errorMessage != null) {
      return Scaffold(body: Center(child: Text(_errorMessage!)));
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                initialCameraPosition: const CameraPosition(
                  target: LatLng(28.5301, 77.2517), // South Delhi
                  zoom: 12.5,
                ),
                markers: Set.from(_allMarkers),
                zoomGesturesEnabled: true,
                zoomControlsEnabled: false,
                padding: const EdgeInsets.only(top: 80.0, right: 20.0),
                onMapCreated: (controller) {
                  setState(() {
                    _controller = controller;
                    if (_allMarkers.isNotEmpty) {
                      _moveCamera();
                    }
                  });
                },
                onTap: (position) {
                  if (_controller != null && _allMarkers.isNotEmpty) {
                    _controller!.hideMarkerInfoWindow(
                      MarkerId(coffeeShops[_prevPage ?? 0].shopName),
                    );
                  }
                },
              ),
            ),
            Positioned(
              top: 10.0,
              left: 16.0,
              right: 16.0,
              child: AnimatedOpacity(
                opacity: _isSearchBarVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: SearchBar(
                  leading: const Icon(Icons.search),
                  trailing: const [
                    Icon(Icons.mic),
                    SizedBox(width: 8.0),
                    Icon(Icons.close),
                  ],
                  hintText: 'Search coffee shops',
                  elevation: MaterialStateProperty.all(1.0),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  textStyle: MaterialStateProperty.all(
                    const TextStyle(fontSize: 16.0),
                  ),
                  onChanged: (value) {
                    // Placeholder for future search logic
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: ClipRect(
                child: Container(
                  height: 150.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, -5),
                      ),
                    ],
                  ),
                  child: coffeeShops.isEmpty
                      ? const Center(child: Text('No coffee shops available'))
                      : PageView.builder(
                          controller: _pageController,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: coffeeShops.length,
                          itemBuilder: (BuildContext context, int index) {
                            return _coffeeShopList(index);
                          },
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    _pageController?.dispose();
    super.dispose();
  }
}
