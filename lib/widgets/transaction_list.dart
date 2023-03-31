import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteT;

  TransactionList(this.transactions,this.deleteT);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                  child: ListTile(
                    leading: CircleAvatar(radius: 30, 
                    child: Padding
                    (
                      padding: EdgeInsets.all(6)  ,
                      child: FittedBox(child: Text(transactions[index].amount.toString()))),
                    ),
                    title: Text(transactions[index].title),
                    subtitle: Text(DateFormat.yMMMd().format(transactions[index].date)),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).primaryColor,
                      onPressed:()=>deleteT(transactions[index].id),
                    )

                    
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
