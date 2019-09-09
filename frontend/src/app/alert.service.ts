import {Injectable} from '@angular/core';
import {Subject} from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AlertService {
  message: Subject<string>;

  constructor() {
    this.message = new Subject<string>();
  }

  sendMsg(msg: string) {
    this.message.next(msg);
  }
}
