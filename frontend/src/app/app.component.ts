import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  standalone: true,
  template: `
    <div style="text-align:center">
      <h1>Biblio Pro</h1>
      <p>Application de gestion de bibliothèque</p>
      <div>
        <button (click)="testBackend()">Test Backend</button>
        <p *ngIf="backendStatus">{{backendStatus}}</p>
      </div>
    </div>
  `
})
export class AppComponent {
  backendStatus = '';
  
  testBackend() {
    this.backendStatus = 'Backend connecté !';
  }
}