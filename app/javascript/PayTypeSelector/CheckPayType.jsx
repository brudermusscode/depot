import React from 'react'
class CheckPayType extends React.Component {
  render() {

    const flexStyles = {
      gap: '1.2em'
    }

    return (
      <div className="disfl fldirrow" style={flexStyles}>
        <div className="field" style={{width:'50%'}}>
          <label htmlFor="order_routing_number">
          {I18n.t("orders.form.check_pay_type.routing_number")}
          </label>
          <input type="password"
          name="order[routing_number]"
          id="order_routing_number" />
        </div>
        <div className="field" style={{width:'50%'}}>
        <label htmlFor="order_acount_number">
        {I18n.t("orders.form.check_pay_type.account_number")}
        </label>
          <input type="text"
          name="order[account_number]"
          id="order_account_number" />
        </div>
      </div>
    );
  }
}
export default CheckPayType