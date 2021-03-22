import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DownloadButtonDemo extends StatefulWidget {
  DownloadButtonDemo({Key key}) : super(key: key);

  @override
  _DownloadButtonDemoState createState() => _DownloadButtonDemoState();
}

class _DownloadButtonDemoState extends State<DownloadButtonDemo> {
  DownloadController downloadController;

  void _openDownload() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Open App 1'),
      ),
    );
  }

  @override
  void initState() {
    downloadController =
        SimulatedDownloadController(onOpenDownload: _openDownload);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("下载按钮"),
      ),
      body: ListTile(
        leading: const DemoAppIcon(),
        title: Text(
          'App 1',
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.headline6,
        ),
        subtitle: Text(
          'Lorem ipsum dolor 1',
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.caption,
        ),
        trailing: SizedBox(
          width: 96.0,
          child: AnimatedBuilder(
            animation: downloadController,
            builder: (context, child) {
              return DownloadButton(
                status: downloadController.downloadStatus,
                progress: downloadController.progress,
                onDownload: downloadController.startDownload,
                onCancel: downloadController.stopDownload,
                onOpen: downloadController.openDownload,
              );
            },
          ),
        ),
      ),
    );
  }
}

abstract class DownloadController implements ChangeNotifier {
  DownloadStatus get downloadStatus;
  double get progress;

  void startDownload();
  void stopDownload();
  void openDownload();
}

//类似一个model类，管理了DownButton的所有状态，如果状态改变，调用notifyListeners通知ui更新
class SimulatedDownloadController extends DownloadController
    with ChangeNotifier {
  SimulatedDownloadController({
    DownloadStatus downloadStatus = DownloadStatus.notDownloaded,
    double progress = 0.0,
    @required VoidCallback onOpenDownload,
  })  : _downloadStatus = downloadStatus,
        _progress = progress,
        _onOpenDownload = onOpenDownload;

  DownloadStatus _downloadStatus;
  @override
  DownloadStatus get downloadStatus => _downloadStatus;

  double _progress;
  @override
  double get progress => _progress;

  final VoidCallback _onOpenDownload;

  bool _isDownloading = false;

  @override
  void startDownload() {
    if (downloadStatus == DownloadStatus.notDownloaded) {
      _doSimulatedDownload();
    }
  }

  @override
  void stopDownload() {
    if (_isDownloading) {
      _isDownloading = false;
      _downloadStatus = DownloadStatus.notDownloaded;
      _progress = 0.0;
      notifyListeners();
    }
  }

  @override
  void openDownload() {
    if (downloadStatus == DownloadStatus.downloaded) {
      _onOpenDownload();
    }
  }

  Future<void> _doSimulatedDownload() async {
    _isDownloading = true;
    _downloadStatus = DownloadStatus.fetchingDownload;
    notifyListeners();

    // Wait a second to simulate fetch time.
    await Future<void>.delayed(const Duration(seconds: 1));

    // If the user chose to cancel the download, stop the simulation.
    if (!_isDownloading) {
      return;
    }

    // Shift to the downloading phase.
    _downloadStatus = DownloadStatus.downloading;
    notifyListeners();

    const downloadProgressStops = [0.0, 0.15, 0.45, 0.80, 1.0];
    for (final stop in downloadProgressStops) {
      // Wait a second to simulate varying download speeds.
      await Future<void>.delayed(const Duration(seconds: 1));

      // If the user chose to cancel the download, stop the simulation.
      if (!_isDownloading) {
        return;
      }

      // Update the download progress.
      _progress = stop;
      notifyListeners();
    }

    // Wait a second to simulate a final delay.
    await Future<void>.delayed(const Duration(seconds: 1));

    // If the user chose to cancel the download, stop the simulation.
    if (!_isDownloading) {
      return;
    }

    // Shift to the downloaded state, completing the simulation.
    _downloadStatus = DownloadStatus.downloaded;
    _isDownloading = false;
    notifyListeners();
  }
}

