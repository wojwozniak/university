export const getPopupTitle = (isOpen: string): string => {
  switch (isOpen) {
    case 'DEL':
      return 'Delete book';
    case 'UPD':
      return 'Update book';
    case 'NEW':
      return 'Add new book';
    default: return ''
  }
}