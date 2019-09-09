import {Injectable} from '@angular/core';
import {HttpClient, HttpErrorResponse} from '@angular/common/http';
import {OAuthService} from 'angular-oauth2-oidc';
import {AlertService} from '../alert.service';
import {throwError} from 'rxjs';
import {catchError} from 'rxjs/operators';
import {Order} from './order.model';

@Injectable({
  providedIn: 'root'
})
export class OrdersService {

  constructor(private oauthService: OAuthService, private http: HttpClient, private alertService: AlertService) {
  }

  getAll() {
    return this.http
      .get<Order[]>('/orders', {headers: {Authorization: 'Bearer ' + this.oauthService.getAccessToken()}})
      .pipe(catchError(this.catchError.bind(this)));
  }

  cancel(o: Order) {
    o.status = 'CANCELLED';
    return this.update(o);
  }

  ship(o: Order) {
    o.status = 'SHIPPED';
    return this.update(o);
  }

  private update(o: Order) {
    return this.http
      .put<Order>(`/orders/${o.id}`, o, {headers: {Authorization: 'Bearer ' + this.oauthService.getAccessToken()}})
      .pipe(catchError(this.catchError.bind(this)));
  }

  catchError(error: HttpErrorResponse) {
    this.alertService.sendMsg(error.message);
    return throwError(error.message);
  }
}
