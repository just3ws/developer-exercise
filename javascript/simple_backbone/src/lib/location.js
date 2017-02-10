export const IfDevEnv = ({ devEnv = null, prodEnv = null } = {}) => {
  if (/(localhost|127.0.0.1|\.dev$)/.test(window.location.hostname)) {
    return devEnv;
  } 
  return prodEnv;
};
