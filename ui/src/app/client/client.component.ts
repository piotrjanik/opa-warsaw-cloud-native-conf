import {Component, OnInit} from '@angular/core';
import {NgbModal} from '@ng-bootstrap/ng-bootstrap';
import * as jwt from 'jsonwebtoken';
import {TokenService} from "../token.service";
// import crypto from 'jwa';
// require('crypto');

@Component({
  selector: 'app-client',
  templateUrl: './client.component.html',
  styleUrls: ['./client.component.scss']
})
export class ClientComponent implements OnInit {

  readonly users: Array<User>;
  currentUser: User;
  token: string;
  stringify = JSON.stringify;

  constructor(private modalService: NgbModal, private tokenService: TokenService) {
    this.users = [
      {id: 'smurf', name: 'Regular Smurf', role: 'smurf', department: 'forest'},
      {id: 'papa', name: 'Papa Smurf', role: 'papa', department: 'forest', age: 120},
      {id: 'gargamel', name: 'Gargamel', role: 'wizard', department: 'whatever'}
    ];
  }

  ngOnInit() {
  }

  open(content) {
    this.modalService.open(content, {size: 'lg'});
  }

  selectUser(user) {
    this.currentUser = user;
    this.token = jwt.sign(user, 'secret');
    this.tokenService.token = this.token;
  }

}


export interface User {
  id: string;
  name: string;
  role: string;
  department: string;
  age?: number;
}
