import {Customer} from "./customer.model";

export interface Enquiry {
  id: number;
  customer: Customer;
  message: string;
  resolved: boolean;
}