@immutable
class DemoAppIcon extends StatelessWidget {
  const DemoAppIcon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*AspectRatio作用于父控件，根据aspectRatio计算父控件的宽或者高，AspectRatio的子控件将填充满父控件，子控件的宽高无效。
    强制子部件的宽度和高度具有给定的宽高比,可以父容器给定一个宽或者高，来换算另一个值*/
    return const AspectRatio(
      aspectRatio: 1.0,
      child: FittedBox(
        child: SizedBox(
          width: 80.0,
          height: 80.0,
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.red, Colors.blue],
              ),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            child: Center(
              child: Icon(
                Icons.ac_unit,
                color: Colors.white,
                size: 40.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum DownloadStatus {
  notDownloaded,
  fetchingDownload,
  downloading,
  downloaded,
}

@immutable
class DownloadButton extends StatefulWidget {
  DownloadButton({
    Key key,
    this.transitionDuration = const Duration(microseconds: 500),
    this.progress = 0.0,
    @required this.status,
    @required this.onDownload,
    @required this.onCancel,
    @required this.onOpen,
  }) : super(key: key);

  final DownloadStatus status;
  final Duration transitionDuration;
  final double progress;
  final VoidCallback onDownload;
  final VoidCallback onCancel;
  final VoidCallback onOpen;
  @override
  _DownloadButtonState createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
  bool get _isDownloading => widget.status == DownloadStatus.downloading;

  bool get _isFetching => widget.status == DownloadStatus.fetchingDownload;

  bool get _isDownloaded => widget.status == DownloadStatus.downloaded;

  void _onPressed() {
    switch (widget.status) {
      case DownloadStatus.notDownloaded:
        widget.onDownload();
        break;
      case DownloadStatus.fetchingDownload:
        // do nothing.
        break;
      case DownloadStatus.downloading:
        widget.onCancel();
        break;
      case DownloadStatus.downloaded:
        widget.onOpen();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onPressed,
      child: Stack(
        children: [
          _buildButtonShape(
            child: _buildText(),
          ),
          _buildDownloadingProgress(),
        ],
      ),
    );
  }

  Widget _buildButtonShape({
    @required Widget child,
  }) {
    return AnimatedContainer(
      duration: widget.transitionDuration,
      curve: Curves.ease,
      width: double.infinity,
      decoration: _isDownloading || _isFetching
          ? ShapeDecoration(
              shape: const CircleBorder(),
              color: Colors.white.withOpacity(0.0),
            )
          : const ShapeDecoration(
              shape: StadiumBorder(),
              color: CupertinoColors.lightBackgroundGray,
            ),
      child: child,
    );
  }

  Widget _buildText() {
    final text = _isDownloaded ? 'OPEN' : 'GET';
    final opacity = _isFetching || _isDownloading ? 0.0 : 1.0;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: AnimatedOpacity(
        opacity: opacity,
        duration: widget.transitionDuration,
        curve: Curves.ease,
        child: Text(text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.button?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.activeBlue,
                )),
      ),
    );
  }

  Widget _buildDownloadingProgress() {
    return Positioned.fill(
        child: AnimatedOpacity(
      opacity: _isDownloading || _isFetching ? 1.0 : 0.0,
      duration: widget.transitionDuration,
      curve: Curves.ease,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _buildProgressIndicator(),
          if (_isDownloading)
            const Icon(
              Icons.stop,
              size: 14.0,
              color: CupertinoColors.activeBlue,
            ),
        ],
      ),
    ));
  }

  Widget _buildProgressIndicator() {
    return AspectRatio(
      aspectRatio: 1.0,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.0, end: widget.progress),
        duration: const Duration(milliseconds: 200),
        builder: (BuildContext context, double progress, Widget child) {
          return CircularProgressIndicator(
            backgroundColor: _isDownloading
                ? CupertinoColors.lightBackgroundGray
                : Colors.white.withOpacity(0.0),
            valueColor: AlwaysStoppedAnimation(_isFetching
                ? CupertinoColors.lightBackgroundGray
                : CupertinoColors.activeBlue),
            strokeWidth: 2.0,
            value: _isFetching ? null : progress,
          );
        },
      ),
    );
  }
}
