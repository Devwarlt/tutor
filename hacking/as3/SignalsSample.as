/* libs and namespaces goes here! */

public class SignalSample extends Sprite {
    public function SignalsSample() {
        _toggle = new Signal(Boolean, Number);
        _toggel.add(this.ToggleInternalHUDElement); // when this signal is triggered it'll activate this private method

        _hud = new Vector.<Number>();

        for (var i:Number = 0; i < 4; i++) {
            var sprite:Sprite = new Sprite();
            sprite.graphics.clear();
            sprite.graphics.beginFill();
            sprite.graphics.lineStyle(2, 0xFFFFFF);
            sprite.graphics.drawRoundRect(0, i * 48 + 4, 196, 48, 4);
            sprite.graphics.filters = [new GlowFilter(0, 1, 10, 10, 1, 3)];

            _hud.push(sprite);
        }

        for each (var sprite:* in _hud)
            addChild(sprite);
    }

    private var _toggle:Signal; // this property will be used to synchronous trigger a method and toggle an specific HUD element
    private var _hud:Vector.<Sprite>; // this property is used to hold all HUD elements in a single vector of Sprite type.

    /**
     * This method is public and will be used to trigger signal and activate an internal method that can be managed with two
     * parameters:
     *
     * toggle:Boolean -> true / false to toggle and specific HUD element
     * index:Number -> an index value to toggle and specific HUD element
     */
    public function set ToggleHUD(toggle:Boolean, index:Number):void {
        _toggle.dispatch(toggle);
    }

    /**
     * This method is private and internal, used to trigger hidden HUD elements and is dynamic.
     */
    private function ToggleInternalHUDElement(toggle:Boolean, index:Number):void {
        if (index > 0 || index < _hud.length)
            _hud[index].visible = toggle;
    }
}
