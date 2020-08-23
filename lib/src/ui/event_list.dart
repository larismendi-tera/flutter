import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:myapp/src/blocs/event_bloc.dart';

class EventList extends StatelessWidget {
  const EventList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EventBloc>.reactive(
        viewModelBuilder: () => EventBloc(),
        onModelReady: (model) => model.getEventsList(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: Colors.white,
              floatingActionButton: FloatingActionButton(
                backgroundColor: Theme.of(context).primaryColor,
                child: Icon(Icons.add),
                onPressed: () {},
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 32),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                          child: Image.asset('assets/images/title.png'),
                        ),
                      ],
                    ),
                    Expanded(
                        child: model.events != null
                            ? ListView.builder(
                                itemCount: model.events.length,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                  onTap: () {},
                                  child: Text('Example'),
                                  // PostItem(
                                  //   //crear un widget
                                  //   post: model.events[index],
                                  //   onDeleteItem: () =>
                                  //       model.deleteEvent(index),
                                  // ),
                                ),
                              )
                            : Center(
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation(
                                      Theme.of(context).primaryColor),
                                ),
                              ))
                  ],
                ),
              ),
            ));
  }
}
