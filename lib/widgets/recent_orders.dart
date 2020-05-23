import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodified/data/data.dart';
import 'package:foodified/models/order.dart';

class Recent_Orders extends StatelessWidget {

  // -- Build order view List items
  _buildRecentOrder(BuildContext context, Order order) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: 290.0,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          width: 1.0,
          color: Colors.grey[200]
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image(
                    image: AssetImage(order.food.imageUrl),
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          order.food.name,
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 5.0,),
                        Text(
                          order.restaurant.name,
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 5.0,),
                        Text(
                          order.date,
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            width: 48.0,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(30.0)
            ),
            child: IconButton(
              icon: Icon(Icons.add,color: Colors.white,size: 30.0,),
              onPressed: (){},
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            "Recent Orders",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          height: 120.0,
//          color: Colors.blue,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            scrollDirection: Axis.horizontal,
            itemCount: currentUser.orders.length,
            itemBuilder: (BuildContext context, int index){
              Order _order = currentUser.orders[index];
              return _buildRecentOrder(context,_order);
            },
          ),
        ),
      ],
    );
  }

}
