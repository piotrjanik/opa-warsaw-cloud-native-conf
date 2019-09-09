import {Injectable} from '@angular/core';
import {HttpClient, HttpErrorResponse} from '@angular/common/http';
import {OAuthService} from 'angular-oauth2-oidc';
import {Enquiry} from './enquiry.model';
import {AlertService} from '../alert.service';
import {throwError} from 'rxjs';
import {catchError} from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class EnquiriesService {

  constructor(private oauthService: OAuthService, private http: HttpClient, private alertService: AlertService) {
  }

  getAll() {
    return this.http
      .get<Enquiry[]>('/enquiries', {headers: {Authorization: 'Bearer ' + this.oauthService.getAccessToken()}})
      .pipe(catchError(this.catchError.bind(this)));
  }

  resolve(e: Enquiry) {
    e.resolved = true;
    return this.http
      .put<Enquiry>(`/enquiries/${e.id}`, e, {headers: {Authorization: 'Bearer ' + this.oauthService.getAccessToken()}})
      .pipe(catchError(this.catchError.bind(this)));
  }

  catchError(error: HttpErrorResponse) {
    this.alertService.sendMsg(error.message);
    return throwError(error.message);
  }
}
