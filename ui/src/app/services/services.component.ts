import {Component, OnInit} from '@angular/core';
import {HttpClient, HttpResponse} from '@angular/common/http';
import {TokenService} from "../token.service";

@Component({
  selector: 'app-game',
  templateUrl: './services.component.html',
  styleUrls: ['./services.component.scss']
})
export class ServicesComponent implements OnInit {

  alerts: Alert[] = [];

  constructor(private http: HttpClient, private tokenService: TokenService) {
  }

  ngOnInit() {
  }

  getServices(): Array<Service> {
    return [
      {id: 'mushrooms', name: 'Red Mushrooms', icon: 'mushroom.svg', path: '/api/mushrooms?color=red'},
      {id: 'mushrooms', name: 'Green Mushrooms', icon: 'mushroom.svg', path: '/api/mushrooms?color=green'},
      {id: 'library', name: 'Books', icon: 'library.svg', path: '/api/books'}];
  }


  get(service: Service) {
    const token = this.tokenService.token;
    this.http.get<HttpResponse<any>>(service.path, {headers: {authorization: token}})
      .subscribe(
        data => this.alerts.push({type: 'success', message: 'GET ' + service.path}),
        error => this.alerts.push({type: 'danger', message: 'GET ' + service.path + ' error: ' + error.message})
      );
  }

  post(service: Service) {
    const token = this.tokenService.token;
    this.http.post<HttpResponse<any>>(service.path, {who: 'cares'}, {headers: {authorization: token}})
      .subscribe(
        data => this.alerts.push({type: 'success', message: 'POST ' + service.path}),
        error => this.alerts.push({type: 'danger', message: 'POST ' + service.path + ' error: ' + error.message})
      );
  }

  close(alert: Alert) {
    this.alerts.splice(this.alerts.indexOf(alert), 1);
  }
}

export interface Service {
  id: string;
  name: string;
  icon: string;
  path: string;
}

interface Alert {
  type: string;
  message: string;
}
