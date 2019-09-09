import {Component, OnInit} from '@angular/core';
import {interval} from "rxjs";
import {switchMap} from "rxjs/operators";
import {Order} from "./order.model";
import {OrdersService} from "./orders.service";

@Component({
  selector: 'app-orders',
  templateUrl: './orders.component.html',
  styleUrls: ['./orders.component.sass']
})
export class OrdersComponent implements OnInit {

  orders: Order[];

  constructor(private ordersService: OrdersService) {
  }

  ngOnInit() {
    interval(3000)
      .pipe(switchMap(() => this.ordersService.getAll()))
      .subscribe(data => {
          this.orders = data;
        }
      );
  }

  ship(o: Order) {
    return this.ordersService.ship(o).subscribe((resp) => console.log(resp));
  }

  cancel(o: Order) {
    return this.ordersService.cancel(o).subscribe((resp) => console.log(resp));
  }
}
