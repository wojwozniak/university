import React from 'react'
import { useTheme } from '@emotion/react';
import { CustomTheme } from '../../themes';

const ContactForm = () => {
  const handleSubmit = (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();
  };

  const theme = useTheme() as CustomTheme;

  return (
    <form onSubmit={handleSubmit} className="contact-form" css={{
      maxWidth: '500px',
      margin: '0 auto',
      padding: '20px',
      borderRadius: '10px',
      display: 'flex',
      flexDirection: 'column',
      backgroundColor: theme.contactFormBackgroundColor,
      color: theme.contactFormColor,
      border: `1px solid ${theme.contactFormBorderColor}`
    }}>
      <div className="form-group" css={{
        marginBottom: '20px'
      }}>
        <input type="text"
          placeholder="Name"
          required
          css={{
            width: 'calc(100% - 20px)',
            padding: '10px',
            borderRadius: '5px',
            marginTop: '5px',
            backgroundColor: theme.contactInputBackgroundColor,
            color: theme.contactInputColor,
            border: `1px solid ${theme.contactInputBorderColor}`
          }} />
      </div>
      <div className="form-group" css={{
        marginBottom: '20px'
      }}>
        <input type="email"
          placeholder="Email"
          required
          css={{
            width: 'calc(100% - 20px)',
            padding: '10px',
            borderRadius: '5px',
            marginTop: '5px',
            backgroundColor: theme.contactInputBackgroundColor,
            color: theme.contactInputColor,
            border: `1px solid ${theme.contactInputBorderColor}`
          }} />
      </div>
      <div className="form-group" css={{
        marginBottom: '20px'
      }}>
        <textarea rows={5}
          placeholder="Message"
          required
          css={{
            resize: 'vertical',
            width: 'calc(100% - 20px)',
            padding: '10px',
            borderRadius: '5px',
            marginTop: '5px',
            backgroundColor: theme.contactInputBackgroundColor,
            color: theme.contactInputColor,
            border: `1px solid ${theme.contactInputBorderColor}`
          }}></textarea>
      </div>
      <button type="submit" css={{
        padding: '10px 20px',
        border: 'none',
        borderRadius: '5px',
        cursor: 'pointer',
        transition: 'background-color 0.3s ease',
        backgroundColor: theme.contactButtonBackgroundColor,
        color: theme.contactButtonColor,
        '&:hover': {
          backgroundColor: theme.contactButtonBackgroundColorHover
        }
      }}>
        Send Message
      </button>
    </form>
  )
}

export default ContactForm