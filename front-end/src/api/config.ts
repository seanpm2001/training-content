declare global {
  interface Window {
    configs: {
      apiUrl: string;
    };
  }
}

export const apiUrl = window?.configs?.apiUrl ? `${window.configs.apiUrl}/reservations` : "http://localhost:3000/reservations";
