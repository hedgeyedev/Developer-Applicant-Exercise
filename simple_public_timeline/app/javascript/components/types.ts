export interface User {
  screen_name: string;
  url: string;
  profile_image_url: string;
}

export interface Tweet {
  user: User;
  created_at: string;
  source: string;
  text: string;
  id_str: string;
}
