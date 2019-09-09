export interface Order {
  id: number;
  items: Item[];
  status: string;

}

export interface Item {
  id: number;
  name: string;
}
