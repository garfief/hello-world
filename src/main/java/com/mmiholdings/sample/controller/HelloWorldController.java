package com.mmiholdings.sample.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import javax.portlet.PortletPreferences;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("view")
public class HelloWorldController {

    @RenderMapping
    public ModelAndView view(RenderRequest request, RenderResponse response, PortletPreferences portletPreferences) {

        Map<String, Object> model = new HashMap<>();
        model.put("windowID", getWindowID(request));
        model.put("actionUrl", response.createActionURL());

        return new ModelAndView("view", model);
    }

    private String getWindowID(RenderRequest request) {
        String windowID;
        if (request.getWindowID() != null) {
            windowID = request.getWindowID().replaceAll("[^a-zA-Z\\d]", "");
        } else {
            windowID = UUID.randomUUID().toString();
        }
        return windowID;
    }
}
