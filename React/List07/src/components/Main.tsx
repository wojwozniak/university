import * as Tabs from '@radix-ui/react-tabs';
import Account from './Account';
import Password from './Password';
import Preferences from './Preferences';

const Main = () => {
  const capitalize = (str: string) => {
    return str.charAt(0).toUpperCase() + str.slice(1);
  };

  const content = [
    { id: 'account', content: <Account /> },
    { id: 'password', content: <Password /> },
    { id: 'preferences', content: <Preferences /> }
  ];

  return (
    <div className="w-3/5 h-3/5 flex flex-row justify-between items-center mx-auto">
      <Tabs.Root defaultValue="account"
        orientation="horizontal"
        aria-label="Vertical Tabs"
        className="w-full h-full flex flex-row">
        <Tabs.List aria-label="Menu" className="flex flex-col w-1/10 p-2 h-full bg-gray-400">
          {content.map((tab) => (
            <Tabs.Trigger key={tab.id} value={tab.id} aria-label={`${tab.id} Tab`} className="cursor-pointer">
              {capitalize(tab.id)}
            </Tabs.Trigger>
          ))}
        </Tabs.List>
        {content.map((item) =>
          <Tabs.Content key={item.id} value={item.id} className="w-4/5 h-full p-2">
            {item.content}
          </Tabs.Content>
        )}
      </Tabs.Root>
    </div>
  );
}

export default Main;