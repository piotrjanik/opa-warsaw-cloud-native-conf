import {BrowserModule} from '@angular/platform-browser';
import {NgModule} from '@angular/core';
import {AppComponent} from './app.component';
import {ClientComponent} from './client/client.component';
import {ServicesComponent} from './services/services.component';
import {RouterModule, Routes} from '@angular/router';
import {HttpClientModule} from '@angular/common/http';
import {NgbAlertModule, NgbModalModule} from '@ng-bootstrap/ng-bootstrap';

const routes: Routes =
  [
    {
      path: '',
      component: ServicesComponent,
      data: {title: 'Heroes List'},
      outlet: 'services'
    },
    {
      path: '',
      component: ClientComponent,
      outlet: 'client'
    }
  ];

@NgModule({
  declarations: [
    AppComponent,
    ClientComponent,
    ServicesComponent],
  imports: [
    BrowserModule,
    RouterModule.forRoot(routes),
    HttpClientModule,
    NgbAlertModule,
    NgbModalModule
  ],
  providers: [ServicesComponent],
  bootstrap: [AppComponent]
})
export class AppModule {
}
