import {Component, OnInit} from '@angular/core';
import {HttpClient} from '@angular/common/http';
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
      {id: 'mushrooms', name: 'Red Mushrooms', icon: 'mushroom_red.svg', path: '/api/mushrooms'},
      {id: 'mushrooms', name: 'Green Mushrooms', icon: 'mushroom_green.svg', path: '/api/mushrooms'},
      {id: 'library', name: 'Books', icon: 'library.svg', path: '/api/books'}];
  }


  get(service: Service) {
    const token = this.tokenService.token;
    this.http.get(service.path, {headers: {authorization: token}, responseType: 'text'})
      .subscribe(
        data => this.alerts.push({type: 'success', message: 'GET ' + service.path}),
        error => this.alerts.push({type: 'danger', message: 'GET ' + service.path + ' error: ' + error.message})
      );
  }

  getBooks() {
    const token = this.tokenService.token;
    this.http.post('/api/books', {who: 'cares'}, {headers: {authorization: token}, responseType: 'text'})
      .subscribe(
        data => this.alerts.push({type: 'success', message: 'OK'}),
        error => this.alerts.push({type: 'danger', message: 'ERROR: ' + error.message})
      );
  }

  postMushroom(c) {
    const token = this.tokenService.token;
    this.http.post('/api/mushrooms', {color: c}, {headers: {authorization: token}, responseType: 'text'})
      .subscribe(
        data => this.alerts.push({type: 'success', message: 'OK'}),
        error => this.alerts.push({type: 'danger', message: 'ERROR: ' + error.message})
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
