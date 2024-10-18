import React from 'react';
import { FaFacebook, FaTwitter, FaGithub } from 'react-icons/fa';
import { facebookLink, twitterLink, githubLink } from '../truth';

const icons = [
  {
    href: facebookLink.url,
    icon: <FaFacebook size="40" color='#1F2937' />
  },
  {
    href: twitterLink.url,
    icon: <FaTwitter size="40" color='#1F2937' />
  },
  {
    href: githubLink.url,
    icon: <FaGithub size="40" color='#1F2937' />
  }
];

const SocialBar: React.FC = () => {
  return (
    <div className="flex flex-row gap-10">
      {icons.map(({ href, icon }) => (
        <a key={href} href={href}>
          {icon}
        </a>
      ))}
    </div>
  );
};

export default SocialBar;