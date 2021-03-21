export const formatDateString = (date: string) => {
  return new Date(date).toLocaleTimeString('en-us', { hour: 'numeric', minute: '2-digit' ,timeZone: 'UTC'});
};
