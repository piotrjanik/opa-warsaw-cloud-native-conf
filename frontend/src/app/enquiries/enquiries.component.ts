import {Component, OnInit} from '@angular/core';
import {interval} from 'rxjs';
import {switchMap} from 'rxjs/operators';
import {Enquiry} from './enquiry.model';
import {EnquiriesService} from './enquiries.service';

@Component({
  selector: 'app-enquiries',
  templateUrl: './enquiries.component.html',
  styleUrls: ['./enquiries.component.sass']
})
export class EnquiriesComponent implements OnInit {
  enquiries: Enquiry[];

  constructor(private enquiriesService: EnquiriesService) {
  }

  ngOnInit() {
    interval(3000)
      .pipe(switchMap(() => this.enquiriesService.getAll()))
      .subscribe(data => {
          this.enquiries = data;
        }
      );
  }

  resolve(e: Enquiry) {
    return this.enquiriesService.resolve(e).subscribe((resp) => console.log(resp));
  }
}
