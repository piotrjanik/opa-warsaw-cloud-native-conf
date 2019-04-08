export interface Client {
    id: string;
    name: string;
    treasures: Array<Treasure>
}

export interface Treasure {
    id: string,
    name: string
}