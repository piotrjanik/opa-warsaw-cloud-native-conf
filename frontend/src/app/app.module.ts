import {BrowserModule} from '@angular/platform-browser';
import {NgModule} from '@angular/core';
import {NgbModule} from '@ng-bootstrap/ng-bootstrap';
import {AppComponent} from './app.component';
import {FormsModule} from '@angular/forms';
import {OAuthModule} from 'angular-oauth2-oidc';
import {HttpClientModule} from '@angular/common/http';
import {EnquiriesComponent} from './enquiries/enquiries.component';
import {RouterModule, Routes} from '@angular/router';
import { OrdersComponent } from './orders/orders.component';

const appRoutes: Routes = [];

@NgModule({
  declarations: [
    AppComponent,
    EnquiriesComponent,
    OrdersComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpClientModule,
    OAuthModule.forRoot(),
    NgbModule,
    RouterModule.forRoot(
      appRoutes,
      {enableTracing: true}
    )
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule {

}
