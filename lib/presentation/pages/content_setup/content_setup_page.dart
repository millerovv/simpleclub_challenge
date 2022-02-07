import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpleclub_challenge/presentation/bloc/content_cubit.dart';
import 'package:simpleclub_challenge/presentation/routing/app_router.dart';

class ContentSetupRoute extends CupertinoPageRoute {
  ContentSetupRoute({required String routeName})
      : super(builder: (ctx) => const ContentSetupPage(), settings: RouteSettings(name: routeName));
}

class ContentSetupPage extends StatefulWidget {
  const ContentSetupPage({Key? key}) : super(key: key);

  @override
  _ContentSetupPageState createState() => _ContentSetupPageState();
}

class _ContentSetupPageState extends State<ContentSetupPage> {
  late ContentCubit _contentCubit;

  final _contentIdFocus = FocusNode();
  final _contentIdFieldController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _contentCubit = context.read();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 300));
      _contentIdFocus.requestFocus();
    });
  }

  @override
  void dispose() {
    _contentIdFocus.dispose();
    _contentIdFieldController.dispose();
    super.dispose();
  }

  void _onContentStateUpdate(BuildContext context, ContentState state) {
    if (state.stateType == ContentStateType.success) {
      Navigator.of(context).pushReplacementNamed(homeRouteName);
    }
  }

  void _onLoadTap() {
    if (_formKey.currentState?.validate() ?? false) {
      final contentId = _contentIdFieldController.text.trim();
      _contentCubit.loadContent(contentId: contentId);
    }
  }

  @override
  Widget build(BuildContext context) => BlocListener(
        bloc: _contentCubit,
        listener: _onContentStateUpdate,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              bottom: false,
              child: BlocBuilder(
                bloc: _contentCubit,
                builder: (context, ContentState contentState) => Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: IgnorePointer(
                    ignoring: contentState.stateType == ContentStateType.loading,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        const Text('Please enter ID of the content that you would like to test'),
                        const SizedBox(height: 24),
                        _buildForm(),
                        if (contentState.stateType == ContentStateType.error)
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              'Failed to load content. Change your ID or try again later',
                              style: Theme.of(context).textTheme.bodyText2?.copyWith(color: const Color(0xFFD24848)),
                            ),
                          ),
                        const SizedBox(height: 24),
                        _buildLoadButton(contentState),
                        const SizedBox(height: 24),
                        const Spacer(flex: 2),
                      ],
                    ),
                  ),
                ),
              ),
            )),
      );

  Widget _buildForm() => Form(
        key: _formKey,
        child: TextFormField(
          controller: _contentIdFieldController,
          focusNode: _contentIdFocus,
          onFieldSubmitted: (_) => _onLoadTap(),
          validator: (text) => text == null || text.trim().isEmpty ? 'Please enter Content ID' : null,
          decoration: const InputDecoration(labelText: 'Content ID'),
        ),
      );

  Widget _buildLoadButton(ContentState contentState) {
    bool isLoading = contentState.stateType == ContentStateType.loading;
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: isLoading ? 0.5 : 1.0,
          child: ElevatedButton(
            child: const Text('Load'),
            onPressed: _onLoadTap,
            style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(44)),
          ),
        ),
        if (isLoading)
          const Align(
              alignment: Alignment.center,
              child: SizedBox(height: 24, width: 24, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 3))),
      ],
    );
  }
}
