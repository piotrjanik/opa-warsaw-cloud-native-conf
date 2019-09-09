import {Component, OnInit} from '@angular/core';
import {AuthConfig, JwksValidationHandler, OAuthService} from 'angular-oauth2-oidc';
import {AlertService} from "./alert.service";

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {

  private claims: any;

  private authConfig: AuthConfig = {
    issuer: 'https://opa.do.piotrjanik.dev/auth/realms/my_realm',
    skipIssuerCheck: true,
    redirectUri: window.location.origin + '/',
    clientId: 'opa-demo',
    scope: 'profile email groups',
  };
  message: string;


  constructor(private oauthService: OAuthService, private alertService: AlertService) {
    this.configureWithNewConfigApi();
  }

  private configureWithNewConfigApi() {
    this.oauthService.configure(this.authConfig);
    this.oauthService.tokenValidationHandler = new JwksValidationHandler();
    this.oauthService.loadDiscoveryDocumentAndLogin();
    this.claims = this.oauthService.getIdentityClaims();
  }

  ngOnInit() {
    this.alertService.message
      .subscribe(data => {
          this.message = data;
        }
      );
  }

  close() {
    this.message = null;
  }
}
